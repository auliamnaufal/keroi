import 'package:flutter/material.dart';
import 'package:keroi/model/books.dart';
import 'package:keroi/screens/detail_screen.dart';
import 'package:keroi/theme.dart';
import 'dart:math' as math;

class HomeScreen extends StatefulWidget {
  final String username;

  const HomeScreen({Key? key, required this.username}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int? _selected = 0;
  String? _selectedGenre = "Novel";

  int _index = 0;
  List<Color> colorList = [];

  @override
  void initState() {
    super.initState();
    for (var i in books) {
      setState(() {
        colorList.add(Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
            .withOpacity(0.4));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 15.0, left: 20.0, right: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage('images/avatar.webp'),
                    radius: 25,
                  ),
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.grey.withOpacity(0.1),
                    child: IconButton(
                      icon: const Icon(
                        Icons.qr_code_scanner_outlined,
                        color: Colors.black54,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Text(
                'Hello, ${widget.username}!',
                style: const TextStyle(
                    fontSize: 24,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: 250,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.network(
                      books[0].imageUrl,
                      height: 220,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Continue Reading",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey.shade500,
                          ),
                        ),
                        SizedBox(height: 20,),
                        Text(
                          books[0].title,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5,),

                        Text(
                          books[0].author,
                           style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade500,),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  SlideRightRoute(page: DetailScreen(book: books[0], color: colorList[0])));
                            },
                            child: Row(
                              children: const [
                                Text(
                                  'Continue Reading',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                                Icon(Icons.arrow_forward, size: 18, color: Colors.blue,)
                              ],
                            )
                        )
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Populer Genre",
                style: subHeadingStyle,
              ),
              Wrap(
                children: [
                  _genre(0, text: "Novel", icon: Icons.book_outlined),
                  _genre(1, text: "Sport", icon: Icons.sports_motorsports),
                  _genre(2, text: "Crime", icon: Icons.fireplace),
                  _genre(3, text: "Science", icon: Icons.science),
                  _genre(4, text: "Self-Help", icon: Icons.psychology),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                'Your Library',
                style: subHeadingStyle,
              ),
              Text(
                "$_selectedGenre",
                style: subHeadingStyle.copyWith(
                  fontSize: 14,
                  color: Colors.grey.shade600
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0, top: 12),
                child: SizedBox(
                  height: 450, // card height
                  child: PageView.builder(
                    itemCount: books.length,
                    controller: PageController(viewportFraction: 0.75),
                    onPageChanged: (int index) =>
                        setState(() => _index = index),
                    itemBuilder: (_, i) {
                      final Book book = books[i];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Transform.scale(
                            scale: i == _index ? 1 : 0.9,
                            child: Container(
                              padding: EdgeInsets.only(bottom: 12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 10,
                                    offset: const Offset(0, 5),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: double.infinity,
                                      width: double.infinity,
                                      padding: const EdgeInsets.all(30),
                                      decoration: BoxDecoration(
                                          color: colorList[i],
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20))),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(14),
                                        child: Hero(
                                          tag: book.imageUrl,
                                          child: Image.network(
                                            book.imageUrl,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Text(
                                      book.title,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0),
                                    child: Text(
                                      book.description,
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Text(
                                    book.author,
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.grey[700]),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  MaterialButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (builder) =>
                                                    DetailScreen(
                                                      book: book,
                                                      color: colorList[i],
                                                    )));
                                      },
                                      color: Colors.grey[200],
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      focusElevation: 0,
                                      hoverElevation: 0,
                                      highlightElevation: 0,
                                      child: Text(
                                        "Read Book",
                                        style:
                                            TextStyle(color: Colors.grey[800]),
                                      ))
                                ],
                              ),
                            )),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _genre(int index, {String? text, IconData? icon}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6),
      child: InkResponse(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          decoration: BoxDecoration(
              color: _selected == index ? Colors.blueAccent : Colors.grey[200],
              borderRadius: BorderRadius.circular(100)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 20,
                color: _selected == index ? Colors.white : Colors.black,
              ),
              const SizedBox(
                width: 12,
              ),
              Text(text!,
                  style: TextStyle(
                      color: _selected == index ? Colors.white : Colors.black)),
            ],
          ),
        ),
        onTap: () => setState(
          () {
            _selected = index;
            _selectedGenre = text;
          },
        ),
      ),
    );
  }
}

class SlideRightRoute extends PageRouteBuilder {
  final Widget page;
  SlideRightRoute({required this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(-1, 0),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              ),
        );
}