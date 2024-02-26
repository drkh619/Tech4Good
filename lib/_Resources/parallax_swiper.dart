import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'drag_scroll_behavior_configuration.dart';
import 'package:url_launcher/url_launcher.dart'; // Import url_launcher package

class ParallaxSwiper extends StatefulWidget {
  const ParallaxSwiper({
    Key? key,
    required this.images,
    required this.customTexts,
    required this.urls,
    this.dragToScroll = true,
    this.viewPortFraction = 1,
    this.padding = const EdgeInsets.all(8.0),
    this.parallaxFactor = 10.0,
    this.foregroundFadeEnabled = true,
    this.backgroundZoomEnabled = true,
  }) : super(key: key);

  final List<String> images;
  final List<String> customTexts;
  final List<String> urls; // New parameter for URLs

  final bool dragToScroll;
  final double viewPortFraction;
  final EdgeInsets padding;
  final double parallaxFactor;
  final bool foregroundFadeEnabled;
  final bool backgroundZoomEnabled;

  @override
  State<ParallaxSwiper> createState() => _ParallaxSwiperState();
}

class _ParallaxSwiperState extends State<ParallaxSwiper> {
  late final PageController controller;
  double pageIndex = 0.0;
  bool userInteracted = false;
  late Timer autoScrollTimer;

  void _indexChangeListener() {
    setState(() => pageIndex = controller.page!);
  }

  @override
  void initState() {
    super.initState();
    controller = PageController(
      viewportFraction: widget.viewPortFraction,
    );

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      controller.addListener(_indexChangeListener);
      autoScrollTimer = Timer(Duration(seconds: 2), startAutoScroll);
    });
  }

  void startAutoScroll() {
    if (!userInteracted) {
      int totalPages = widget.images.length;
      int nextPageIndex = (pageIndex + 1).round();

      if (nextPageIndex == totalPages) {
        autoScrollTimer.cancel();
      } else {
        controller.animateToPage(
          nextPageIndex,
          duration: const Duration(seconds: 1),
          curve: Curves.easeInOut,
        );
        restartAutoScrollTimer();
      }
    } else {
      autoScrollTimer = Timer(Duration(seconds: 4), startAutoScroll);

      setState(() {
        userInteracted = false;
      });
    }
  }

  void restartAutoScrollTimer() {
    autoScrollTimer.cancel();
    autoScrollTimer = Timer(Duration(seconds: 2), startAutoScroll);
  }

  @override
  void dispose() {
    controller
      ..removeListener(_indexChangeListener)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior:
      widget.dragToScroll ? DragScrollBehavior() : const ScrollBehavior(),
      child: PageView.builder(
        controller: controller,
        itemCount: widget.images.length,
        itemBuilder: (context, index) {
          String customText = widget.customTexts[index];
          double value =
          controller.position.haveDimensions ? pageIndex - index : 0;

          return GestureDetector(
            onTap: () {
              if (widget.urls.isNotEmpty && index < widget.urls.length) {
                launch(widget.urls[index]); // Launch URL on tap
              }
            },
            child: _SwiperItem(
              image: widget.images[index],
              url: widget.urls.isNotEmpty && index < widget.urls.length
                  ? widget.urls[index]
                  : '',
              value: value,
              padding: widget.padding,
              parallaxFactor: widget.parallaxFactor,
              foregroundFadeEnabled: widget.foregroundFadeEnabled,
              backgroundZoomEnabled: widget.backgroundZoomEnabled,
              child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:  Text(
                    customText,
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _SwiperItem extends StatelessWidget {
  const _SwiperItem({
    Key? key,
    required this.image,
    required this.url,
    required this.parallaxFactor,
    required this.value,
    required this.padding,
    this.child,
    this.foregroundFadeEnabled = true,
    this.backgroundZoomEnabled = true,
  }) : super(key: key);

  final String image;
  final String url;
  final double parallaxFactor;
  final double value;
  final EdgeInsets padding;
  final Widget? child;
  final bool foregroundFadeEnabled;
  final bool backgroundZoomEnabled;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width.clamp(200.0, 500.0);
    final tween = Tween<double>(begin: 0.0, end: 1.0).transform(value);
    final foregroundOffset = Offset(-(tween * pow(parallaxFactor, 2.2)), 0);
    final foregroundOpacity =
    foregroundFadeEnabled ? 1 - tween.clamp(0.0, 1.0) : 1.0;
    final backgroundOffset = Offset(tween * pow(parallaxFactor, 2), 0);
    final scale = backgroundZoomEnabled ? 1.0 + (value.abs() * 0.15) * 1.1 : 1.0;

    return Container(
      padding: padding,
      width: width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            Transform.translate(
              offset: backgroundOffset,
              child: Transform.scale(
                scale: 1.2 * scale,
                child: LayoutBuilder(builder: (context, constraints) {
                  return Image.asset(
                    image,
                    width: constraints.maxWidth,
                    height: constraints.maxHeight,
                    fit: BoxFit.cover,
                  );
                }),
              ),
            ),
            if (child != null)
              AnimatedOpacity(
                opacity: foregroundOpacity,
                duration: const Duration(milliseconds: 100),
                child: Transform.translate(
                  offset: foregroundOffset,
                  child: child,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
