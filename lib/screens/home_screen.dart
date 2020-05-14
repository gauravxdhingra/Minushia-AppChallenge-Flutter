import 'package:flutter/material.dart';
import 'package:minushia_demo/screens/info_screen.dart';
import 'package:minushia_demo/screens/location_preview_page.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  locationOptionsBuilder(locationName, locationSize) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => LocationPreviewPage(
                    locationName: locationName,
                    locationArea: locationSize,
                  ))),
      child: Row(
        children: <Widget>[
          Container(
            height: 100,
            width: 160,
            child: locationName == 'Farm'
                ? Image.asset('assets/farm.png')
                : Image.asset('assets/campus.png'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 5, left: 10),
                  child: Text(
                    locationName,
                    style: Theme.of(context)
                        .textTheme
                        .headline2
                        .copyWith(fontSize: 25),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    locationSize,
                    style: TextStyle(letterSpacing: 1.1),
                  ),
                ),
              ],
            ),
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
          snappings: [0.45, 0.7, 1.0],
          // Define to what the snappings relate to. In this case,
          // the total available space that the sheet can expand to.
          positioning: SnapPositioning.relativeToAvailableSpace,
        ),
        // The body widget will be displayed under the SlidingSheet
        // and a parallax effect can be applied to it.
        body: Stack(
          children: <Widget>[
            Container(
              child: Image.asset('assets/map.png'),
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
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 150),
                    child: Divider(
                      thickness: 3,
                    ),
                  ),
                  Text(
                    'FLUTTER TEST',
                    style: Theme.of(context).textTheme.headline1.copyWith(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Text('Testing'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Text(
                      'Ramakrishnapura, Anekal Road, Chandapura P.O, Bengaluru, Karnataka 560099',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  locationOptionsBuilder('Campus', '14.2 ACRES'),
                  SizedBox(
                    height: 20,
                  ),
                  locationOptionsBuilder('Farm', '78 ACRES'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
