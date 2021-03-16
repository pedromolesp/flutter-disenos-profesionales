import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SlideShow extends StatelessWidget {
  final List<Widget> slides;
  final bool puntosArriba;
  final Color colorPrimario;
  final Color colorSecundario;
  final double bulletPrimario;
  final double bulletSecundario;
  SlideShow(
      {this.slides,
      this.puntosArriba = false,
      this.colorPrimario = Colors.blue,
      this.colorSecundario = Colors.grey,
      this.bulletPrimario = 12.0,
      this.bulletSecundario = 12.0});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _SlideshowModel(),
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: Builder(
              builder: (BuildContext context) {
                Provider.of<_SlideshowModel>(context).colorPrimario =
                    this.colorPrimario;
                Provider.of<_SlideshowModel>(context).colorSecundario =
                    this.colorSecundario;
                Provider.of<_SlideshowModel>(context).bulletPrimario =
                    this.bulletPrimario;
                Provider.of<_SlideshowModel>(context).bulletSecundario =
                    this.bulletSecundario;
                return _CrearEstructuraSlideShow(
                  puntosArriba: puntosArriba,
                  slides: slides,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _CrearEstructuraSlideShow extends StatelessWidget {
  const _CrearEstructuraSlideShow({
    Key key,
    @required this.puntosArriba,
    @required this.slides,
  }) : super(key: key);

  final bool puntosArriba;
  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    bool varr = false;
    return Column(
      children: [
        if (puntosArriba) _Dots(slides.length),
        Expanded(child: _Slides(this.slides)),
        if (!puntosArriba) _Dots(slides.length),
      ],
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
    final slideshowmodel = Provider.of<_SlideshowModel>(context);
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.symmetric(horizontal: 5),
      width: slideshowmodel.currentPage == index
          ? slideshowmodel.bulletPrimario
          : slideshowmodel.bulletSecundario,
      height: (slideshowmodel.currentPage >= index - 0.5 &&
              slideshowmodel.currentPage < index + 0.5)
          ? 15
          : 12,
      decoration: BoxDecoration(
          color: (slideshowmodel.currentPage >= index - 0.5 &&
                  slideshowmodel.currentPage < index + 0.5)
              ? slideshowmodel.colorPrimario
              : slideshowmodel.colorSecundario,
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
      Provider.of<_SlideshowModel>(context, listen: false).currentPage =
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

class _SlideshowModel with ChangeNotifier {
  double _currentPage = 0;
  Color _primario = Colors.blue;
  Color _secundario = Colors.grey;
  double _bulletPrimario = 15;
  double _bulletSecundario = 12;
  double get currentPage => this._currentPage;
  set currentPage(double currentPage) {
    this._currentPage = currentPage;
    notifyListeners();
  }

  Color get colorPrimario => this._primario;
  set colorPrimario(Color color) {
    this._primario = color;
    notifyListeners();
  }

  Color get colorSecundario => this._secundario;
  set colorSecundario(Color color) {
    this._secundario = color;
    notifyListeners();
  }

  double get bulletPrimario => this._bulletPrimario;
  set bulletPrimario(double bullet) {
    this._bulletPrimario = bullet;
    notifyListeners();
  }

  double get bulletSecundario => this._bulletSecundario;
  set bulletSecundario(double bullet) {
    this._bulletSecundario = bullet;
    notifyListeners();
  }
}
