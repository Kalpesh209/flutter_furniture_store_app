import 'package:flutter/material.dart';
import 'package:flutter_furniture_store_app_ui/common/color_constants.dart';
import 'package:flutter_furniture_store_app_ui/common/constants.dart';
import 'package:flutter_furniture_store_app_ui/widgets/best_offer_widget.dart';
import 'package:flutter_furniture_store_app_ui/widgets/chair_widget.dart';

import 'package:google_fonts/google_fonts.dart';
import 'arm_chairs_screen.dart';

/*
Title:HomePageScreen
Purpose:HomePageScreen
Created Date:17 March
Created By:Kalpesh Khandla
*/

class HomePageScreen extends StatefulWidget {
  HomePageScreen({
    Key key,
  }) : super(key: key);

  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [
                    Colors.grey[200],
                    Colors.white,
                  ],
                  stops: [
                    0.1,
                    1
                  ]),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  _buildAppBar(),
                  _buildProducts(),
                  _buildBestOffes(),
                ],
              ),
            ),
          ),
          _buildMoreButton()
        ],
      ),
    );
  }

  _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: Text(
        'Our Products',
        style: GoogleFonts.varelaRound(
          color: ColorConstants.primaryColor,
          fontWeight: FontWeight.w600,
        ),
      ),
      actions: <Widget>[
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.search,
                  size: 20,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  _buildProducts() {
    return DefaultTabController(
      length: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TabBar(
            labelColor: ColorConstants.primaryColor,
            unselectedLabelColor: Colors.grey,
            labelStyle: GoogleFonts.varelaRound(fontWeight: FontWeight.w600),
            isScrollable: true,
            indicator: UnderlineTabIndicator(
                borderSide: BorderSide(
                  color: ColorConstants.primaryColor,
                  width: 2,
                ),
                insets: EdgeInsets.symmetric(horizontal: 45)),
            tabs: [
              Tab(
                text: 'Armchairs',
              ),
              Tab(
                text: 'Sofas',
              ),
              Tab(
                text: 'Beds',
              ),
              Tab(
                text: 'Tables',
              ),
            ],
          ),
          Container(
            height: 250,
            child: TabBarView(
              children: [
                _buildChairProducts(),
                Container(),
                Container(),
                Container(),
              ],
            ),
          )
        ],
      ),
    );
  }

  _buildBestOffes() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Best Offers',
            style: GoogleFonts.varelaRound(
              color: ColorConstants.primaryColor,
              fontWeight: FontWeight.w600,
              fontSize: 22,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            children: List.generate(Constants.bestOffers.length, (index) {
              return BestOfferWidget(
                productModel: Constants.bestOffers[index],
              );
            }),
          )
        ],
      ),
    );
  }

  _buildChairProducts() {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.all(10),
      itemBuilder: (context, index) {
        return ChairWidget(
          productModel: Constants.chairs[index],
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(
          width: 10,
        );
      },
      itemCount: Constants.chairs.length,
    );
  }

  _buildMoreButton() {
    return Positioned(
      bottom: 0,
      right: 0,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ArmChairsScreen(),
          ));
        },
        child: Container(
          width: 100,
          height: 70,
          decoration: BoxDecoration(
              color: ColorConstants.primaryColor,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'more',
                style: GoogleFonts.varelaRound(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}




