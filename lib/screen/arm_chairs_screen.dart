import 'package:flutter/material.dart';
import 'package:flutter_furniture_store_app_ui/common/constants.dart';
import 'package:flutter_furniture_store_app_ui/widgets/product_widget.dart';

import 'package:google_fonts/google_fonts.dart';
import '../common/color_constants.dart';


/*
Title:ArmChairsScreen
Purpose:ArmChairsScreen
Created Date:17 March
Created By:Kalpesh Khandla
*/

class ArmChairsScreen extends StatefulWidget {
  ArmChairsScreen({
    Key key,
  }) : super(key: key);

  @override
  _ArmChairsScreenState createState() => _ArmChairsScreenState();
}

class _ArmChairsScreenState extends State<ArmChairsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _buildSortFilter(),
            _buildProducts(),
          ],
        ),
      ),
    );
  }

  _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: Text(
        'Armchairs',
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
                  Icons.shopping_cart,
                  size: 20,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  _buildSortFilter() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Card(
            elevation: 5,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.sort,
                    size: 18,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Sort',
                    style: GoogleFonts.varelaRound(
                      color: ColorConstants.primaryColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            elevation: 5,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.filter_list,
                    size: 18,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Filter',
                    style: GoogleFonts.varelaRound(
                      color: ColorConstants.primaryColor,
                      fontWeight: FontWeight.w400,
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

  _buildProducts() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: _buildLeftSide(),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: _buildRightSide(),
          ),
        ],
      ),
    );
  }

  _buildLeftSide() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: List.generate(Constants.chairs.length, (index) {
        if (index.isEven) {
          return ProductWidget(
            productModel: Constants.chairs[index],
          );
        }

        return Container(
          height: 0,
          width: 0,
        );
      }),
    );
  }

  _buildRightSide() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: List.generate(Constants.chairs.length, (index) {
        if (index.isOdd) {
          return ProductWidget(
            productModel: Constants.chairs[index],
          );
        }

        return Container(
          height: 0,
          width: 0,
        );
      })
        ..insert(
            0,
            SizedBox(
              height: 50,
            )),
    );
  }
}
