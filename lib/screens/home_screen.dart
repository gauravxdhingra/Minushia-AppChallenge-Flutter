import 'package:flutter/material.dart';
import 'package:minushia_demo/screens/info_screen.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  locationOptionsBuilder(locationName, locationSize) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        children: <Widget>[
          Container(
            height: 100,
            width: 100,
            color: Colors.blue,
          ),
          Column(
            children: <Widget>[
              Text(locationName),
              Text(locationSize),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingSheet(
        elevation: 8,
        cornerRadius: 16,
        snapSpec: const SnapSpec(
          // Enable snapping. This is true by default.
          snap: true,
          // Set custom snapping points.
          snappings: [0.4, 0.7, 1.0],
          // Define to what the snappings relate to. In this case,
          // the total available space that the sheet can expand to.
          positioning: SnapPositioning.relativeToAvailableSpace,
        ),
        // The body widget will be displayed under the SlidingSheet
        // and a parallax effect can be applied to it.
        body: Stack(
          children: <Widget>[
            Container(
              color: Colors.pink,
            ),
            Positioned(
              top: 40,
              right: 13,
              child: IconButton(
                icon: Icon(
                  Icons.info,
                  size: 35,
                ),
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => InfoScreen())),
                color: Colors.red,
              ),
            ),
          ],
        ),
        builder: (context, state) {
          // This is the content of the sheet that will get
          // scrolled, if the content is bigger than the available
          // height of the sheet.
          return Container(
            height: 500,
            child:
                // Center(
                //   child: Text('This is the content of the sheet'),
                // ),
                Column(
              children: <Widget>[
                Text('Flutter Test'),
                Text('Testing'),
                Text(
                  'Ramakrishnapura, Anekal Road, Chandapura P.O, Bengaluru, Karnataka 560099',
                  style: TextStyle(color: Colors.grey),
                ),
                locationOptionsBuilder('Campus', '14.2 ACRES'),
                locationOptionsBuilder('Farm', '78 ACRES'),
              ],
            ),
          );
        },
      ),
    );
  }
}
