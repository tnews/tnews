part of tnews.splash;

class SplashScreen extends StatefulWidget {
  const SplashScreen();

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final String imageAsset = "assets/images/splash_screen.png";

  double width = 0;
  double height = 0;

  Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(milliseconds: 500), (_) {
      if (width != 590) {
        width = 590;
        height = 332;
      } else {
        width = 250;
        height = 150;
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Hero(
          child: AnimatedContainer(
            width: width,
            height: height,
            child: Image.asset(imageAsset),
            duration: const Duration(seconds: 500),
          ),
          tag: imageAsset,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }
}
