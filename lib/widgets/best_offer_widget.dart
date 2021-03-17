import 'package:flutter/material.dart';
import 'package:flutter_furniture_store_app_ui/common/color_constants.dart';
import 'package:flutter_furniture_store_app_ui/model/product_model.dart';
import 'package:google_fonts/google_fonts.dart';

class BestOfferWidget extends StatelessWidget {
  final ProductModel productModel;
  const BestOfferWidget({
    Key key,
    this.productModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Stack(
        alignment: Alignment.center,
        overflow: Overflow.visible,
        children: <Widget>[
          Card(
            child: Container(
              width: 30,
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(5)),
            ),
          ),
          Positioned(
            right: -10,
            child: Image.asset(productModel.imagePath),
            height: 40,
            width: 40,
          ),
        ],
      ),
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              productModel.name,
              style: GoogleFonts.varelaRound(
                color: ColorConstants.primaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              productModel.productType,
              style: GoogleFonts.varelaRound(
                color: Colors.grey,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
      trailing: Text(
        '\$${productModel.price}',
        style: GoogleFonts.varelaRound(
          color: ColorConstants.primaryColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
