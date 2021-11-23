


import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mini_project/src/configs/app_route.dart';
import 'package:mini_project/src/configs/app_setting.dart';
import 'package:mini_project/src/widgets/menu_model.dart';

import 'package:shared_preferences/shared_preferences.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> {
  final List<String> images = [
    'https://asset.pf.co.th/project-location/thumbnail/bbaf472f4671eb81.jpg',
    'https://www.sansiri.com/media/0qshx4v3/condo-me-navanakorn-condo-cover-banner-mobile.jpg',
    'https://images.pexels.com/photos/439391/pexels-photo-439391.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSfoA6CncQr7LCRjL3B-_T97YN1ZA-Sit2JRw&usqp=CAU',
    'https://cdn.renthub.in.th/images/uploaded/201907/20190710/apartment_pictures/normal/23727eb1138063164704739561c83868.jpg?1562754566',
    'https://www.jp-builder.com/wp-content/uploads/2019/05/pic07-980x623.jpg',
    'https://s3-ap-southeast-1.amazonaws.com/o77site/xt-huai-khwang-condominium-portrait-810x890.jpg',
  ];
  List<Map<String, String>> imgArray = [
    {
      "img":
      "https://www.sansiri.com/media/0qshx4v3/condo-me-navanakorn-condo-cover-banner-mobile.jpg",
      "title": "คอนโดมี นวนคร",
      "description":
      "คอนโดหรู ย่านทองหล่อ.",
      "price": "\$30,135",
      "page": "login"
    },
    {
      "img":
      "https://s3-ap-southeast-1.amazonaws.com/o77site/sansiri-the-muve-phadipat-condo-thumbnail-02.jpg",
      "title": "เดอะ มูฟ ประดิพัทธ์คอนโดใหม่แต่งครบ",
      "description":
      "3-14 พ.ย.นี้ เปิดจองครั้งแรกที่ Sales Center พระราม 4.",
      "price": "\$200",
      "page": "info"
    },
    {
      "img":
      "https://s3-ap-southeast-1.amazonaws.com/o77site/the-line-phahonyothin-park-condominium-landscape-935x745.jpg",
      "title": "เดอะ ไลน์พหลโยธิน พาร์ค",
      "description":
      "คอนโดใกล้รถไฟฟ้า เพียง 300 เมตร จาก BTS ห้าแยกลาดพร้าว และ 1 นาที จากเซ็นทรัล ลาดพร้าว",
      "price": "\$300",
      "page": "upcoming"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/assarun.jpg'),
              ),
              accountName: Text('Assarun Daengsen',
                style: TextStyle(color: Colors.white),),
              accountEmail: Text('624235015@parichat.skru.ac.th',style: TextStyle(color: Colors.white),),
              decoration: BoxDecoration(
                color: Colors.redAccent,
              ),
            ),
            ...MenuViewModel()
                .items
                .map((e) => ListTile(
              leading: Icon(
                e.icon,
                color: e.iconColor,
              ),
              title: Text(e.title),
              onTap: () {
                e.onTap(context);
              },
            ))
                .toList(),
            Spacer(),
            ListTile(
              leading: Icon(
                Icons.exit_to_app,
                color: Colors.red,
              ),
              title: const Text('Logout'),
              onTap: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.remove(AppSetting.userNameSetting);
                prefs.remove(AppSetting.passwordSetting);
                Navigator.pushNamed(context, AppRoute.loginRoute);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            CarouselSlider.builder(
              itemCount: images.length,
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 2.0,
                enlargeCenterPage: true,
              ),
              itemBuilder: (context, index, realIdx) {
                return Container(
                  child: Center(
                      child: Image.network(images[index],
                          fit: BoxFit.cover, width: 1000)),
                );
              },
            ),
            SizedBox(
              height: 20,
            ),
            CarouselSlider(
              items: imgArray
                  .map((item) => GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, item["page"]);
                },
                child: Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.4),
                                blurRadius: 8,
                                spreadRadius: 0.3,
                                offset: Offset(0, 3))
                          ]),
                          child: AspectRatio(
                            aspectRatio: 2 / 2,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: Image.network(
                                item["img"],
                                fit: BoxFit.cover,
                                alignment: Alignment.topCenter,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Column(
                          children: [
                            Text(item["price"],
                                style: TextStyle(
                                    fontSize: 16, color: Colors.pink.shade200)),
                            Text(item["title"],
                                style:
                                TextStyle(fontSize: 32, color: Colors.black)),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 16.0, right: 16.0, top: 8),
                              child: Text(
                                item["description"],
                                style: TextStyle(
                                    fontSize: 16, color: Colors.pink.shade200),
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ))
                  .toList(),
              options: CarouselOptions(
                  height: 530,
                  autoPlay: false,
                  enlargeCenterPage: false,
                  aspectRatio: 4 / 4,
                  enableInfiniteScroll: false,
                  initialPage: 0,
                  // viewportFraction: 1.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                    });
                  }),
            ),
          ],
        ),
      ),
    );
  }
} //end class
