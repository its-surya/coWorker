import 'package:coworker/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OnboardingLayout extends StatelessWidget {
  const OnboardingLayout({this.details, this.image, this.title});

  final String? details;
  final String? image;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration:
            kBackground.copyWith(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 120),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Lottie.asset(
                  image!,
                ),
              ),
              const SizedBox(height: 20.0),
              Text(
                title!,
                style: const TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20.0),
              Text(
                details!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
