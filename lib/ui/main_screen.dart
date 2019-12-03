import 'package:flutter/material.dart';
import 'package:flutter_wanandroid_redux/ui/hoem_screen.dart';
import 'package:flutter_wanandroid_redux/widget/home_bottom_bar.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  int _selectedTab = 0;
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  String _getTitleText() {
    String title = "";
    switch (_selectedTab) {
      case 1:
        title = "Project";
        break;
      case 2:
        title = "Setting";
        break;
      default:
        title = "Home";
    }
    return title;
  }

  Widget _buildContent() {
    return Expanded(
      child: TabBarView(
        controller: _tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
          HomeScreen(titleText: "Home"),
          HomeScreen(titleText: "Project"),
          HomeScreen(titleText: "Setting"),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _getTitleText(),
          style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          _buildContent(),
          HomeBottomBar(
            selectedTab: _selectedTab,
            onTabChanged: (selectedTab) {
              setState(() {
                _selectedTab = selectedTab;
                _tabController.index = _selectedTab;
              });
            },
          )
        ],
      ),
    );
  }
}