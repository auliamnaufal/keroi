import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:keroi/helpers/Utils.dart';
import 'package:keroi/model/books.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../theme.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  TextEditingController _controller = TextEditingController();
  List<Book> allBooks = exploreBooks;

  bool _showBackToTopButton = false;

  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          if (_scrollController.offset >= 100) {
            _showBackToTopButton = true; // show the back-to-top button
          } else {
            _showBackToTopButton = false; // hide the back-to-top button
          }
        });
      });

    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose(); // dispose the controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: _showBackToTopButton == false
            ? null
            : FloatingActionButton(
                onPressed: _scrollToTop,
                child: const Icon(
                  Icons.arrow_upward,
                  color: Colors.black,
                ),
                backgroundColor: Colors.grey.shade100,
              ),
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.grey),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          elevation: 2,
          title: const Text(
            'Explore',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          controller: _scrollController,
          child: SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 15.0, left: 20.0, right: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: "What are you looking for?",
                      hintStyle: subHeadingStyle.copyWith(
                          fontSize: 14, fontWeight: FontWeight.w400),
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Colors.grey[100],
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _controller.clear();
                          searchBook;
                        },
                      ),
                    ),
                    onChanged: searchBook,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        Book book = allBooks[index];
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          width: double.infinity,
                          height: 250,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 5),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(12)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  book.imageUrl,
                                  width: 150,
                                  height: 200,
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      book.title,
                                      style: headingStyle.copyWith(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      book.author,
                                      style: subHeadingStyle.copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.grey),
                                    ),
                                    const SizedBox(height: 10),
                                    // price
                                    Text(
                                      book.price,
                                      style: subHeadingStyle.copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.grey),
                                    ),
                                    const SizedBox(height: 20),
                                    Container(
                                      width: 130,
                                      height: 40,
                                      decoration: BoxDecoration(
                                          color: Colors.blue.shade500,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: TextButton(
                                        onPressed: () {
                                          UtilsClass.addBookmark(book, context);
                                        },
                                        child: const Text(
                                          "Add to Bookmark",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      itemCount: allBooks.length,
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  void searchBook(String query) {
    print(query);
    final suggestions = exploreBooks.where((book) {
      final bookTitle = book.title.toLowerCase();
      final queryLowerCase = query.toLowerCase();

      return bookTitle.contains(queryLowerCase);
    }).toList();

    setState(() {
      allBooks = suggestions;
    });
  }

  void _scrollToTop() {
    _scrollController.animateTo(0,
        duration: const Duration(seconds: 2), curve: Curves.easeInOut);
  }
}
