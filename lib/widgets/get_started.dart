import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_app/views/search_page.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            const SizedBox(
              height: 240,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  "assets/images/5858899_3042889.svg",
                  height: 320,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return const SearchPage();
                    }));
                  },
                  child: const Text(
                    "Get started",
                    style: TextStyle(fontSize: 19),
                  ),
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(210, 50),
                      backgroundColor: const Color(0xff008080)),
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}
