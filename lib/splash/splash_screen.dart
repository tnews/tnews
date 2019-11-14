part of tnews.splash;

class SplashScreen extends StatelessWidget {
  final String imageAsset = "assets/images/splash_screen.png";
  const SplashScreen();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(imageAsset),
      ),
    );
  }
}
