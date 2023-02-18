import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/constants.dart';
import 'package:furniture_app/view/product_screen.dart';
import 'package:furniture_app/view/widgets/custom_text.dart';

class ShoppingCart extends StatefulWidget {
  const ShoppingCart({super.key});

  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Constants.btnPrimColor,
        body: Stack(
          children: [
            Positioned(top: 20, left: 20, child: BackBtn()),
            Positioned(
                top: 25,
                left: 80,
                child: CustomText(
                    'Cart', Constants.secondaryColor, 24.0, FontWeight.w700)),
            Positioned(
                top: 20,
                right: 20,
                child: Icon(
                  EvaIcons.shoppingBag,
                  color: Constants.secondaryColor,
                  size: 30,
                )),
            Positioned(
              top: 18,
              right: 12,
              child: CircleAvatar(
                backgroundColor: Colors.deepOrange.shade600,
                radius: 10,
                child: CustomText(
                    '4', Constants.btnPrimColor, 15, FontWeight.w600),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CartComponent extends StatefulWidget {
  const CartComponent({super.key});

  @override
  State<CartComponent> createState() => _CartComponentState();
}

class _CartComponentState extends State<CartComponent> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
