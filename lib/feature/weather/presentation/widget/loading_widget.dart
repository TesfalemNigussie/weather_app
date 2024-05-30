import 'package:flutter/material.dart';
import 'package:weather_app/core/theme/theme.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colors.white,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.refresh,
            size: 16,
          ),
          const SizedBox(
            width: 2,
          ),
          Text(
            'Updating',
            style: fontRegular(14),
          ),
        ],
      ),
    );
  }
}
