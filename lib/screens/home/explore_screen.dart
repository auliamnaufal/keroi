import 'package:flutter/material.dart';
import 'package:keroi/model/books.dart';

import '../../theme.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  TextEditingController _controller = TextEditingController();
  List<Book> allBooks = exploreBooks;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 15.0, left: 20.0, right: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Explore Books",
                    style: subHeadingStyle.copyWith(
                      fontSize: 24,
                    ),
                  ),
                  // Input field
                  const SizedBox(height: 20),
                  TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                        hintText: "What are you looking for?",
                        hintStyle: subHeadingStyle.copyWith(
                            fontSize: 14, fontWeight: FontWeight.w400),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(width: 1, color: Colors.black),
                        ),
                        filled: true,
                        fillColor: Colors.grey[100],
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        prefixIcon: Icon(Icons.search)),
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
                                    const SizedBox(height: 10),
                                    Container(
                                      width: 110,
                                      height: 40,
                                      decoration: BoxDecoration(
                                          color: Colors.blue.shade500,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: TextButton(
                                        onPressed: () {},
                                        child: const Text(
                                          "Buy Now",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
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

      print(bookTitle.contains(query));


      return bookTitle.contains(queryLowerCase);
    }).toList();

    setState(() {
      allBooks = suggestions;
    });
  }
}
