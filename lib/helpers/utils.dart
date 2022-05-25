import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/books.dart';

class UtilsClass {
  static SnackBar deleteSnackBar(Book book, context) {
    return SnackBar(
      content: Text("Deleted " + book.title),
      backgroundColor: (Colors.black54),
      action: SnackBarAction(
        label: 'UNDO',
        onPressed: () {
          UtilsClass.addBookmark(book, context);
        },
        textColor: Colors.white,
      ),
      duration: const Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
    );
  }

  static SnackBar cantAddSnackBar(Book book) {
    return SnackBar(
      content: Text("Already Bookmarked " + book.title),
      backgroundColor: (Colors.black54),
      duration: const Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
    );
  }

  static SnackBar successAddSnackBar(Book book) {
    return SnackBar(
      content: Text(book.title + " Bookmarked"),
      backgroundColor: (Colors.black54),
      duration: const Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
    );
  }

  // get all data from shared preferences
  static Future<List<Book>> getBookmarks() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? undecodedBookmarks = prefs.getString('book_key');

    final List<Book> bookmarks = Book.decode(undecodedBookmarks!);

    return bookmarks;
  }

  // add data to shared preferences
  static Future<void> addBookmark(Book book, context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? previousDataString = prefs.getString('book_key');

    List<Book>? previousData =
        previousDataString == null ? null : Book.decode(previousDataString);

    if (previousData == null) {
      final List<Book> books = [book];
      prefs.setString('book_key', Book.encode(books));
    } else {
      final List<Book> books = [...previousData, book];
      
      // check if book is already bookmarked
      if (previousData.any((cBook) => cBook.title == book.title)) {
        ScaffoldMessenger.of(context).showSnackBar(cantAddSnackBar(book));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(successAddSnackBar(book));
        prefs.setString('book_key', Book.encode(books));
      }

    }
  }

  // remove data from shared preferences
  static Future<void> removeBookmark(int index) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? previousDataString = prefs.getString('book_key');

    List<Book>? previousData =
        previousDataString == null ? null : Book.decode(previousDataString);

    if (previousData == null) {
      return;
    } else {
      final List<Book> books = [...previousData];
      books.remove(books[index]);
      prefs.setString('book_key', Book.encode(books));
    }
  }
}
