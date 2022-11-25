import 'package:flutter/material.dart';
import 'package:wtftest/presentation/constant/color/colors.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kwhite,
      elevation: 0,
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.arrow_back_ios,
          color: kblackIcon,
        ),
      ),
      title: Column(
        children: const [
          Text(
            'Gyms',
            style: TextStyle(color: kblackText),
          ),
          Text(
            'noida',
            style: TextStyle(color: kblackText),
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.search,
            color: kblackIcon,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
