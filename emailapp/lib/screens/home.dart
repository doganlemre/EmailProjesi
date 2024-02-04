// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings, non_constant_identifier_names, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../services/storage.dart';
import '../widgets/sidemenuitem.dart';

import '../services/data.dart';
import '../services/responsive.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Screen device = Screen.mobile;

  Map<String, dynamic> user = {
    "name": "",
    "id": "",
    "phone": "",
    "email": "",
  };

  check() async {
    Storage storage = Storage();
    final user = await storage.loadUser();

    if (user != null) {
      setState(() {
        this.user = user;
      });
    } else {
      Navigator.pushReplacementNamed(context, "/login");
    }
  }

  @override
  void initState() {
    super.initState();
  }

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
                      CircleAvatar(
                        backgroundImage: AssetImage("assets/image/k1.jpg"),
                        radius: 35,
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
                      "Projenizin son teslim tarihi 04.02.2024 olarak belirlenmiştir. Bu tarihe kadar proje raporunuzu Blackboard adresine elektronik olarak göndermenizi bekliyorum. Lütfen belirtilen tarihi kesinlikle göz önünde bulundurunuz, çünkü bu tarihten sonra herhangi bir gecikme durumu değerlendirilmeye alınmayacaktır.",
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
                          "İyi çalışmalar\nKeyvan Arasteh",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w100),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "2 Ek",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        Row(
                          children: [
                            Text(
                              "Hepsini indir",
                            ),
                            Icon(Icons.download_sharp),
                          ],
                        ),
                      ],
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
      itemCount: mails.length,
      itemBuilder: (context, index) => Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundImage:
                      AssetImage(mails[index]["avatar"].toString()),
                  radius: 35,
                ),
                Gap(8),
                Expanded(
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          Text(mails[index]["title"].toString()),
                          Text(
                            mails[index]["subtitle"].toString(),
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
                      (mails[index]["date"] as DateTime).hour.toString() +
                          ":" +
                          (mails[index]["date"] as DateTime).minute.toString(),
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              mails[index]["text"].toString(),
            ),
            Divider()
          ],
        ),
      ),
    );
  }
}
