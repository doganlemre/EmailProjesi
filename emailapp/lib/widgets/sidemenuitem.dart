// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../services/storage.dart';

class SideBar extends StatelessWidget {
  const SideBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
      child: ListView(
        children: [
          Row(
            children: [
              Icon(Icons.arrow_downward_outlined),
              Text(
                "Sık Kullanılanlar",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          Gap(15),
          InkWell(
            onTap: () => Navigator.pushNamed(context, "/home"),
            child: Row(
              children: [
                Text(
                  "Gelen Kutusu:",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "topcuyigithan@gma...",
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
          Gap(5),
          InkWell(
            onTap: () => Navigator.pushNamed(context, "/submited"),
            child: Text(
              "Gönderilmiş Ögeler",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Gap(5),
          Text(
            "Taslaklar",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          Gap(5),
          Text(
            "Silinmiş Ögeler",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          Gap(5),
          Row(
            children: [
              Text(
                "Gelen Kutusu:",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                "22121608@stu...",
                style:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
              )
            ],
          ),
          Divider(
            thickness: 2,
          ),
          Row(
            children: [
              Icon(
                Icons.arrow_downward_outlined,
              ),
              Text(
                "topcuyigithan@gma...",
              )
            ],
          ),
          Gap(5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Gelen Kutusu:",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                "499",
                style: TextStyle(
                    color: Color.fromARGB(255, 5, 123, 219),
                    fontSize: 15,
                    fontWeight: FontWeight.w800),
              ),
            ],
          ),
          Gap(5),
          Text(
            "Gönderilmiş Ögeler",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          Gap(5),
          Text(
            "Taslaklar",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          Gap(5),
          Text(
            "Silinmiş Ögeler",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          Gap(5),
          Text(
            "Arşiv",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          Gap(5),
          Text(
            "Gereksiz E-Posta",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          InkWell(
            onTap: () => Navigator.pushNamed(context, "/contact"),
            child: Text("İletişim"),
          ),
          SizedBox(
            height: 90,
          ),
          ElevatedButton(
              onPressed: () async {
                Storage storage = Storage();
                await storage.clearUser();
                Navigator.of(context).pushReplacementNamed("/login");
              },
              child: Text("Çıkış yap")),
          Row(
            children: [
              Icon(Icons.keyboard_arrow_right_outlined),
              Text(
                "22121608@stu.istinye.edu.tr",
                style: TextStyle(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
