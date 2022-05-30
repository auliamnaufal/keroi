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

  static Map<String, dynamic> toMap(Book book) => {
        'title': book.title,
        'author': book.author,
        'imageUrl': book.imageUrl,
        'description': book.description,
        'price': book.price,
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
    title: 'Atomic Habits: An Easy & Proven Way to Build Good Habits & Break Bad Ones',
    author: 'James Clear',
    imageUrl: 'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1535115320i/40121378.jpg',
    description:
        "No matter your goals, Atomic Habits offers a proven framework for improving--every day. James Clear, one of the world's leading experts on habit formation, reveals practical strategies that will teach you exactly how to form good habits, break bad ones, and master the tiny behaviors that lead to remarkable results. If you're having trouble changing your habits, the problem isn't you. The problem is your system. Bad habits repeat themselves again and again not because you don't want to change, but because you have the wrong system for change. You do not rise to the level of your goals. You fall to the level of your systems. Here, you'll get a proven system that can take you to new heights. Clear is known for his ability to distill complex topics into simple behaviors that can be easily applied to daily life and work. Here, he draws on the most proven ideas from biology, psychology, and neuroscience to create an easy-to-understand guide for making good habits inevitable and bad habits impossible. Along the way, readers will be inspired and entertained with true stories from Olympic gold medalists, award-winning artists, business leaders, life-saving physicians, and star comedians who have used the science of small habits to master their craft and vault to the top of their field.",
    price: '\$11.99',
  ),
  Book(
    title: "Filosofi Teras",
    author: 'Henry Manampiring',
    imageUrl:
        'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1548033656i/42861019.jpg',
    description:
        "Apakah kamu sering merasa khawatir akan banyak hal? baperan? susah move-on? mudah tersinggung dan marah-marah di social media maupun dunia nyata? Lebih dari 2.000 tahun lalu, sebuah mazhab filsafat menemukan akar masalah dan juga solusi dari banyak emosi negatif. Stoisisme, atau Filosofi Teras, adalah filsafat Yunani-Romawi kuno yang bisa membantu kita mengatasi emosi negatif dan menghasilkan mental yang tangguh dalam menghadapi naik-turunnya kehidupan. Jauh dari kesan filsafat sebagai topik berat dan mengawang-awang, Filosofi Teras justru bersifat praktis dan relevan dengan kehidupan Generasi Milenial dan Gen-Z masa kini.",
    price: '\$6.59',
  ),
  Book(
    title: "Nalar Tasawuf Sebagai Revolusi Pendidikan Islam",
    author: 'Istania Widayati Hidayati',
    imageUrl:
        'https://penerbitbukudeepublish.com/wp-content/uploads/2019/09/NALAR-TASAWUF-DALAM-PENDIDIKAN-ISLAM_Istania-Widayati-Hidayati-M.Pd-depan-scaled.jpg',
    description:
        "Buku islam best seller yang kedua adalah buku berjudul Nalar Tasawuf Sebagai Revolusi Pendidikan Islam, karya Istania Widayati Hidayati. Buku ini cocok buat kamu yang tertarik ingin belajar tasawuf ini. Buku ini pastinya sangat bermanfaat buat kamu. Bahkan kamu yang tidak memiliki dasar pendidikan tasawuf, tetap bisa memahami. Karena di bab awal, ditulis pengantar tasawuf pendidikan. Buku islam best seller juga akan memperkenalkan tasawuf klasik menuju tasawuf revolusioner. Nah, di bab ini memang sedikit menarik untuk diulas. Karena di dalamnya tentu saja ada banyak hal yang bisa kamu pelajari. Dari tadi mengulas tentang tasawuf, tetapi belum tahu tasawuf itu apa? Jadi tasawuf adalah cabang ilmu yang tidak mudah pudar eksistensinya. Dapat dikatakan bahwa tasawuf mengendalikan ruh manusia agar tidak terkontaminasi dengan keduniawiaan yang terus maju dan berkembang. Di sana kamu pun akan mempelajari praktik tasawuf itu apa saja, karena di sana ada banyak sekali aliran tasawuf yang bisa kamu pelajari. Tahukah kamu, jika orang yang mempelajari tasawuf bisa mendapatkan gelar sufi. sayangnya tidak semua orang yang mempelajari tasawuf bisa mendapatkan gelar ini. Hanya orang yang sudah benar-benar mempraktekan saja. Jika masih ada yang binggung apa itu sufi, kamu juga bisa pelajari di dalam bukunya ini.",
    price: '\$2.59',
  ),
  Book(
    title: "Secrets of Divine Love: Sebuah Perjalanan Spiritual yang Mendalam tentang Islam",
    author: 'A. Helwa',
    imageUrl:
        'https://www.gramedia.com/blog/content/images/2022/04/WhatsApp_Image_2022-01-06_at_08.45.44.jpeg',
    description:
        "Menjadi buku best-seller #1 International, buku ini menggunakan pendekatan rasional namun berbasis Al-Qur'an. Tentunya mencerahkan pikiran dan menginspirasi jiwa menuju keintiman yang lebih dalam dengan Tuhan. Dengan merangkai puluhan kisah yang menginspirasi, ayat-ayat Al-Qur'an, Hadis, puisi Rumi dan Hafez, psikologi dan sains, penulis menjelaskan Islam dengan cara yang mudah dicerna dan menginspirasi bagi milenial Muslim.",
    price: '\$6.59',
  ),
  Book(
    title: "Find Your Why: A Practical Guide to Discovering Purpose for You and Your Team",
    author: 'Simon Sinek',
    imageUrl:
        'https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1460908316i/29496432.jpg',
    description:
        "The next step for applying the life-changing lessons of the bestseller Start With Why.With Start With Why, Simon Sinek inspired a movement to build a world in which the vast majority of us can feel safe while we are at work and fulfilled when we go home at night. However, many people have had trouble bringing the book's message into their own career and company. Now, along with two of his colleagues, Peter Docker and David Mead, he has created a guide to the most important step any business can take: finding your why. This easy-to-follow guide starts with the search for your personal why, and then expands to helping your colleagues find your organization's why. With detailed instructions on every stage in the process, the book also answer common concerns, such as: What if my why sounds like my competitor's? Can you have more than one why? And, if my work doesn't match my why, what do I do? Whether you're entry level or a CEO, whether your team is run by the founder or a recent hire, these simple steps will lead you on a path to a more fulfilling life and longterm success for you and your colleagues.",
    price: '\$12.99',
  ),
];

