import 'package:flutter/material.dart';
import 'package:keroi/screens/home/bookmark_screen.dart';
import 'package:keroi/screens/home/home_screen.dart';
import 'package:keroi/screens/home/explore_screen.dart';

class MainPage extends StatefulWidget {
  final username;
  const MainPage({Key? key, this.username}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  Widget customFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ExploreScreen()));
      },
      backgroundColor: Colors.blue.shade400,
      child: Icon(
        Icons.search,
        size: 24,
        color: Colors.white,
      ),
    );
  }

  Widget customBottomnav() {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
      child: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 12,
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
            backgroundColor: Colors.grey.shade200,
            type: BottomNavigationBarType.fixed,
            currentIndex: currentIndex,
            onTap: (value) {
              print(value);
              setState(() {
                currentIndex = value;
              });
            },
            items: [
              BottomNavigationBarItem(
                  icon: Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Icon(
                      Icons.home,
                      size: 24,
                      color: currentIndex == 0
                          ? Colors.blue.shade400
                          : Color(0xff808191),
                    ),
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Icon(
                      Icons.bookmark,
                      size: 24,
                      color: currentIndex == 1
                          ? Colors.blue.shade400
                          : Color(0xff808191),
                    ),
                  ),
                  label: ''),
            ]),
      ),
    );
  }

  Widget body(String username) {
    switch (currentIndex) {
      case 0:
        return HomeScreen(username: username);
        break;
      case 1:
        return BookmarkScreen();
        break;
      default:
        return HomeScreen(username: username);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: customBottomnav(),
      floatingActionButton: customFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: body(widget.username),
    );
  }
}
