import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class InfiniteListView extends StatefulWidget {
  @override
  _InfiniteListViewState createState() => _InfiniteListViewState();
}

class _InfiniteListViewState extends State<InfiniteListView> {
  static String loadmoreTag = '##loadMore##';
  var _words = [loadmoreTag];

  ScrollController _controller = ScrollController();
  bool _showToTopBtn = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _retrieveData();

    _controller.addListener(() {
      if (_controller.offset > 0 && !_showToTopBtn) {
        setState(() {
          _showToTopBtn = true;
        });
      } else if (_controller.offset <= 0 && _showToTopBtn) {
        setState(() {
          _showToTopBtn = false;
        });
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('InfiniteListView'),
      ),
      body: Column(
        children: [
          ListTile(title: Text('Header', style: TextStyle(color: Colors.black87))),
          Expanded(
            child: ListView.separated(
              controller: _controller,
              itemCount: _words.length,
              itemBuilder: (context, index) {
                //到表尾
                if (_words[index] == loadmoreTag) {
                  //数据不足100
                  if (_words.length < 100) {
                    //加载数据
                    _retrieveData();
                    return Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(16),
                      child: SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.0,
                        ),
                      ),
                    );
                  } else {
                    return Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(16),
                      child: Text(
                        '已经到底了',
                        style: TextStyle(color: Colors.grey),
                      ),
                    );
                  }
                } else {
                  return ListTile(
                    title: Text(
                      _words[index],
                      style: TextStyle(color: Colors.black87),
                    ),
                  );
                }
              },
              separatorBuilder: (context, index) => Divider(
                height: 0.5,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: !_showToTopBtn
          ? null
          : FloatingActionButton(
              child: Icon(Icons.arrow_upward),
              onPressed: () {
                _controller.animateTo(
                  0,
                  duration: Duration(milliseconds: 250),
                  curve: Curves.ease,
                );
              },
            ),
    );
  }

  //get data
  _retrieveData() {
    Future.delayed(Duration(seconds: 1)).then((e) {
      setState(() {
        _words.insertAll(
          _words.length - 1,
          generateWordPairs().take(20).map((t) {
            return t.asPascalCase;
          }).toList(),
        );
      });
    });
  }
}
