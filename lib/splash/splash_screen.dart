part of tnews.splash;

class SplashScreen extends StatefulWidget {
  const SplashScreen();

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final String imageAsset = "assets/images/splash_screen.png";

  double width = 250;
  double height = 150;

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
    return Container(
      color: TColors.white,
      child: Center(
        child: AnimatedContainer(
          width: width,
          height: height,
          child: Image.asset(imageAsset),
          duration: const Duration(milliseconds: 250),
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
