import 'package:flutter/material.dart';
import 'package:goair/ui/widgets/custom_bottom.dart';
import '../../shared/theme.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'assets/images/image_get_started.png',
                  ),
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Liburan Menyenangkan',
                    style: whiteTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: semiBold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Explore berbagai kota bersama kami\nbiarkan dirimu mendapatkan pengalaman yang luar biasa',
                    style: whiteTextStyle.copyWith(
                      fontSize: 10,
                      fontWeight: light,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  CustomButton(
                    title: 'Get Started',
                    width: 220,
                    margin: EdgeInsets.only(
                      top: 50,
                      bottom: 80,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/sign-up');
                    },
                  ),
                ],
              ),
            ),
          ],
        )
    );
  }

}