import 'package:flutter/material.dart';
import 'dart:async';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  ScrollController _scrollController = ScrollController();

  List<int> _numerList = [];
  int _lastItem = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    _addNews();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List View Builder"),
      ),
      body: Stack(
        children: [
          _createList(),
          _createLoading(),
        ],
      ),
    );
  }

  Widget _createList() {
    return RefreshIndicator(
      onRefresh: getResults,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _numerList.length,
        itemBuilder: (context, index) {
          final image = _numerList[index];

          return FadeInImage(
            placeholder: AssetImage("assets/jar-loading.gif"),
            image: NetworkImage("https://picsum.photos/500/300/?image=$image"),
          );
        },
      ),
    );
  }

  Future<Null> getResults() async {
    final duration = Duration(seconds: 2);

    Timer(duration, () {
      _numerList.clear();
      _lastItem++;
      _addNews();
    });

    return Future.delayed(duration);
  }

  void _addNews() {
    for (var i = 0; i < 10; i++) {
      _lastItem++;
      _numerList.add(_lastItem);
    }

    setState(() {});
  }

  Future _fetchData() async {
    setState(() {
      _isLoading = true;
    });

    final duration = Duration(seconds: 2);

    return Timer(duration, _httpResponse);
  }

  void _httpResponse() {
    _isLoading = false;

    _scrollController.animateTo(_scrollController.position.pixels + 100,
        duration: Duration(microseconds: 250), curve: Curves.fastOutSlowIn);

    _addNews();
  }

  Widget _createLoading() {
    if (_isLoading)
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
            ],
          ),
          SizedBox(height: 15.0),
        ],
      );

    return Container();
  }
}
