import 'package:flutter/material.dart';

class CarouselWidget extends StatelessWidget {
  final Map data;

  const CarouselWidget(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    final items = data['items'] as List;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(data['title'],
                style:
                    const TextStyle(fontSize: 21, fontWeight: FontWeight.bold)),
          ),
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return Container(
                width: 150,
                margin: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        height: 100,
                        width: double.infinity,
                        color: Colors.grey[300],
                        child: Image.asset(
                            "assets/images/${item['placeholder']}.png")),
                    Text(item['name']),
                    Container(
                      width: double.infinity,
                      color: Colors.yellowAccent,
                      child: Column(
                        children: [
                          Text("₹${item['price']}",
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                          Text("${item['discount']}% OFF"),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
