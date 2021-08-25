import 'package:flutter/material.dart';

class SlideImageWidget extends StatefulWidget {
  final List<Widget> children;
  const SlideImageWidget({
    Key? key,
    required this.children,
  }) : super(key: key);

  @override
  _SlideImageWidgetState createState() => _SlideImageWidgetState();
}

class _SlideImageWidgetState extends State<SlideImageWidget> {
  int _currentPage = 0;

  PageController _pageController = PageController(initialPage: 0);

  List<Widget> _buildPageIndicator(int numPages) {
    List<Widget> list = [];
    for (int i = 0; i < numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 10.0,
      width: isActive ? 18.0 : 10.0,
      decoration: BoxDecoration(
        color: isActive
            ? Colors.black.withOpacity(0.7)
            : Colors.black.withOpacity(0.6),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView(
          controller: _pageController,
          onPageChanged: (int page) {
            setState(() {
              _currentPage = page;
            });
          },
          children: widget.children,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildPageIndicator(widget.children.length),
            ),
          ),
        )
      ],
    );
  }
}
