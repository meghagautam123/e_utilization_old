import 'dart:async';
import 'package:e_utilization/map/MyPageThird.dart';
import 'package:e_utilization/screens/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../map/MyPageSecond.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(Duration(seconds: 3),
            () =>
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder:
                 //   (context) => DashboardScreen()
                  (context) => LoginScreen()
               // (context) => MyPageSecond()
                 //   (context) => MyPageSe
                 //   (context) => MyPageThird()

                )
            )
    );
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              // color: Colors.red.withOpacity(0.1),
                image: DecorationImage(

                    image: NetworkImage(
                      // 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShp2T_UoR8vXNZXfMhtxXPFvmDWmkUbVv3A40TYjcunag0pHFS_NMblOClDVvKLox4Atw&usqp=CAU',
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSx7IBkCtYd6ulSfLfDL-aSF3rv6UfmWYxbSE823q36sPiQNVFFLatTFdGeUSnmJ4tUzlo&usqp=CAU'),
                    fit: BoxFit.cover,
                    opacity: 0.3)),

            child: SafeArea(
                child: Center(
                    /*child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,*/
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: [
                            /*Lottie.network(
                      // 'https://assets6.lottiefiles.com/private_files/lf30_ulp9xiqw.json', //shakeing lock
                      'https://assets6.lottiefiles.com/packages/lf20_k9wsvzgd.json',
                      animate: true,
                      height: 120,
                      width: 600),*/
                            // logo here
                            // Image.asset(
                            //   'assets/images/logo_new.png',
                            //   height: 120,
                            //   width: 120,
                            // ),
                        Image.asset('assets/images/nrsclogo.png',width: 100,height:100),

                        const Text(
                                'E Utilization',
                                style: TextStyle(
                                  fontFamily: "RobotoBold",
                                  fontSize: 40,
                                ),
                              ),

                          ],)))));
                        }
                        }