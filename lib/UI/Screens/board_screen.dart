import 'dart:async';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sports_101/UI/Screens/home_screen.dart';

import '../../Shared/shared_container_onboard.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startAutoPlay();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  void _startAutoPlay() {
    const autoPlayDuration = Duration(seconds: 3);
    _timer = Timer.periodic(autoPlayDuration, (timer) {
      if (_currentPage < 2) {
        _pageController.nextPage(
            duration: const Duration(milliseconds: 1000), curve: Curves.ease);
      } else {
        _pageController.animateToPage(0,
            duration: const Duration(milliseconds: 1000), curve: Curves.ease);
      }
    });
  }

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  void _skipOnboarding() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }

  void _goToPage(int page) {
    _pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 1000),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Align(
              alignment: const Alignment(0, .3),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.transparent,
                ),
                height: MediaQuery.of(context).size.height * .70,
                width: MediaQuery.of(context).size.width * 0.80,
                child: PageView(
                  controller: _pageController,
                  onPageChanged: _onPageChanged,
                  children: const [
                    Boarding(
                      imagePass: "assets/Images/Basket_ch.png",
                      uniSize: .6,
                      backgroundColor: Colors.transparent,
                      title:
                          'Welcome to Sports 101\n\n Join us for the ultimate sports experience.',
                    ),
                    Boarding(
                      imagePass: "assets/Images/football_ch.png",
                      uniSize: .78,
                      backgroundColor: Colors.transparent,
                      title: 'Discover the excitement of the world of sports.',
                    ),
                    Boarding(
                      imagePass: "assets/Images/baseball_2.png",
                      uniSize: .6,
                      backgroundColor: Colors.transparent,
                      title:
                          'You\'re all set to start your sports journey with us!',
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.transparent,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SizedBox(width: 50),
                  SmoothPageIndicator(
                    controller: _pageController,
                    count: 3,
                    effect: const ExpandingDotsEffect(
                      activeDotColor: Colors.white,
                      dotColor: Colors.white30,
                      dotHeight: 8,
                      dotWidth: 8,
                    ),
                  ),
                  GestureDetector(
                    onTap: _skipOnboarding,
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color(0xFF1D1C21),
                          borderRadius: BorderRadius.circular(15)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8.0),
                      child: const Text(
                        'Skip',
                        style: TextStyle(color: Colors.white60, fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
