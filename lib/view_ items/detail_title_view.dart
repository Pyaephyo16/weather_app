import 'package:flutter/material.dart';
import 'package:weather_app/resources/dimens.dart';

class DetailTitleView extends StatelessWidget {
  const DetailTitleView({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_3X_EXTRA),
      child: Text(title,
      style: TextStyle(
        color: Colors.white,
        fontSize: TEXT_REGULAR_1X,
        fontWeight: FontWeight.w600,
      ),
      ),
    );
  }
}