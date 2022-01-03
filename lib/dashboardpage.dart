// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop/santapage.dart';
import 'package:shop/shoptabs.dart';

class dashboadrPage extends StatefulWidget {
  const dashboadrPage({Key? key}) : super(key: key);

  @override
  dashboadrPageState createState() => dashboadrPageState();
}

class dashboadrPageState extends State<dashboadrPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 4);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Icon(Icons.menu, color: Colors.black),
                Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          blurRadius: 6.0,
                          spreadRadius: 4.0,
                          offset: const Offset(0.0, 3.0),
                        )
                      ],
                      color: const Color(0xFFC6E7FE),
                      shape: BoxShape.circle,
                      image: const DecorationImage(
                          image: AssetImage('assets/santa.png'),
                          fit: BoxFit.contain)),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              'SEARCH FOR',
              style: GoogleFonts.notoSans(
                  fontWeight: FontWeight.w800, fontSize: 27.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              'CHRISTMAS',
              style: GoogleFonts.notoSans(
                  fontWeight: FontWeight.w800, fontSize: 27.0),
            ),
          ),
          const SizedBox(height: 25.0),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: Container(
              padding: const EdgeInsets.only(left: 5.0),
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10.0)),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: GoogleFonts.notoSans(fontSize: 14.0),
                  border: InputBorder.none,
                  fillColor: Colors.grey.withOpacity(0.5),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              'Recommended',
              style: GoogleFonts.notoSans(
                  fontWeight: FontWeight.w500, fontSize: 18.0),
            ),
          ),
          const SizedBox(height: 15),
          SizedBox(
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildListItem('Christmas Tree', 'assets/christmas-tree.png',
                    '75', Colors.green.shade300, Colors.green.shade800),
                _buildListItem('Candy Cane', 'assets/candy-cane.png', '5',
                    Colors.red.shade300, Colors.red.shade800),
                _buildListItem('Giftbox', 'assets/giftbox.png', '20',
                    Colors.orange.shade300, Colors.orange.shade800),
                _buildListItem('Deer', 'assets/deer.png', '200',
                    Colors.brown.shade300, Colors.brown.shade800),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: TabBar(
              controller: tabController,
              isScrollable: true,
              indicatorColor: Colors.transparent,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey.withOpacity(0.5),
              labelStyle: GoogleFonts.notoSans(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
              unselectedLabelStyle: GoogleFonts.notoSans(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
              tabs: const [
                Tab(
                  child: Text('Food'),
                ),
                Tab(
                  child: Text('hehe'),
                ),
                Tab(
                  child: Text('hehe'),
                ),
                Tab(
                  child: Text('hehe'),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height - 450,
            child: TabBarView(
              controller: tabController,
              children: const [
                ShopTab(),
                ShopTab(),
                ShopTab(),
                ShopTab(),
              ],
            ),
          )
        ],
      ),
    );
  }

  _buildListItem(String shopMenu, String imgPath, String price, Color bgColor,
      Color textColor) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => SantaPage(
              heroTag: shopMenu,
              shopName: shopMenu,
              pricePerItem: price,
              imgPath: imgPath,
            ),
          ));
        },
        child: Container(
          height: 175,
          width: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: bgColor),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: shopMenu,
                child: Container(
                  height: 75,
                  width: 75,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Image.asset(
                      imgPath,
                      height: 60,
                      width: 80,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                shopMenu,
                style: GoogleFonts.notoSans(fontSize: 17, color: textColor),
              ),
              Text(
                '£' + price,
                style: GoogleFonts.notoSans(fontSize: 17, color: textColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
