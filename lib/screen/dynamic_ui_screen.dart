import 'package:ease_my_deal/widgets/banner_widget.dart';
import 'package:ease_my_deal/widgets/carousel_widget.dart';
import 'package:ease_my_deal/widgets/grid_widget.dart';
import 'package:flutter/material.dart';
import 'dart:convert';


class DynamicUIScreen extends StatelessWidget {
  final String config;

  const DynamicUIScreen({super.key, required this.config});

  @override
  Widget build(BuildContext context) {
    final data = jsonDecode(config);
    return Scaffold(
      appBar: AppBar(
        elevation: 20,
         title: Text(data['appBar']['title']),
        actions: const [
         Padding(
           padding: EdgeInsets.all(8.0),
           child: Icon(Icons.search),
         ),
         Padding(
           padding: EdgeInsets.all(8.0),
           child: Icon(Icons.save),
         ),
         Padding(
           padding: EdgeInsets.all(8.0),
           child: Icon(Icons.shopping_cart),
         ),
        ],
        //backgroundColor: HexColor.fromHex(data['appBar']['backgroundColor']),
      ),
      body: ListView(
        children: _buildSections(data['sections']),
      ),
    );
  }

  List<Widget> _buildSections(List sections) {
    return sections.map((section) {
      switch (section['type']) {
        case 'banner':
          return BannerWidget(section);
        case 'grid':
          return Container(
              color: const Color(0xFFDDDADD),
              child: GridWidget(section));
        case 'carousel':
          return CarouselWidget(section);
        default:
          return const SizedBox.shrink();
      }
    }).toList();
  }
}

// extension HexColor on Color {
//   static Color fromHex(String hexString) {
//     final buffer = StringBuffer();
//     if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
//     buffer.write(hexString.replaceFirst('#', ''));
//     return Color(int.parse(buffer.toString(), radix: 16));
//   }
// }
