import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  // // getting the feature of API
  // Future getFeature () async {
  //   var url = 'https://youtube-media-downloader.p.rapidapi.com/v2/video/details?videoId=G33j5Qi4rE8';
  //   var response = await http.get(Uri.parse(url));
  //   // var jsonData = jsonDecode(response.body);
  //   // return jsonData;
  //   print(response.body);
  // }

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 110,
        backgroundColor: Colors.indigo.shade900,
        titleSpacing: 20,
        title: Text(
          'PLAYLIST_App',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w800,
            fontSize: 24,
            fontStyle: FontStyle.italic
            ),
          ),
        leading: Icon(
          Icons.menu,
          color: Colors.white,
          size: 30,
        ),
      ),

      body: ListView(),
    );
  }
}