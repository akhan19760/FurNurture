import 'package:get/get.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/constants.dart';
import 'package:furniture_app/view/widgets/custom_buttons.dart';
import 'package:furniture_app/view/widgets/custom_text.dart';

class ProductScreen extends StatefulWidget {
  ProductScreen({
    super.key,
  });

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  String prodDesc =
      "The IKEA Irul Chair offers comfort and style with plush cushioning and sleek design. Upgrade your space today.";
  List<String> imgUrls = [
    "https://www.ikea.com/us/en/images/products/strandmon-wing-chair-skiftebo-yellow__0837297_pe601176_s5.jpg?f=s",
    "https://www.ikea.com/us/en/images/products/strandmon-wing-chair-skiftebo-yellow__0913860_ph145337_s5.jpg?f=xxs",
    "https://www.ikea.com/us/en/images/products/strandmon-wing-chair-skiftebo-yellow__0837286_pe596513_s5.jpg?f=xxs",
    "https://www.ikea.com/us/en/images/products/strandmon-wing-chair-skiftebo-yellow__0837284_pe583756_s5.jpg?f=xxs",
  ];

  Color? selectedColor;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          Positioned(
              top: 0,
              child: Container(
                height: 350,
                width: MediaQuery.of(context).size.width,
                child: ImageSlider(imageUrls: imgUrls),
              )),
          Positioned(top: 20, left: 20, child: BackBtn()),
          Positioned(
            top: 20,
            right: 20,
            child: Material(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              elevation: 5,
              color: Constants.btnPrimColor,
              child: Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: Colors.white),
                  child: Icon(
                    EvaIcons.heart,
                    size: 24,
                    color: Colors.red,
                  )),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.6,
              decoration: BoxDecoration(
                  color: Constants.btnPrimColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0))),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CustomText('Irul Chair', Constants.secondaryColor, 30.0,
                            FontWeight.w800),
                        Spacer(),
                        Rating(),
                      ],
                    ),
                    CustomText('by IKEA', Colors.grey, 14.0, FontWeight.w600),
                    SizedBox(
                      height: 10.0,
                    ),
                    CustomText(
                        prodDesc, Colors.grey.shade600, 16.0, FontWeight.w600),
                    ZoomableGridView(imageUrls: imgUrls),
                    Row(
                      children: [
                        CustomText('Color', Constants.secondaryColor, 18.0,
                            FontWeight.w700),
                        SizedBox(
                          width: 20.0,
                        ),
                        ColorPicker(colors: [
                          Colors.yellow,
                          Colors.brown,
                          Colors.blueGrey
                        ], onColorSelected: _onColorSelected),
                        Spacer(),
                        QuantityChooser(),
                      ],
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Container(
                      width: double.infinity,
                      color: Colors.grey,
                      height: 1,
                    ),
                    Container(
                      height: 100,
                      alignment: Alignment.centerLeft,
                      width: MediaQuery.of(context).size.width,
                      child: Row(children: [
                        CustomText('\$102.00', Constants.secondaryColor, 28.0,
                            FontWeight.w800),
                        Spacer(),
                        CustomButton(
                            'Buy now',
                            const SizedBox(),
                            () {},
                            120,
                            60,
                            Constants.btnPrimColor,
                            Colors.deepOrange.shade600)
                      ]),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }

  void _onColorSelected(Color color) {
    setState(() {
      selectedColor = color;
    });
  }
}

class ReadMore extends StatefulWidget {
  const ReadMore({super.key, required this.text});
  final String text;

  @override
  State<ReadMore> createState() => _ReadMoreState();
}

class _ReadMoreState extends State<ReadMore> {
  String firstHalf = '';
  String secondHalf = '';

  bool flag = true;

