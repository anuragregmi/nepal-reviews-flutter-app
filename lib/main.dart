import 'package:flutter/material.dart';
import 'package:nepal_review/detail_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.teal,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Reviews'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _addButtonPressed() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      /*----*/
    });
  }

  List fetchDataFromAPI() {
    return [
      {
        "id": 1,
        "title": "Siddhartha Hotel",
        "description": "Hotel Siddhartha has a restaurant, bar, a shared lounge and garden in Nepālganj"
            ". Boasting room service, this property also provides guests with a casino. The hotel features an outdoor swimming pool, fitness centre, evening entertainment and a 24-hour front desk."
            "The hotel offers a continental or buffet breakfast."
            "Hotel Siddhartha offers a terrace."
            "The accommodation offers a business centre, free WiFi access and free private parking."
            "We speak your language!"
            "Hotel Siddhartha has been welcoming Booking.com guests since 10 Aug 2018.",
        "location": "Nepalgunj, Banke",
        "image": "https://media-cdn.tripadvisor.com/media/photo-w/19/33/bb/24/hotel-siddhartha.jpg"
      },
      {
        "id": 2,
        "title": "Hyatt Regency",
        "description": "Best Luxury Hotel & Resort in Kathmandu Hyatt Regency "
            "Kathmandu is a five-star luxury hotel and resort in Kathmandu,"
            "  set on 37 acres of landscaped grounds and created in the traditional"
            " Newari style of Nepalese architecture. This beautiful hotel and resort is"
            " located on the road to the Boudhanath Stupa: the most holy of all Tibetan Buddhist "
            "shrines outside of Tibet and a UNESCO World Heritage Site located within a five-minute "
            "walk from the hotel. The hotel is just four kilometres (2.4 miles) from the Tribhuvan "
            "International Airport and six kilometres (3.7 miles) from the city center of Kathmandu.",
        "location": "Boudha, Kathmandu",
        "image": "https://r2imghtlak.mmtcdn.com/r2-mmt-htl-image/htl-imgs/6608967321245190-d7f0c7a82d2611eab6c20242ac11000a.jpg?&output-quality=75&downsize=520:350&crop=520:350;0,27&output-format=jpg"
      }
    ];
  }

  List<Card> getCards() {
    var cards = List<Card>();
    final results = fetchDataFromAPI();

    for (var i = 0; i < results.length; i++) {
      final hotelData = results[i];
      final title = hotelData['title'];
      final description = hotelData['description'];
      final location = hotelData['location'];
      final imageUrl = hotelData['image'];

      cards.add(
        Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.hotel),
                title: Text(title),
                subtitle: Text(
                  description,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 5,
                ),
              ),
              ButtonBar(
                children: <Widget>[
                  FlatButton(
                    child: const Text('VIEW REVIEWS'),
                    onPressed: () {
                      /* ... */
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (ctx) => new DetailPage(
                                  title, description, location, imageUrl
                              )));
                    },
                  ),
                  FlatButton(
                    child: const Text('RATE'),
                    onPressed: () {
                      /* ... */
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }
    return cards;
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
          child: ListView(
        children: getCards(),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: _addButtonPressed,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
