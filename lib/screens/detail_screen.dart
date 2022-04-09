import 'package:flutter/material.dart';
import 'package:keroi/model/books.dart';
import 'dart:math' as math;

class DetailScreen extends StatelessWidget {
  final Book book;
  final Color color;
  const DetailScreen({Key? key, required this.book, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              SizedBox(
                height: 400,
                child: Expanded(
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    padding: const EdgeInsets.all(30),
                    color: color,
                    child: SafeArea(
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
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () => Navigator.pop(context),
                    child: CircleAvatar(
                      radius: 24,
                      backgroundColor: Colors.black.withOpacity(0.2),
                      child: Icon(Icons.arrow_back),
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  book.title,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.person_rounded,
                      color: Colors.grey[700],
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      book.author,
                      style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                    )
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Text(book.description),
                SizedBox(
                  height: 12,
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
