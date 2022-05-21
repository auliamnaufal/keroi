import 'package:flutter/material.dart';
import 'package:keroi/model/books.dart';

import '../../theme.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
                  padding: const EdgeInsets.only(top: 15.0, left: 20.0, right: 20.0),
                  child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Explore Books",
                style: subHeadingStyle.copyWith(
                  fontSize: 26,
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    Book book = exploreBooks[index];
                    return Card(
                      elevation: 0,
                      child: ListTile(
                        leading: Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: NetworkImage(book.imageUrl),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        title: Text(book.title),
                        subtitle: Text(book.author),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        ),
                      ),
                    );
                  },
                  itemCount: exploreBooks.length,
                ),
              )
            ],
                  ),
                ),
          ),
        ));
  }
}
