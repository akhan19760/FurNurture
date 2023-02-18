import 'package:flutter/material.dart';
import 'package:furniture_app/view/product_screen.dart';
import 'package:furniture_app/view/widgets/product_component.dart';
import 'package:get/get.dart';

class FurnitureTab extends StatefulWidget {
  const FurnitureTab({super.key, required this.furnitureType});
  final String furnitureType;

  @override
  State<FurnitureTab> createState() => _FurnitureTabState();
}

class _FurnitureTabState extends State<FurnitureTab>
    with AutomaticKeepAliveClientMixin<FurnitureTab> {
  @override
  bool get wantKeepAlive => true;
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        ProductComponent(
          onFavTap: () {
            setState(() {
              isFavorite = !isFavorite;
            });
          },
          onTap: () {
            Get.to(() => ProductScreen(),
                transition: Transition.leftToRightWithFade);
          },
          isFavorite: isFavorite,
          image:
              'https://images.unsplash.com/photo-1567016432779-094069958ea5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80',
        ),
        ProductComponent(
          onFavTap: () {
            isFavorite = !isFavorite;
          },
          onTap: () {
            Get.to(() => ProductScreen(),
                transition: Transition.leftToRightWithFade);
          },
          isFavorite: isFavorite,
          image:
              'https://images.unsplash.com/photo-1586023492125-27b2c045efd7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=658&q=80',
        ),
        ProductComponent(
          onFavTap: () {
            isFavorite = !isFavorite;
          },
          onTap: () {
            Get.to(() => ProductScreen(),
                transition: Transition.leftToRightWithFade);
          },
          isFavorite: isFavorite,
          image:
              'https://images.unsplash.com/photo-1550226891-ef816aed4a98?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGZ1cm5pdHVyZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=1400&q=60',
        ),
        ProductComponent(
          onFavTap: () {
            isFavorite = !isFavorite;
          },
          onTap: () {
            Get.to(() => ProductScreen(),
                transition: Transition.leftToRightWithFade);
          },
          isFavorite: isFavorite,
          image:
              'https://images.unsplash.com/photo-1517705008128-361805f42e86?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzR8fGZ1cm5pdHVyZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=1400&q=60',
        ),
        ProductComponent(
          onFavTap: () {
            isFavorite = !isFavorite;
          },
          onTap: () {
            Get.to(() => ProductScreen(),
                transition: Transition.leftToRightWithFade);
          },
          isFavorite: isFavorite,
          image:
              'https://images.unsplash.com/photo-1567016520496-0cb37d8467a7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80',
        ),
        ProductComponent(
          onFavTap: () {
            isFavorite = !isFavorite;
          },
          onTap: () {
            Get.to(() => ProductScreen(),
                transition: Transition.leftToRightWithFade);
          },
          isFavorite: isFavorite,
          image:
              'https://images.unsplash.com/photo-1598300056393-4aac492f4344?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NzV8fGZ1cm5pdHVyZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=1400&q=60',
        ),
      ],
    );
  }
}