  @override
  void initState() {
    super.initState();

    if (widget.text.length > 150) {
      firstHalf = widget.text.substring(0, 150);
      secondHalf = widget.text.substring(150, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: secondHalf.isEmpty
            ? CustomText(firstHalf, Colors.grey, 16.0, FontWeight.w600)
            : Column(
                children: [
                  CustomText(flag ? '$firstHalf...' : '$firstHalf $secondHalf',
                      Colors.grey.shade600, 16.0, FontWeight.w600),
                  InkWell(
                      onTap: () {
                        setState(() {
                          flag = !flag;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CustomText(flag ? 'Read More' : 'Read Less',
                              Constants.secondaryColor, 16.0, FontWeight.w800),
                          Icon(
                            flag
                                ? EvaIcons.arrowCircleDown
                                : EvaIcons.arrowCircleUp,
                            color: Constants.secondaryColor,
                            size: 30.0,
                          )
                        ],
                      ))
                ],
              ));
  }
}

class Rating extends StatelessWidget {
  const Rating({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.0),
      height: 35,
      width: 70,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(color: Colors.grey.shade400)),
      child: Row(children: [
        Icon(
          EvaIcons.star,
          color: Colors.amber,
          size: 27.0,
        ),
        CustomText('4.7', Constants.secondaryColor, 18.0, FontWeight.w600),
      ]),
    );
  }
}

class ImageSlider extends StatefulWidget {
  final List<String> imageUrls;

  ImageSlider({required this.imageUrls});

  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  int _currentIndex = 0;
  PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              PageView.builder(
                controller: _pageController,
                itemCount: widget.imageUrls.length,
                physics: BouncingScrollPhysics(),
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Container(
                    color: Colors.white,
                    child: Image.network(
                      widget.imageUrls[index],
                      fit: BoxFit.fill,
                      width: double.infinity,
                    ),
                  );
                },
              ),
              Positioned(
                bottom: 30,
                left: 94,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (int i = 0; i < widget.imageUrls.length; i++)
                      _buildPreviewImage(i),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPreviewImage(int index) {
    bool isActive = index == _currentIndex;
    return GestureDetector(
      onTap: () {
        _pageController.animateToPage(index,
            duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 4),
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: isActive ? Constants.secondaryColor : Colors.grey,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            widget.imageUrls[index],
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class ZoomableGridView extends StatefulWidget {
  ZoomableGridView({required this.imageUrls});

  final List<String> imageUrls;

  @override
  _ZoomableGridViewState createState() => _ZoomableGridViewState();
}

class _ZoomableGridViewState extends State<ZoomableGridView> {
  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      margin: EdgeInsets.only(top: 50),
      child: GridView.builder(
        itemCount: 3,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedIndex = index;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: _selectedIndex == index ? Colors.blue : Colors.grey,
                  width: 1.0,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  widget.imageUrls[index],
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ColorPicker extends StatefulWidget {
  final List<Color> colors;
  final Function(Color) onColorSelected;

  ColorPicker({required this.colors, required this.onColorSelected});

  @override
  _ColorPickerState createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  Color? selectedColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 150,
      child: GridView.count(
        crossAxisCount: 3,
        children: widget.colors.map((color) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedColor = color;
              });
              widget.onColorSelected(color);
            },
            child: Container(
              margin: EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0), color: color),
              child: selectedColor == color
                  ? Container(
                      margin: EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: color,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 15, blurStyle: BlurStyle.normal)
                          ]),
                      child: Icon(
                        EvaIcons.checkmark,
                        color: Colors.white,
                      ),
                    )
                  : null,
            ),
          );
        }).toList(),
      ),
    );
  }
}

class QuantityChooser extends StatefulWidget {
  @override
  _QuantityChooserState createState() => _QuantityChooserState();
}

class _QuantityChooserState extends State<QuantityChooser> {
  int _quantity = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: Colors.grey.shade300),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: Icon(
              EvaIcons.minus,
              color: Constants.secondaryColor,
            ),
            onPressed: () {
              setState(() {
                if (_quantity > 0) {
                  _quantity--;
                }
              });
            },
          ),
          CustomText(
              '$_quantity', Constants.secondaryColor, 16.0, FontWeight.w600),
          IconButton(
            icon: Icon(
              EvaIcons.plus,
              color: Constants.secondaryColor,
            ),
            onPressed: () {
              setState(() {
                _quantity++;
              });
            },
          ),
        ],
      ),
    );
  }
}

class BackBtn extends StatelessWidget {
  const BackBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.back();
      },
      child: Material(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        elevation: 5,
        color: Constants.btnPrimColor,
        child: Container(
          height: 35,
          width: 35,
          decoration: BoxDecoration(),
          child: Icon(
            EvaIcons.arrowIosBack,
            color: Constants.secondaryColor,
          ),
        ),
      ),
    );
  }
}
