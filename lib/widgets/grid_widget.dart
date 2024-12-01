import 'package:flutter/material.dart';

class GridWidget extends StatelessWidget {
  final Map data;

  const GridWidget(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    final items = data['items'] as List;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
              child: Text(data['title'],
                  style: const TextStyle(
                      fontSize: 21, fontWeight: FontWeight.bold))),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 1,
            ),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/icons/${item['icon']}.png',
                    // Load image dynamically
                    width: 40,
                    height: 40,
                  ),
                  Text(item['label']),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
