import 'package:flutter/material.dart';
import 'package:flutter_continental/pages/notifications_page.dart';
import 'package:flutter_continental/pages/third_page.dart';
import 'package:flutter_continental/pages/welcome_page.dart';

class PageViewWidget extends StatefulWidget {
  const PageViewWidget({Key? key}) : super(key: key);

  @override
  _PageViewState createState() => _PageViewState();
}

class _PageViewState extends State<PageViewWidget> {
  final PageController _pageController = PageController(initialPage: 1);
  int _activePage = 0;

  final List<Widget> _pages = [
    const NotificationsPage(),
    const WelcomePage(),
    const ThirdPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            scrollDirection: Axis.vertical,
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _activePage = page;
              });
            },
            itemCount: _pages.length,
            itemBuilder: (BuildContext context, int index) {
              return _pages[index % _pages.length];
            }
          )
        ],
      ),
    );
  }
}
