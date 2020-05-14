import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:minushia_demo/screens/login_screen.dart';
import 'package:page_transition/page_transition.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({Key key}) : super(key: key);

  buildOptions(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
      child: Column(
        children: <Widget>[
          ExpandablePanel(
            header: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.brightness_1,
                      color: Theme.of(context).primaryColor,
                      size: 15,
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Text(
                      'Orthomosaic',
                      style: Theme.of(context).textTheme.headline2.copyWith(
                            fontSize: 22,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ],
                ),
                Divider(),
              ],
            ),
            // collapsed: Text(
            //   'yes',
            //   softWrap: true,
            //   maxLines: 2,
            //   overflow: TextOverflow.ellipsis,
            // ),
            expanded: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                'Allow us to access the camera to take pictures and detect things',
                softWrap: true,
              ),
            ),
            // tapHeaderToExpand: true,
            // hasIcon: true,
          ),
          SizedBox(
            height: 20,
          ),
          ExpandablePanel(
            header: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.brightness_1,
                      color: Theme.of(context).primaryColor,
                      size: 15,
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Text(
                      'Digital Elevation',
                      style: Theme.of(context).textTheme.headline2.copyWith(
                            fontSize: 22,
                            fontWeight: FontWeight.normal,
                          ),
                    )
                  ],
                ),
                Divider(),
              ],
            ),
            expanded: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                'Allow us to access the camera to take pictures and detect things',
                softWrap: true,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ExpandablePanel(
            header: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.brightness_1,
                      color: Theme.of(context).primaryColor,
                      size: 15,
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Text(
                      'Digital Terrain',
                      style: Theme.of(context).textTheme.headline2.copyWith(
                            fontSize: 22,
                            fontWeight: FontWeight.normal,
                          ),
                    )
                  ],
                ),
                Divider(),
              ],
            ),
            expanded: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                'Allow us to access the location to provide you location based features like tracking your activities more accurately and allowing you to tag location',
                softWrap: true,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ExpandablePanel(
            header: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.brightness_1,
                      color: Theme.of(context).primaryColor,
                      size: 15,
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Text(
                      'Vegetation',
                      style: Theme.of(context).textTheme.headline2.copyWith(
                            fontSize: 22,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ],
                ),
                Divider(),
              ],
            ),
            expanded: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                'Allow us to access the location to provide you location based features like tracking your activities more accurately and allowing you to tag location',
                softWrap: true,
              ),
            ),
          ),
        ],
      ),
    );
  }

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
        title: Text(
          'Information',
          style: Theme.of(context).textTheme.headline2.copyWith(
                color: Theme.of(context).primaryColor.withOpacity(
                      0.5,
                    ),
                fontWeight: FontWeight.normal,
              ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              buildOptions(context),
              Text(''),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.09,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Divider(
                    // height: 10,
                    color: Colors.grey,
                  ),
                  Center(
                    child: GestureDetector(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.07,
                        child: Center(
                          child: Text(
                            'LOG OUT',
                            style: Theme.of(context)
                                .textTheme
                                .headline1
                                .copyWith(
                                    fontSize: 25,
                                    color: Theme.of(context)
                                        .primaryColor
                                        .withOpacity(0.3)),
                          ),
                        ),
                        color: Colors.white,
                      ),
                      onTap: () => Navigator.pushReplacement(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade,
                              child: LoginScreen())),
                      //  Navigator.pushReplacement(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => LoginScreen())),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
