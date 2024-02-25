// import 'package:event_management/Organizer/Organizer_Home_Page.dart';
import 'package:deaf_and_project/User/user_Splash_Screen.dart';
import 'package:flutter/material.dart';

class OnboardingPage1 extends StatelessWidget {
  const OnboardingPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnboardingPagePresenter(pages: [
        OnboardingPageModel(
          title: 'Learn, Play and Communicate',
          description: 'Enjoy the best of the world in the palm of your hands.',
          imageUrl: 'https://i.ibb.co/Nn3LPmn/image1.jpg',
          bgColor: Color(0xffc7c4b3),
        ),
        OnboardingPageModel(
          title: 'Unleash your voice!',
          description: 'Explore, learn, and play with tools that help you express yourself just like everyone else',
          imageUrl: 'https://i.ibb.co/n7zVKSX/image4.jpg',
          bgColor: const Color(0xffd27877),
        ),
        OnboardingPageModel(
          title: 'Unlock your full potential',
          description:
          'This app is your personalized toolkit for mastering any subject and thriving in school.',
          imageUrl: 'https://i.ibb.co/HnqvpHd/image6.jpg',
          bgColor: const Color(0xffdc9d2c),
        ),
        OnboardingPageModel(
          title: 'Manage Students & a lot more',
          description: 'Every student, every story, celebrated within a supportive learning environment.',
          imageUrl: 'https://i.ibb.co/RhTtvRD/image7.jpg',
          bgColor: Color(0xff7c4fae),
        ),
      ]),
    );
  }
}

class OnboardingPagePresenter extends StatefulWidget {
  final List<OnboardingPageModel> pages;
  final VoidCallback? onSkip;
  final VoidCallback? onFinish;

  const OnboardingPagePresenter(
      {Key? key, required this.pages, this.onSkip, this.onFinish})
      : super(key: key);

  @override
  State<OnboardingPagePresenter> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPagePresenter> {
  // Store the currently visible page
  int _currentPage = 0;
  // Define a controller for the pageview
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        color: widget.pages[_currentPage].bgColor,
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                // Pageview to render each page
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: widget.pages.length,
                  onPageChanged: (idx) {
                    // Change current page when pageview changes
                    setState(() {
                      _currentPage = idx;
                    });
                  },
                  itemBuilder: (context, idx) {
                    final item = widget.pages[idx];
                    return Column(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(32.0),
                            child: Image.network(
                              item.imageUrl,
                            ),
                          ),
                        ),
                        Expanded(
                            flex: 1,
                            child: Column(children: [
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(item.title,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6
                                        ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: item.textColor,
                                    )),
                              ),
                              Container(
                                constraints:
                                const BoxConstraints(maxWidth: 280),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24.0, vertical: 8.0),
                                child: Text(item.description,
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2
                                        ?.copyWith(
                                      color: item.textColor,
                                    )),
                              )
                            ]))
                      ],
                    );
                  },
                ),
              ),

              // Current page indicator
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: widget.pages
                    .map((item) => AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  width: _currentPage == widget.pages.indexOf(item)
                      ? 30
                      : 8,
                  height: 8,
                  margin: const EdgeInsets.all(2.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0)),
                ))
                    .toList(),
              ),

              // Bottom buttons
              SizedBox(
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        style: TextButton.styleFrom(
                            visualDensity: VisualDensity.comfortable,
                            foregroundColor: Colors.white,
                            textStyle: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        onPressed: () {
                          widget.onSkip?.call();
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => user_Splash_Screen()));
                        },
                        child: const Text("Skip")),
                    TextButton(
                      style: TextButton.styleFrom(
                          visualDensity: VisualDensity.comfortable,
                          foregroundColor: Colors.white,
                          textStyle: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      onPressed: () {
                        if (_currentPage == widget.pages.length - 1) {
                          widget.onFinish?.call();
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => user_Splash_Screen()));
                        } else {
                          _pageController.animateToPage(_currentPage + 1,
                              curve: Curves.easeInOutCubic,
                              duration: const Duration(milliseconds: 250));
                        }
                      },
                      child: Row(
                        children: [
                          Text(
                            _currentPage == widget.pages.length - 1
                                ? "Finish"
                                : "Next",
                          ),
                          const SizedBox(width: 8),
                          Icon(_currentPage == widget.pages.length - 1
                              ? Icons.done
                              : Icons.arrow_forward),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class OnboardingPageModel {
  final String title;
  final String description;
  final String imageUrl;
  final Color bgColor;
  final Color textColor;

  OnboardingPageModel(
      {required this.title,
        required this.description,
        required this.imageUrl,
        this.bgColor = Colors.blue,
        this.textColor = Colors.white});
}
