import 'package:flutter/material.dart';
import 'package:keroi/helpers/Utils.dart';
import 'package:keroi/screens/home/explore_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/books.dart';

class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({Key? key}) : super(key: key);

  @override
  State<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  @override
  void initState() {
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<SharedPreferences>(
        future: SharedPreferences.getInstance(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final SharedPreferences? prefs = snapshot.data;
            final String? undecodedBookmarks = prefs?.getString('book_key');

            final List<Book> bookmarks = Book.decode(undecodedBookmarks!);

            if (bookmarks.length <= 0) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('No Bookmarks', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                    SizedBox(height: 10),
                    TextButton(
                      child: Text('Add Bookmarks', style: TextStyle(fontSize: 14, color: Colors.blue.shade500)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ExploreScreen()));
                      },
                    )
                  ],
                ),
              );
            }

            return ListView.builder(
              itemCount: bookmarks.length,
              itemBuilder: (context, index) {
                final Book book = exploreBooks
                    .firstWhere((book) => book.title == bookmarks[index].title);

                return ListTile(
                  title: Text(book.title),
                  subtitle: Text(book.author),
                  leading: Image.network(
                    book.imageUrl,
                    width: 60,
                    height: 80,
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () async {

                      final snackBar = UtilsClass.snackBar(bookmarks[index]);

                      UtilsClass.removeBookmark(index);

                      ScaffoldMessenger.of(context).showSnackBar(snackBar);

                      setState(() {});
                      // refresh the list
                    },
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Future<List<Book>> getData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final String? booksString = await prefs.getString('book_key');

    final List<Book> book = Book.decode(booksString!);
    return book;
  }
}
