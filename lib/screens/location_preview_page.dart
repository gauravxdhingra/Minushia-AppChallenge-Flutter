import 'package:flutter/material.dart';
import 'package:menu_button/menu_button.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class LocationPreviewPage extends StatefulWidget {
  final locationName;
  final locationArea;
  LocationPreviewPage({Key key, this.locationName, this.locationArea})
      : super(key: key);

  @override
  _LocationPreviewPageState createState() => _LocationPreviewPageState();
}

class _LocationPreviewPageState extends State<LocationPreviewPage> {
  final Widget button = Row(
    children: [
      Container(
        width: 220.0 - 43,
        height: 40,
        color: Colors.white,
        // child: Flexible(
        //   child: Icon(
        //     Icons.layers,
        //     color: Colors.white,
        //   ),
        // ),
      ),
      Container(
        width: 43,
        height: 40,
        color: Color(0xffEA4335),
        child: Icon(
          Icons.layers,
          color: Colors.white,
        ),
      ),
    ],
  );

  String selectedItem = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              // color: Colors.red,
              child: MenuButton<String>(
                edgeMargin: 0,
                scrollPhysics: BouncingScrollPhysics(),
                child: button,
                // child: Icon(Icons.layers),
                items: [
                  'Orthomosaic',
                  'Digital Elevation',
                  'Digital Terrain',
                  'Vegetation'
                ],
                topDivider: false,

                itemBuilder: (value) => Container(
                  color: Color(0xffEA4335),
                  width: 220,
                  height: 35,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        value,
                        style: TextStyle(color: Colors.white),
                      ),
                      Icon(
                        Icons.check_box_outline_blank,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                toggledChild: Container(
                  color: Color(0xffEA4335),
                  child: button, // Widget displayed as the button,
                ),
                divider: Container(
                  height: 0,
                  color: Color(0xffEA4335),
                ),
                onItemSelected: (value) {
                  setState(() {
                    selectedItem = value;
                  });

                  // Action when new item is selected
                },
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: const BorderRadius.all(Radius.circular(3.0)),
                  color: Colors.white,
                ),
                onMenuButtonToggle: (isToggle) {
                  print(isToggle);
                },
              ),
              // IconButton(
              //   icon: Icon(Icons.layers),
              //   onPressed: () {},
              // ),
            ),
          ),
        ],
      ),
      body: SlidingSheet(
        elevation: 8,
        cornerRadius: 16,
        snapSpec: const SnapSpec(
          // Enable snapping. This is true by default.
          snap: true,
          // Set custom snapping points.
          snappings: [0.18, 0.7, 1.0],
          // Define to what the snappings relate to. In this case,
          // the total available space that the sheet can expand to.
          positioning: SnapPositioning.relativeToAvailableSpace,
        ),
        // The body widget will be displayed under the SlidingSheet
        // and a parallax effect can be applied to it.
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                '$selectedItem',
                style: Theme.of(context).textTheme.headline2.copyWith(
                      letterSpacing: 1.0,
                      color: Colors.white,
                      backgroundColor: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.normal,
                      fontSize: 20,
                    ),
              ),
              Container(
                // height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width,
                child: widget.locationName == 'Farm'
                    ? Image.asset(
                        'assets/farm.png',
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        'assets/campus.png',
                        fit: BoxFit.cover,
                      ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
              )
            ],
          ),
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
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: Text(
                      widget.locationName,
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: Text(
                      widget.locationName == 'Campus' ? 'Testing' : 'Training',
                      style: Theme.of(context).textTheme.headline2.copyWith(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: Text(
                      widget.locationArea,
                      style: Theme.of(context).textTheme.headline2.copyWith(
                            color: Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
