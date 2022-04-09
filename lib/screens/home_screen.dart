import 'package:flutter/material.dart';
import 'package:keroi/model/books.dart';
import 'package:keroi/screens/detail_screen.dart';
import 'dart:math' as math;

class HomeScreen extends StatefulWidget {
  final String username;

  const HomeScreen({Key? key, required this.username}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

TextStyle _subHeadingStyle = const TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w600,
);

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
    return Scaffold(
      body: SingleChildScrollView(
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
                SizedBox(
                  height: 50,
                  child: Expanded(
                    flex: 1,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.grey.withOpacity(0.1)),
                      child: Row(
                        children: [
                          const Icon(Icons.search, color: Colors.black38),
                          const SizedBox(width: 10),
                          Expanded(
                            child: TextFormField(
                              textAlign: TextAlign.left,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "Type here to search",
                                alignLabelWithHint: true,
                                hintStyle: TextStyle(color: Colors.black38),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "Populer Genre",
                  style: _subHeadingStyle,
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
                  '"$_selectedGenre" Genre',
                  style: _subHeadingStyle,
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
                                          borderRadius:
                                              BorderRadius.circular(14),
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
                                    Text(
                                      book.title,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
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
                                          fontSize: 12,
                                          color: Colors.grey[700]),
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
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        focusElevation: 0,
                                        hoverElevation: 0,
                                        highlightElevation: 0,
                                        child: Text(
                                          "Buy Book for ${book.price}",
                                          style: TextStyle(
                                              color: Colors.grey[800]),
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
