// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactWidget extends StatefulWidget {
  const ContactWidget({
    super.key,
  });

  @override
  State<ContactWidget> createState() => _ContactWidgetState();
}

class _ContactWidgetState extends State<ContactWidget> {
  yGithub() {
    final Uri uri = Uri.parse("https://github.com/Yido1007");
    launchUrl(uri);
  }

  yLinkedin() {
    final Uri uri =
        Uri.parse("https://www.linkedin.com/in/yigithan-ihsan-topcu/");
    launchUrl(uri);
  }

  fGithub() {
    final Uri uri = Uri.parse("https://github.com/FurkanSanverdi");
    launchUrl(uri);
  }

  fLinkedin() {
    final Uri uri = Uri.parse(
        "https://www.linkedin.com/in/furkan-%C5%9Fanverdi-3ab811255/");
    launchUrl(uri);
  }

  eGithub() {
    final Uri uri = Uri.parse("https://github.com/doganlemre");
    launchUrl(uri);
  }

  eLinkedin() {
    final Uri uri =
        Uri.parse("https://www.linkedin.com/in/mustafa-emre-doğan-44a95327a/");
    launchUrl(uri);
  }

  phone() {
    final Uri uri = Uri.parse(
      "tel:<555 555 55 55>",
    );
    launchUrl(uri);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "BİZİMLE İLETİŞİM KURUN",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 25,
        ),
        Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(49, 47, 54, 1),
          ),
          width: 350,
          height: 450,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        "Yiğithan\nTopçu",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      Gap(10),
                      InkWell(
                        onTap: yGithub,
                        child: SvgPicture.asset(
                          "assets/icon/github.svg",
                          width: 50,
                          color: Colors.white,
                        ),
                      ),
                      Gap(10),
                      InkWell(
                        onTap: yLinkedin,
                        child: SvgPicture.asset(
                          "assets/icon/linkedin.svg",
                          width: 50,
                          color: Colors.white,
                        ),
                      ),
                      Gap(10),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "Furkan\nŞanverdi",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      Gap(10),
                      InkWell(
                        onTap: fGithub,
                        child: SvgPicture.asset(
                          "assets/icon/github.svg",
                          width: 50,
                          color: Colors.white,
                        ),
                      ),
                      Gap(10),
                      InkWell(
                        onTap: fLinkedin,
                        child: SvgPicture.asset(
                          "assets/icon/linkedin.svg",
                          width: 50,
                          color: Colors.white,
                        ),
                      ),
                      Gap(10),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "Emre\nDoğan",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      Gap(10),
                      InkWell(
                        onTap: eGithub,
                        child: SvgPicture.asset(
                          "assets/icon/github.svg",
                          width: 50,
                          color: Colors.white,
                        ),
                      ),
                      Gap(10),
                      InkWell(
                        onTap: eLinkedin,
                        child: SvgPicture.asset(
                          "assets/icon/linkedin.svg",
                          width: 50,
                          color: Colors.white,
                        ),
                      ),
                      Gap(10),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    "Raspiyonel AŞ",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  InkWell(
                    onTap: phone,
                    child: Icon(
                      Icons.phone,
                      size: 50,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
