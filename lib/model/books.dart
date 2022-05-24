import 'dart:convert';

class Book {
  Book({
    required this.title,
    required this.author,
    required this.imageUrl,
    required this.description,
    required this.price,
  });

  String title;
  String author;
  String imageUrl;
  String description;
  String price;

  factory Book.fromJson(Map<String, dynamic> jsonData) {
    return Book(
      title: jsonData['title'],
      author: jsonData['author'],
      imageUrl: jsonData['imageUrl'],
      description: jsonData['description'],
      price: jsonData['price'],
    );
  }

  static Map<String, dynamic> toMap(Book music) => {
        'title': music.title,
        'author': music.author,
        'imageUrl': music.imageUrl,
        'description': music.description,
        'price': music.price,
      };

  static String encode(List<Book> books) => json.encode(
        books
            .map<Map<String, dynamic>>((book) => Book.toMap(book))
            .toList(),
      );

  static List<Book> decode(String books) =>
      (json.decode(books) as List<dynamic>)
          .map<Book>((item) => Book.fromJson(item))
          .toList();
}

List<Book> books = [
  Book(
    title: 'The Alchemist',
    author: 'Paulo Coelho',
    imageUrl: 'https://blackwells.co.uk/jacket/l/9780008144227.jpg',
    description:
        'The Alchemist is a novel by Brazilian author Paulo Coelho. It is the story of Santiago, an Andalusian shepherd who lives in the Egyptian desert and dreams of finding a treasure buried in the Pyramids of Egypt. Santiagos dreams are fulfilled when he meets a Gypsys son named Santiago, and they embark on an adventure to find it.',
    price: '\$9.99',
  ),
  Book(
    title: "Harry Potter and the Sorcerer's Stone",
    author: 'J.K Rowling',
    imageUrl:
        'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1474154022l/3._SY475_.jpg',
    description:
        "Harry Potter's life is miserable. His parents are dead and he's stuck with his heartless relatives, who force him to live in a tiny closet under the stairs. But his fortune changes when he receives a letter that tells him the truth about himself: he's a wizard. A mysterious visitor rescues him from his relatives and takes him to his new home, Hogwarts School of Witchcraft and Wizardry. After a lifetime of bottling up his magical powers, Harry finally feels like a normal kid. But even within the Wizarding community, he is special. He is the boy who lived: the only person to have ever survived a killing curse inflicted by the evil Lord Voldemort, who launched a brutal takeover of the Wizarding world, only to vanish after failing to kill Harry. Though Harry's first year at Hogwarts is the best of his life, not everything is perfect. There is a dangerous secret object hidden within the castle walls, and Harry believes it's his responsibility to prevent it from falling into evil hands. But doing so will bring him into contact with forces more terrifying than he ever could have imagined. Full of sympathetic characters, wildly imaginative situations, and countless exciting details, the first installment in the series assembles an unforgettable magical world and sets the stage for many high-stakes adventures to come.",
    price: '\$12.59',
  ),
  Book(
    title: 'Hujan',
    author: 'Tere Liye',
    imageUrl:
        'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1451905281i/28446637.jpg',
    description:
        'Tentang persahabatan \nTentang cinta \nTentang perpisahan \nTentang melupakan \nTentang hujan',
    price: '\$3.99',
  ),
  Book(
    title: 'The Hobbit, or There and Back Again',
    author: 'J.R.R. Tolkien',
    imageUrl:
        'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1546071216i/5907.jpg',
    description:
        "In a hole in the ground there lived a hobbit. Not a nasty, dirty, wet hole, filled with the ends of worms and an oozy smell, nor yet a dry, bare, sandy hole with nothing in it to sit down on or to eat: it was a hobbit-hole, and that means comfort. Written for J.R.R. Tolkien’s own children, The Hobbit met with instant critical acclaim when it was first published in 1937. Now recognized as a timeless classic, this introduction to the hobbit Bilbo Baggins, the wizard Gandalf, Gollum, and the spectacular world of Middle-earth recounts of the adventures of a reluctant hero, a powerful and dangerous ring, and the cruel dragon Smaug the Magnificent. The text in this 372-page paperback edition is based on that first published in Great Britain by Collins Modern Classics (1998), and includes a note on the text by Douglas A. Anderson (2001).",
    price: '\$18.99',
  ),
];

