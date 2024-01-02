import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Input extends StatelessWidget {
  const Input({
    Key? key,
    this.controller,
  }) : super(key: key);

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: 16.w, end: 16.w, bottom: 50.h),
      child: TextFormField(
        controller: controller,
        style: const TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                15.r,
              ),
              borderSide: const BorderSide(
                color: Color(
                  0xff25D366,
                ),
              )),
          filled: true,
          fillColor: Colors.black54,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                15.r,
              ),
              borderSide: const BorderSide(
                color: Color(
                  0xff25D366,
                ),
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                15.r,
              ),
              borderSide: const BorderSide(
                color: Colors.white,
              )),
          labelText: "Write WhatsApp Number...",
          labelStyle: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter a WhatsApp number.';
          } else if (value.length != 10 ||
              !RegExp(r'^[0-9]+$').hasMatch(value)) {
            return 'Please enter a valid 10-digit number.';
          }
          return null;
        },
      ),
    );
  }
}
