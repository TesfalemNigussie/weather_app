import 'package:flutter/material.dart';
import 'package:weather_app/core/theme/theme.dart';

class ChangeLocation extends StatefulWidget {
  final ScrollController scrollController;
  final Function(String) onChangeLocation;

  ChangeLocation({
    super.key,
    required this.scrollController,
    required this.onChangeLocation,
  });

  @override
  State<ChangeLocation> createState() => _ChangeLocationState();
}

class _ChangeLocationState extends State<ChangeLocation> {
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 30,
        horizontal: 20,
      ),
      child: SingleChildScrollView(
        controller: widget.scrollController,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tell us your city',
                  style: fontSemiBold(16),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  borderRadius: BorderRadius.circular(100),
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.grey.shade300,
                    ),
                    child: const Icon(
                      Icons.close,
                      size: 14,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: textEditingController,
              decoration: InputDecoration(
                labelText: 'City/Zip Code',
                labelStyle: fontRegular(12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Colors.grey.shade400,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Colors.grey.shade400,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Colors.grey.shade500,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(
                  const Size(
                    double.maxFinite,
                    60,
                  ),
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all(
                  Colors.blue.shade900,
                ),
              ),
              onPressed: () {
                widget.onChangeLocation.call(textEditingController.text);
                Navigator.pop(context);
              },
              child: Text(
                'Show weather',
                style: fontRegular(
                  16,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
