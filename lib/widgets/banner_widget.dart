
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BannerWidget extends StatefulWidget {
  final Map data;

  const BannerWidget(this.data, {super.key});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Extract image URLs from the data
    final List<String> imageUrls = List<String>.from(widget.data['imageUrl'] ?? []);

    // Fallback if no images are provided
    if (imageUrls.isEmpty) {
      return const Center(
        child: Text(
          'No images available',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      );
    }

    return Column(
      children: [
        // Banner with PageView
        SizedBox(
          height: 200,
          width: MediaQuery.of(context).size.width,
          child: PageView.builder(
            controller: _pageController,
            itemCount: imageUrls.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  imageUrls[index],
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(
                      child: Icon(
                        Icons.broken_image,
                        size: 50,
                        color: Colors.red,
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 10),

        // Smooth Page Indicator
        SmoothPageIndicator(
          controller: _pageController,
          count: imageUrls.length,
          effect: const ExpandingDotsEffect(
            activeDotColor: Colors.blue,
            dotColor: Colors.grey,
            dotHeight: 8,
            dotWidth: 8,
            expansionFactor: 4,
            spacing: 4,
          ),
        ),
        const SizedBox(height: 10),

        // Title and Description
        Text(
          widget.data['title'] ?? 'No Title',
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(
          widget.data['description'] ?? 'No Description',
          style: const TextStyle(fontSize: 14),
        ),
      ],
    );
  }
}
