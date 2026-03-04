import 'package:crypto_demo/core/theme/app_colors_extensions.dart';
import 'package:crypto_demo/features/auth/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:crypto_demo/core/widgets/app_button.dart';
import 'package:crypto_demo/features/on_boarding/presentation/widgets/on_boarding_dot_indicator.dart';
import 'package:crypto_demo/features/on_boarding/presentation/widgets/on_boarding_page_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _onBoardingData = [
    {
      "image": "assets/images/onboarding_analysis_1.png",
      "title": "Welcome To Crypto X",
      "description": "Start your journey with us.", // Placeholder description
    },
    {
      "image": "assets/images/onboarding_analysis_2.png",
      "title": "Transaction Security",
      "description": "We provide the best security for your transactions.",
    },
    {
      "image": "assets/images/onboarding_analysis_3.png",
      "title": "Fast And Reliable Market Updated",
      "description": "Get real-time updates on market trends.",
    },
    {
      "image": "assets/images/onboarding_analysis_4.png",
      "title": "Get Started Now!",
      "description": "", // No description for the last page usually or centered
    },
  ];

  void _onNext() {
    if (_currentPage < _onBoardingData.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _onSkip() {
    _pageController.jumpToPage(_onBoardingData.length - 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // Skip Button (Visible on first 3 pages)
            if (_currentPage < 3)
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: _onSkip,
                  child:  Text(
                    "Skip",
                    style: TextStyle(
                      color: context.appColors.buttonBackgroundColor, // Color(0xff1D3A70),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              )
            else
              const SizedBox(height: 48), // Spacer to keep layout consistent
            // PageView
            Expanded(
              flex: 2,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemCount: _onBoardingData.length,
                itemBuilder: (context, index) {
                  return OnBoardingPageItem(
                    imagePath: _onBoardingData[index]["image"]!,
                    title: _onBoardingData[index]["title"]!,
                    description: _onBoardingData[index]["description"]!,
                  );
                },
              ),
            ),

            // Bottom Area
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: _currentPage == _onBoardingData.length - 1
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppButton(
                            onTap: () async {
                              await context.read<AuthCubit>().completeOnBoarding();
                            },
                            text: "Login",
                            backgroundColor: context.appColors.buttonBackgroundColor,// const Color(0xff1D3A70),
                            textStyle:  TextStyle(
                              color: context.appColors.buttonTextColor, // Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),
                          AppButton(
                            onTap: () async {
                              // Navigate to Register
                              await context.read<AuthCubit>().completeOnBoarding();
                            },
                            text: "Register",
                            backgroundColor: Theme.of(context).brightness == Brightness.light? Colors.white : null,
                            boxBorder: Border.all(
                              color: context.appColors.buttonBackgroundColor, // const Color(0xff1D3A70),
                            ),
                            textStyle:  TextStyle(
                              color: context.appColors.buttonBackgroundColor, // Color(0xff1D3A70),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Dots Indicator
                          OnBoardingDotIndicator(
                            currentPage: _currentPage,
                            totalPages:
                                _onBoardingData.length -
                                1, // Exclude last page from dots count if desired, or keep all. Screenshot shows 4 pages?
                            // Screenshot 1 has 4 dots. So 4 pages.
                            // But last page has no dots?
                            // If I set totalPages to 4, and hide it on page 4, it's fine.
                          ),

                          // Next Arrow
                          GestureDetector(
                            onTap: () {
                              _pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            },
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration:  BoxDecoration(
                                color: context.appColors.buttonBackgroundColor, // Color(0xff1D3A70),
                                shape: BoxShape.circle,
                              ),
                              child:  Icon(
                                Icons.arrow_forward_ios,
                                color: context.appColors.buttonTextColor, // Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
