import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final Widget titleSection = Container(
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
                  'Siddhartha Hotel',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                'Nepalgunj, Banke',
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
  final Widget textSection = Container(
    padding: const EdgeInsets.all(32),
    child: Text(
      "Hotel Siddhartha has a restaurant, bar, a shared lounge and garden in Nepālganj"
          ". Boasting room service, this property also provides guests with a casino. The hotel features an outdoor swimming pool, fitness centre, evening entertainment and a 24-hour front desk."

      "The hotel offers a continental or buffet breakfast."
          "Hotel Siddhartha offers a terrace."
          "The accommodation offers a business centre, free WiFi access and free private parking."
          "We speak your language!"
          "Hotel Siddhartha has been welcoming Booking.com guests since 10 Aug 2018.",
      softWrap: true,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Siddhartha Hotel"),
      ),
      body: new Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.asset(
              'images/siddhartha.jpg',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            titleSection,
            textSection,
          ],
        ),
      ),
    );
  }
}
