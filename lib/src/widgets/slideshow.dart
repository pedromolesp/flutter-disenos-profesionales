import 'package:disenos/src/models/slider_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SlideShow extends StatelessWidget {
  final List<Widget> slides;
  final bool puntosArriba;
  // final Color colorPrimario;
  SlideShow({this.slides, this.puntosArriba = false});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new SliderModel(),
      child: Scaffold(
        body: SafeArea(
          child: Center(
              child: Column(
            children: [
              if (puntosArriba) _Dots(slides.length),
              Expanded(child: _Slides(this.slides)),
              if (!puntosArriba) _Dots(slides.length),
            ],
          )),
        ),
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  int dotsNumber;
  List<Widget> children;
  _Dots(this.dotsNumber);
  @override
  Widget build(BuildContext context) {
    children = new List<Widget>();

    return Container(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(dotsNumber, (index) => _Dot(index)),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;
  _Dot(this.index);
  @override
  Widget build(BuildContext context) {
    final pageViewIndex = Provider.of<SliderModel>(context).currentPage;
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.symmetric(horizontal: 5),
      width: (pageViewIndex >= index - 0.5 && pageViewIndex < index + 0.5)
          ? 15
          : 12,
      height: (pageViewIndex >= index - 0.5 && pageViewIndex < index + 0.5)
          ? 15
          : 12,
      decoration: BoxDecoration(
          color: (pageViewIndex >= index - 0.5 && pageViewIndex < index + 0.5)
              ? Colors.blue
              : Colors.grey,
          shape: BoxShape.circle),
    );
  }
}

class _Slides extends StatefulWidget {
  _Slides(this.slides);
  final List<Widget> slides;
  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {
  PageController _controller = new PageController();
  int numberSlides;
  @override
  void initState() {
    super.initState();
    numberSlides = widget.slides.length;
    _controller.addListener(() {
      Provider.of<SliderModel>(context, listen: false).currentPage =
          _controller.page;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: _controller,
        children: widget.slides.map((slide) => _Slide(slide)).toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;
  _Slide(this.slide);
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(30),
        child: slide);
  }
}
