import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../widgets/appbar.dart';
import '../widgets/button.dart';
import '../widgets/inputs.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final inputController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.black,
        child: Stack(
          children: [
            Image.asset(
              "assets/background/background.png",
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Scaffold(
              backgroundColor: Colors.transparent,
              body: SafeArea(
                child: Column(
                  children: [
                    const AppbarDesign(),
                    SizedBox(
                      height: 30.h,
                    ),
                    Form(
                      key: _formKey,
                      child: Input(
                        controller: inputController,
                      ),
                    ),
                    Button(
                      text: "Message Number",
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          if (inputController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "This Field is Required!!",
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                                behavior: SnackBarBehavior.floating,
                                backgroundColor: Colors.red,
                              ),
                            );
                          } else {
                            launchUrlString(
                              "https://wa.me/+91${inputController.text}",
                            );
                          }
                        }
                      },
                      inputController: inputController,
                    ),
                  ],
                ),
              ),
              bottomNavigationBar: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(color: Color(0xff25D366)),
                    child: Text(
                      '</> & Crafted with 💛 Vikramaditya',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
