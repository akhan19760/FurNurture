import 'package:flutter/material.dart';
import 'package:furniture_store/constants.dart';
import 'package:furniture_store/view/login_screen.dart';
import 'package:furniture_store/view/signup_screen.dart';
import 'package:furniture_store/view/widgets/custom_buttons.dart';
import 'package:furniture_store/view/widgets/custom_text.dart';
import 'package:carousel_slider/carousel_slider.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.secondaryColor,
      body: ListView(
        children: [
          ImageSlider(),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText('Explore only the \ntop furniture',
                      Constants.primaryColor, 36.0, FontWeight.bold),
                  const SizedBox(height: 20),
                  CustomText(
                      'Discover only the best to create \nyour dream home',
                      Constants.primaryColor,
                      16.0,
                      FontWeight.normal),
                  const SizedBox(height: 50),
                  CustomButton(
                      'Sign Up',
                      Icon(
                        Icons.arrow_right_alt,
                        color: Constants.secondaryColor,
                      ), () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SignUpScreen()));
                  }, Constants.smallBtnWidth, Constants.smallBtnHeight,
                      Constants.secondaryColor, Constants.btnPrimColor),
                  const SizedBox(height: 50),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => LoginScreen()));
                    },
                    child: CustomText(
                        'Login', Constants.primaryColor, 16.0, FontWeight.w600),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ImageSlider extends StatefulWidget {
  const ImageSlider({
    super.key,
  });

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

final List<String> imagesList = [
  'https://images.unsplash.com/photo-1592078615290-033ee584e267?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8ZnVybml0dXJlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
  'https://images.unsplash.com/photo-1519961655809-34fa156820ff?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8c29mYXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
  'https://images.unsplash.com/photo-1600623050499-84929aad17c9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fHRhYmxlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
  'https://images.unsplash.com/photo-1576354302919-96748cb8299e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTF8fGJlZHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'
];

class _ImageSliderState extends State<ImageSlider> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              viewportFraction: 1,
              height: 420,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
            items: imagesList
                .map(
                  (item) => Container(
                    child: Stack(
                      children: <Widget>[
                        Image.network(
                          item,
                          fit: BoxFit.fill,
                          width: double.infinity,
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imagesList.map((urlOfItem) {
              int index = imagesList.indexOf(urlOfItem);
              return Container(
                width: 10.0,
                height: 10.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == index
                      ? Constants.primaryColor
                      : Color.fromRGBO(0, 0, 0, 0.3),
                ),
              );
            }).toList(),
          ),
        ],
      ),
      width: MediaQuery.of(context).size.width,
      height: 450,
    );
  }
}
