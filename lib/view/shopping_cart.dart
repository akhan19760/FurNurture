import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:furniture_store/constants.dart';
import 'package:furniture_store/view/product_screen.dart';
import 'package:furniture_store/view/widgets/custom_buttons.dart';
import 'package:furniture_store/view/widgets/custom_text.dart';

class ShoppingCart extends StatefulWidget {
  const ShoppingCart({super.key});

  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            leading: Container(
              width: 200,
              height: 75,
              child: Row(children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 0),
                  child: BackBtn(),
                ),
              ]),
            ),
            title: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: CustomText(
                  'Cart', Constants.secondaryColor, 24.0, FontWeight.w700),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(top: 20, right: 20),
                child: ShoppingCartIcon(itemCount: 5),
              )
            ],
            toolbarHeight: 75,
            backgroundColor: Constants.btnPrimColor,
            elevation: 0,
          ),
          backgroundColor: Constants.btnPrimColor,
          body: Padding(
            padding:
                EdgeInsets.only(bottom: MediaQuery.of(context).size.height / 7),
            child: ListView(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              children: [
                CartComponent(
                    image:
                        "https://images.unsplash.com/photo-1550226891-ef816aed4a98?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGZ1cm5pdHVyZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=1400&q=60"),
                CartComponent(
                    image:
                        "https://images.unsplash.com/photo-1550226891-ef816aed4a98?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGZ1cm5pdHVyZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=1400&q=60"),
                CartComponent(
                    image:
                        "https://images.unsplash.com/photo-1550226891-ef816aed4a98?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGZ1cm5pdHVyZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=1400&q=60"),
                CartComponent(
                    image:
                        "https://images.unsplash.com/photo-1550226891-ef816aed4a98?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGZ1cm5pdHVyZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=1400&q=60"),
                CartComponent(
                    image:
                        "https://images.unsplash.com/photo-1550226891-ef816aed4a98?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGZ1cm5pdHVyZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=1400&q=60"),
              ],
            ),
          ),
          bottomSheet: Material(
            elevation: 20,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0)),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0)),
                color: Constants.btnPrimColor,
              ),
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Column(children: [
                  Row(
                    children: [
                      CustomText('Selected Items ', Constants.secondaryColor, 16.0, FontWeight.w600),
                      CustomText('(2)', Color(0xffa2866d), 18.0, FontWeight.w600),
                      Spacer(),
                      CustomText('Total: ', Constants.secondaryColor, 16.0, FontWeight.w600),
                      CustomText('\$730.00', Color(0xffa2866d), 18.0, FontWeight.w800),
                    ],
                  ),
                  Spacer(),
                  CustomButton('Checkout', const SizedBox(), () {}, MediaQuery.of(context).size.width, 50, Color(0xffa2866d), Constants.secondaryColor)
                
                ],
                ),
              ),
            ),
          )),
    );
  }
}

class ShoppingCartIcon extends StatelessWidget {
  final int itemCount;

  const ShoppingCartIcon({Key? key, required this.itemCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Icon(
          EvaIcons.shoppingBag,
          size: 36,
          color: Constants.secondaryColor,
        ),
        if (itemCount > 0)
          Positioned(
            right: 0,
            child: Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              constraints: BoxConstraints(
                minWidth: 20,
                minHeight: 20,
              ),
              child: Text(
                itemCount.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }
}

class CartComponent extends StatefulWidget {
  const CartComponent({super.key, required this.image});
  final String image;

  @override
  State<CartComponent> createState() => _CartComponentState();
}

class _CartComponentState extends State<CartComponent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Material(
        elevation: 10,
        borderRadius: BorderRadius.circular(20.0),
        child: Row(
          children: [
            MyRadioButton(),
            Container(
              width: 330,
              height: 150,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
              child: Row(children: [
                Container(
                  height: 110,
                  width: 110,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: NetworkImage(widget.image), fit: BoxFit.fill)),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 200,
                      child: Row(
                        children: [
                          CustomText('Irul Sofa', Constants.secondaryColor,
                              18.0, FontWeight.w700),
                          Spacer(),
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey,
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.close,
                                color: Colors.white,
                                size: 15,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 50,
                      height: 20,
                      child: Row(
                        children: [
                          CustomText('by', Constants.secondaryColor, 12.0,
                              FontWeight.normal),
                          Spacer(),
                          CustomText('IKEA', Constants.secondaryColor, 12.0,
                              FontWeight.w600)
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.amber,
                      ),
                      margin: EdgeInsets.all(4),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 200,
                      height: 40,
                      child: Row(
                        children: [
                          CustomText("\$102.00", Constants.secondaryColor, 18.0,
                              FontWeight.w700),
                          Spacer(),
                          QuantityChooser(),
                        ],
                      ),
                    )
                  ],
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

class MyRadioButton extends StatefulWidget {
  const MyRadioButton({Key? key}) : super(key: key);

  @override
  _MyRadioButtonState createState() => _MyRadioButtonState();
}

class _MyRadioButtonState extends State<MyRadioButton> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Radio(
      value: true,
      groupValue: _isSelected,
      onChanged: (bool? value) {
        setState(() {
          _isSelected = !_isSelected;
        });
      },
      activeColor: Colors.deepOrange.shade700,
      toggleable: true,
      fillColor: MaterialStateColor.resolveWith((states) => _isSelected
          ? Colors.deepOrange.shade700
          : Colors.deepOrange.shade700.withOpacity(0.7)),
    );
  }
}
