import 'package:flutter/material.dart';
import 'package:weather_app/core/theme/theme.dart';

class FetchingErrorWidget extends StatelessWidget {
  final Function() onReload;
  const FetchingErrorWidget({super.key, required this.onReload});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.red,
      ),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.close,
                size: 16,
                color: Colors.white,
              ),
              const SizedBox(
                width: 2,
              ),
              Text(
                'Unable to update weather information',
                style: fontRegular(
                  12,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap:(){
              onReload.call();
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 10,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.white,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.refresh,
                    size: 12,
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  Text(
                    'Reload',
                    style: fontRegular(12),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
