import 'dart:convert';

import 'package:dataproject/Pagenation/Model/ModelClass.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class PagenationScreen extends StatefulWidget {
  const PagenationScreen({super.key});

  @override
  State<PagenationScreen> createState() => _PagenationScreenState();
}

class _PagenationScreenState extends State<PagenationScreen> {
  static const base = "https://courtn.digitaezonline.com";
  static const user = base + "/api/users";
  //final _baseUrl = 'https://jsonplaceholder.typicode.com/posts';

  //int _page = 1;
  int current_page = 1;

  //final int _limit = 15;
  final int per_page = 15;
  bool _isFirstLoadRunning = false;
  bool _hasNextPage = true;

  bool _isLoadMoreRunning = false;

  List _posts = [];

  void _loadMore() async {
    if (_hasNextPage == true &&
        _isFirstLoadRunning == false &&
        _isLoadMoreRunning == false &&
        _controller.position.extentAfter < 300) {
      setState(() {
        _isLoadMoreRunning = true; // Display a progress indicator at the bottom
      });

      current_page += 1; // Increase _page by 1

      try {
        final res = await http
            .get(Uri.parse("$user?_page=$current_page&_limit=$per_page"));
        print(res);

        final List fetchedPosts = json.decode(res.body);

        // print(fetchedPosts);
        if (fetchedPosts.isNotEmpty) {
          setState(() {
            _posts.addAll(fetchedPosts);
            print(fetchedPosts);
          });
        } else {
          setState(() {
            _hasNextPage = false;
          });
        }
      } catch (err) {
        if (kDebugMode) {
          print('Something went wrong!');
        }
      }

      setState(() {
        _isLoadMoreRunning = false;
      });
    }
  }

  void _firstLoad() async {
    setState(() {
      _isFirstLoadRunning = true;
    });

    try {
      final res = await http
          .get(Uri.parse("$user?_page=$current_page&_limit=$per_page"));
      setState(() {
        print(json.decode(res.body));
        _posts = json.decode(res.body);
        print(_posts);
      });
    } catch (err) {
      if (kDebugMode) {
        print('Something went wrong');
      }
    }

    setState(() {
      _isFirstLoadRunning = false;
    });
  }

  late ScrollController _controller;
  @override
  void initState() {
    super.initState();
    _firstLoad();
    _controller = ScrollController()..addListener(_loadMore);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Your news',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: _isFirstLoadRunning
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: _posts.length,
                      controller: _controller,
                      itemBuilder: (_, index) => Card(
                        margin: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 10),
                        child: ListTile(
                          title: Text(_posts[index]['name']),
                          // subtitle: Text(_posts[index]['body']),
                        ),
                      ),
                    ),
                  ),
                  if (_isLoadMoreRunning == true)
                    const Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 40),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  if (_hasNextPage == false)
                    Container(
                      padding: const EdgeInsets.only(top: 30, bottom: 40),
                      color: Colors.amber,
                      child: const Center(
                        child: Text('You have fetched all of the content'),
                      ),
                    ),
                ],
              ));
  }
}
