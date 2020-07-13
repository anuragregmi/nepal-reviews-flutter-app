import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  String title;
  String description;
  String location;
  String imageUrl;

  DetailPage(String text, String description, String location, String imageUrl) {
    this.title = text;
    this.description = description;
    this.location = location;
    this.imageUrl = imageUrl;
  }

  @override
  State<StatefulWidget> createState() {
    return DetailPageState();
  }
}

class DetailPageState extends State<DetailPage> {
  Widget titleSection() {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    widget.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  widget.location,
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          /*3*/
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          Text('41'),
        ],
      ),
    );
  }

  Widget textSection() {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Text(
        widget.description,
        softWrap: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: ListView(
          children: <Widget>[
            Image.network(
              widget.imageUrl,
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            titleSection(),
            textSection(),
          ],
        ),
      ),
    );
  }
}