List<Book> exploreBooks = [
  Book(
    title: 'The Alchemist',
    author: 'Paulo Coelho',
    imageUrl: 'https://blackwells.co.uk/jacket/l/9780008144227.jpg',
    description:
        'The Alchemist is a novel by Brazilian author Paulo Coelho. It is the story of Santiago, an Andalusian shepherd who lives in the Egyptian desert and dreams of finding a treasure buried in the Pyramids of Egypt. Santiagos dreams are fulfilled when he meets a Gypsys son named Santiago, and they embark on an adventure to find it.',
    price: '\$9.99',
  ),
  Book(
    title: "Harry Potter and the Sorcerer's Stone",
    author: 'J.K Rowling',
    imageUrl:
        'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1474154022l/3._SY475_.jpg',
    description:
        "Harry Potter's life is miserable. His parents are dead and he's stuck with his heartless relatives, who force him to live in a tiny closet under the stairs. But his fortune changes when he receives a letter that tells him the truth about himself: he's a wizard. A mysterious visitor rescues him from his relatives and takes him to his new home, Hogwarts School of Witchcraft and Wizardry. After a lifetime of bottling up his magical powers, Harry finally feels like a normal kid. But even within the Wizarding community, he is special. He is the boy who lived: the only person to have ever survived a killing curse inflicted by the evil Lord Voldemort, who launched a brutal takeover of the Wizarding world, only to vanish after failing to kill Harry. Though Harry's first year at Hogwarts is the best of his life, not everything is perfect. There is a dangerous secret object hidden within the castle walls, and Harry believes it's his responsibility to prevent it from falling into evil hands. But doing so will bring him into contact with forces more terrifying than he ever could have imagined. Full of sympathetic characters, wildly imaginative situations, and countless exciting details, the first installment in the series assembles an unforgettable magical world and sets the stage for many high-stakes adventures to come.",
    price: '\$12.59',
  ),
  Book(
    title: 'Hujan',
    author: 'Tere Liye',
    imageUrl:
        'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1451905281i/28446637.jpg',
    description:
        'Tentang persahabatan \nTentang cinta \nTentang perpisahan \nTentang melupakan \nTentang hujan',
    price: '\$3.99',
  ),
  Book(
    title: 'The Hobbit, or There and Back Again',
    author: 'J.R.R. Tolkien',
    imageUrl:
        'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1546071216i/5907.jpg',
    description:
        "In a hole in the ground there lived a hobbit. Not a nasty, dirty, wet hole, filled with the ends of worms and an oozy smell, nor yet a dry, bare, sandy hole with nothing in it to sit down on or to eat: it was a hobbit-hole, and that means comfort. Written for J.R.R. Tolkien’s own children, The Hobbit met with instant critical acclaim when it was first published in 1937. Now recognized as a timeless classic, this introduction to the hobbit Bilbo Baggins, the wizard Gandalf, Gollum, and the spectacular world of Middle-earth recounts of the adventures of a reluctant hero, a powerful and dangerous ring, and the cruel dragon Smaug the Magnificent. The text in this 372-page paperback edition is based on that first published in Great Britain by Collins Modern Classics (1998), and includes a note on the text by Douglas A. Anderson (2001).",
    price: '\$18.99',
  ),
  Book(
    title: 'The Alchemist',
    author: 'Paulo Coelho',
    imageUrl: 'https://blackwells.co.uk/jacket/l/9780008144227.jpg',
    description:
        'The Alchemist is a novel by Brazilian author Paulo Coelho. It is the story of Santiago, an Andalusian shepherd who lives in the Egyptian desert and dreams of finding a treasure buried in the Pyramids of Egypt. Santiagos dreams are fulfilled when he meets a Gypsys son named Santiago, and they embark on an adventure to find it.',
    price: '\$9.99',
  ),
  Book(
    title: "Harry Potter and the Sorcerer's Stone",
    author: 'J.K Rowling',
    imageUrl:
        'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1474154022l/3._SY475_.jpg',
    description:
        "Harry Potter's life is miserable. His parents are dead and he's stuck with his heartless relatives, who force him to live in a tiny closet under the stairs. But his fortune changes when he receives a letter that tells him the truth about himself: he's a wizard. A mysterious visitor rescues him from his relatives and takes him to his new home, Hogwarts School of Witchcraft and Wizardry. After a lifetime of bottling up his magical powers, Harry finally feels like a normal kid. But even within the Wizarding community, he is special. He is the boy who lived: the only person to have ever survived a killing curse inflicted by the evil Lord Voldemort, who launched a brutal takeover of the Wizarding world, only to vanish after failing to kill Harry. Though Harry's first year at Hogwarts is the best of his life, not everything is perfect. There is a dangerous secret object hidden within the castle walls, and Harry believes it's his responsibility to prevent it from falling into evil hands. But doing so will bring him into contact with forces more terrifying than he ever could have imagined. Full of sympathetic characters, wildly imaginative situations, and countless exciting details, the first installment in the series assembles an unforgettable magical world and sets the stage for many high-stakes adventures to come.",
    price: '\$12.59',
  ),
  Book(
    title: 'Hujan',
    author: 'Tere Liye',
    imageUrl:
        'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1451905281i/28446637.jpg',
    description:
        'Tentang persahabatan \nTentang cinta \nTentang perpisahan \nTentang melupakan \nTentang hujan',
    price: '\$3.99',
  ),
  Book(
    title: 'The Hobbit, or There and Back Again',
    author: 'J.R.R. Tolkien',
    imageUrl:
        'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1546071216i/5907.jpg',
    description:
        "In a hole in the ground there lived a hobbit. Not a nasty, dirty, wet hole, filled with the ends of worms and an oozy smell, nor yet a dry, bare, sandy hole with nothing in it to sit down on or to eat: it was a hobbit-hole, and that means comfort. Written for J.R.R. Tolkien’s own children, The Hobbit met with instant critical acclaim when it was first published in 1937. Now recognized as a timeless classic, this introduction to the hobbit Bilbo Baggins, the wizard Gandalf, Gollum, and the spectacular world of Middle-earth recounts of the adventures of a reluctant hero, a powerful and dangerous ring, and the cruel dragon Smaug the Magnificent. The text in this 372-page paperback edition is based on that first published in Great Britain by Collins Modern Classics (1998), and includes a note on the text by Douglas A. Anderson (2001).",
    price: '\$18.99',
  ),
];

