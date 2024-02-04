// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import '../widgets/sidemenuitem.dart';

import '../services/data.dart';
import '../services/responsive.dart';

class SubmitedMail extends StatefulWidget {
  const SubmitedMail({super.key});

  @override
  State<SubmitedMail> createState() => _SubmitedMailState();
}

class _SubmitedMailState extends State<SubmitedMail> {
  Screen device = Screen.mobile;
  drawScreen() {
    switch (device) {
      case (Screen.mobile):
        return PhoneMails();
      case (Screen.tablet):
        return Row(
          children: [
            SizedBox(
              width: 280,
              height: double.infinity,
              child: PhoneMails(),
            ),
            Expanded(child: MailPage()),
          ],
        );
      case (Screen.desktop):
        return Row(
          children: [
            SizedBox(
              width: 280,
              height: double.infinity,
              child: SideBar(),
            ),
            SizedBox(
              width: 280,
              height: double.infinity,
              child: PhoneMails(),
            ),
            Expanded(child: MailPage()),
          ],
        );
    }
  }

  drawAppbar() {
    switch (device) {
      case (Screen.mobile):
        return AppBar(
          title: Text("Raspiyonel Mail"),
        );
      case (Screen.tablet):
        return AppBar(
          title: Text("Raspiyonel Mail"),
        );
      case (Screen.desktop):
        return AppBar();
    }
  }

  drawDrawer() {
    switch (device) {
      case (Screen.mobile):
        return Drawer(
          child: SideBar(),
        );
      case (Screen.tablet):
        return Drawer(
          child: SideBar(),
        );
      case (Screen.desktop):
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      device = detectScreen(MediaQuery.of(context).size);
    });
    return Scaffold(
      appBar: drawAppbar(),
      body: drawScreen(),
      drawer: drawDrawer(),
    );
  }

  ListView MailPage() {
    return ListView(
      children: [
        Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        "assets/image/5437360.svg",
                        width: 55,
                      ),
                      Gap(10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Keyvan Arasteh",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 18),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                          Text(
                            "Final Projesi ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 24),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                      ),
                      Text("13:44"),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Hocam merhaba ben 221216048 nolu 2. Mobil programlama sınıfından öğrenciniz Yiğithan İhsan Topçu. Ben ve arkadaşlarım bitirme projesinde flutter da bir chatbot uygulaması tasarlıyoruz. Botumuz için olan json dosyasını oluşturduk bir arayüzümüz var fakat bu arayüzle json dosyasını nasıl birleştireceğimiz hakkında bir bilgimiz yok. Rica etsek bize yardımcı olabilir misiniz ?",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w100),
                      maxLines: 5,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Text(
                          "Değerli yardımlarınız arz ederim.\nTeşekkür ederim, iyi akşamlar.",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w100),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Divider(
                      height: 34,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  ListView PhoneMails() {
    return ListView.builder(
      itemCount: submited.length,
      itemBuilder: (context, index) => Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage("assets/image/person.png"),
                  radius: 35,
                ),
                Gap(13),
                Expanded(
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(submited[index]["name"].toString()),
                          Text(
                            submited[index]["title"].toString(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Text(
                      (mails[index]["date"] as DateTime).day.toString() +
                          ":" +
                          (mails[index]["date"] as DateTime).month.toString(),
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Text(
                submited[index]["subtitle"].toString(),
              ),
            ),
            Divider()
          ],
        ),
      ),
    );
  }
}
