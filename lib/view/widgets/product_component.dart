import 'package:flutter/material.dart';
import 'package:furniture_store/constants.dart';
import 'package:furniture_store/view/widgets/custom_buttons.dart';
import 'package:furniture_store/view/widgets/custom_text.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

class ProductComponent extends StatefulWidget {
  ProductComponent(
      {super.key,
      required this.onFavTap,
      required this.onTap,
      required this.isFavorite,
      required this.image});

  final VoidCallback onTap;
  final VoidCallback onFavTap;
  bool isFavorite;
  final String image;
  @override
  State<ProductComponent> createState() => _ProductComponentState();
}

class _ProductComponentState extends State<ProductComponent> {
  List<Color> colors = [Colors.amber, Colors.black, Colors.brown];

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Material(
          elevation: 10,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(
                    children: [
                      Container(
                        height: 150,
                        width: 150,
                        margin: EdgeInsets.only(left: 8.0),
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(15.0),
                            ),
                            image: DecorationImage(
                                image: NetworkImage(
                                  widget.image,
                                ),
                                fit: BoxFit.fill)),
                      ),
                      Positioned(
                        top: 10,
                        right: 10,
                        child: Container(
                          height: 32,
                          width: 32,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              color: Colors.white),
                          child: GestureDetector(
                              onTap: widget.onFavTap,
                              child: widget.isFavorite
                                  ? const Icon(
                                      EvaIcons.heart,
                                      size: 24,
                                      color: Colors.red,
                                    )
                                  : const Icon(
                                      EvaIcons.heartOutline,
                                      color: Colors.red,
                                    )),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10.0),
                Container(
                  width: 175,
                  height: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15.0))),
                  margin: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText('Irul Sofa', Constants.secondaryColor, 18.0,
                          FontWeight.w700),
                      Container(
                        width: 55,
                        height: 20,
                        child: Row(
                          children: [
                            CustomText('by ', Constants.secondaryColor, 14.0,
                                FontWeight.normal),
                            Spacer(),
                            CustomText('IKEA', Constants.secondaryColor, 14.0,
                                FontWeight.w600)
                          ],
                        ),
                      ),
                      CustomText('Ergonomical for humans body curve',
                          Constants.secondaryColor, 14.0, FontWeight.w400),
                      Container(
                        height: 28,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: colors.length,
                          itemBuilder: (context, index) {
                            return Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: colors[index],
                              ),
                              margin: EdgeInsets.all(4),
                            );
                          },
                        ),
                      ),
                      Spacer(),
                      Container(
                        width: 180,
                        height: 30,
                        child: Row(
                          children: [
                            CustomText("\$102.00", Constants.secondaryColor,
                                18.0, FontWeight.w700),
                            Spacer(),
                            CustomButton(
                                'Buy',
                                const SizedBox(),
                                () {},
                                75,
                                30,
                                Constants.btnPrimColor,
                                Constants.secondaryColor)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
