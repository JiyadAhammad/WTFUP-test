import 'package:flutter/material.dart';

import '../constant/color/colors.dart';
import '../widget/custom_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return const HomeMainCardWidget();
        },
      ),
    );
  }
}

class Test extends StatelessWidget {
  const Test({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              children: <Widget>[
                const Text('City'),
                TabDropDownWidget(
                  text: 'Noida',
                  onPressed: () {},
                ),
              ],
            ),
            Column(
              children: <Widget>[
                const Text('Location'),
                TabDropDownWidget(
                  text: 'All',
                  onPressed: () {},
                ),
              ],
            ),
            Column(
              children: <Widget>[
                const Text('Category'),
                TabDropDownWidget(
                  text: 'PRO',
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class HomeMainCardWidget extends StatelessWidget {
  const HomeMainCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.asset(
            'asset/image/image1.webp',
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text('Wtf: the fitness Point Gym'),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.location_on,
                    color: kblackIcon,
                  ),
                  label: const Text(
                    '3.14',
                    style: TextStyle(
                      color: kblackText,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text('data'),
          )
        ],
      ),
    );
  }
}

class TabDropDownWidget extends StatelessWidget {
  const TabDropDownWidget({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      label: const Icon(
        Icons.arrow_drop_down,
        color: kblackIcon,
      ),
      icon: Text(
        text,
        style: const TextStyle(
          color: kblackText,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
