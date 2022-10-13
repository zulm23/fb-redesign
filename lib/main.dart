import 'package:facebook_redesign/data_dummy.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            // color: Colors.amber,
            padding:
                const EdgeInsets.only(top: 50, right: 20, left: 20, bottom: 10),
            height: 120,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey[200],
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                          hintText: "Search..",
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey,
                          )),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Icon(
                  Icons.camera_alt_outlined,
                  size: 30,
                  color: Colors.grey[800],
                )
              ],
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        'Stories',
                        style: TextStyle(
                            color: Colors.grey[900],
                            fontSize: 22,
                            letterSpacing: 1.2,
                            fontWeight: FontWeight.bold),
                      ),
                      const Text('See Archive'),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 180,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        makeStory(
                            storyImage: dataDummy[0]['storyImage'],
                            userImage: dataDummy[0]['userImage'],
                            userName: dataDummy[0]['userName']),
                        makeStory(
                            storyImage: dataDummy[1]['storyImage'],
                            userImage: dataDummy[1]['userImage'],
                            userName: dataDummy[1]['userName']),
                        makeStory(
                            storyImage: dataDummy[2]['storyImage'],
                            userImage: dataDummy[2]['userImage'],
                            userName: dataDummy[2]['userName']),
                        makeStory(
                            storyImage: dataDummy[3]['storyImage'],
                            userImage: dataDummy[3]['userImage'],
                            userName: dataDummy[3]['userName']),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  makeFeed(
                      userName: dataDummy[3]['userName'],
                      userImage: dataDummy[3]['userImage'],
                      feedTime: '1 hour ago',
                      feedText:
                          'All the lorem ipsum generator on tend to repeat predefined',
                      feedImage: dataDummy[3]['storyImage']),
                  makeFeed(
                      userName: dataDummy[0]['userName'],
                      userImage: dataDummy[0]['userImage'],
                      feedTime: '1 hour ago',
                      feedText:
                          ' All the lorem ipsum generator on tend to repeat predefined All the lorem ipsum generator on tend to repeat predefinedAll the lorem ipsum generator on tend to repeat predefinedAll the lorem ipsum generator on tend to repeat predefined',
                      feedImage: ''),
                  makeFeed(
                      userName: dataDummy[2]['userName'],
                      userImage: dataDummy[2]['userImage'],
                      feedTime: '1 hour ago',
                      feedText:
                          'All the lorem ipsum generator on tend to repeat predefined',
                      feedImage: dataDummy[2]['storyImage']),
                  makeFeed(
                      userName: dataDummy[1]['userName'],
                      userImage: dataDummy[1]['userImage'],
                      feedTime: '1 hour ago',
                      feedText:
                          'All the lorem ipsum generator on tend to repeat predefined',
                      feedImage: dataDummy[1]['storyImage']),
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}

Widget makeFeed({userName, userImage, feedTime, feedText, feedImage}) {
  return Container(
    margin: const EdgeInsets.only(bottom: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(userImage),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userName,
                      style: TextStyle(
                          color: Colors.grey[900],
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1),
                    ),
                    Text(
                      feedTime,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    )
                  ],
                ),
              ],
            ),
            IconButton(
              onPressed: () {
                debugPrint(dataDummy[0]['storyImage']);
              },
              icon: Icon(
                Icons.more_horiz,
                size: 30,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Text(
          feedText,
          style: TextStyle(
              fontSize: 15,
              color: Colors.grey[800],
              height: 1.5,
              letterSpacing: .7),
        ),
        const SizedBox(height: 20),
        feedImage != ''
            ? Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  image: DecorationImage(
                      image: AssetImage(feedImage), fit: BoxFit.cover),
                ),
              )
            : Container(),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                makeLike(),
                Transform.translate(
                  offset: const Offset(-5, 0),
                  child: makeLove(),
                ),
                const SizedBox(width: 5),
                Text(
                  "2.5K",
                  style: TextStyle(fontSize: 13, color: Colors.grey[800]),
                ),
              ],
            ),
            Text(
              "400 Comments",
              style: TextStyle(fontSize: 15, color: Colors.grey[800]),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            makeLikeButton(),
            makeCommentButton(),
            makeShareButton(),
          ],
        )
      ],
    ),
  );
}

Widget makeLike() {
  return Container(
    width: 25,
    height: 25,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.blue,
      border: Border.all(color: Colors.white),
    ),
    child: const Center(
      child: Icon(
        Icons.thumb_up,
        size: 12,
        color: Colors.white,
      ),
    ),
  );
}

Widget makeLove() {
  return Container(
    width: 25,
    height: 25,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.red,
      border: Border.all(color: Colors.white),
    ),
    child: const Center(
      child: Icon(
        Icons.favorite,
        size: 12,
        color: Colors.white,
      ),
    ),
  );
}

Widget makeLikeButton({isActive = true}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey.shade800),
      borderRadius: BorderRadius.circular(50),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.thumb_up,
          color: isActive ? Colors.blue : Colors.grey,
          size: 18,
        ),
        const SizedBox(width: 5),
        Text(
          "Like",
          style: TextStyle(color: isActive ? Colors.blue : Colors.grey),
        )
      ],
    ),
  );
}

Widget makeCommentButton({isActive = true}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey.shade800),
      borderRadius: BorderRadius.circular(50),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(
          Icons.chat,
          color: Colors.grey,
          size: 18,
        ),
        SizedBox(width: 5),
        Text(
          "Chat",
          style: TextStyle(color: Colors.grey),
        )
      ],
    ),
  );
}

Widget makeShareButton({isActive = true}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey.shade800),
      borderRadius: BorderRadius.circular(50),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(
          Icons.share,
          color: Colors.grey,
          size: 18,
        ),
        SizedBox(width: 5),
        Text(
          "Share",
          style: TextStyle(color: Colors.grey),
        )
      ],
    ),
  );
}

Widget makeStory({storyImage, userImage, userName}) {
  return AspectRatio(
    aspectRatio: 1.6 / 2,
    child: Container(
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(storyImage),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            colors: [
              Colors.red.withOpacity(.9),
              Colors.black.withOpacity(.1),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(userImage),
                ),
              ),
            ),
            Text(
              userName,
              style: const TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    ),
  );
}
