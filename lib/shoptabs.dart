import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShopTab extends StatefulWidget {
  const ShopTab({Key? key}) : super(key: key);

  @override
  _ShopTabState createState() => _ShopTabState();
}

class _ShopTabState extends State<ShopTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          _buildListItem('Turkey', 5, '12', 'assets/turkey.png'),
          _buildListItem(
              'Gingerbread x10', 3, '10', 'assets/gingerbread-man.png')
        ],
      ),
    );
  }

  _buildListItem(String shopMenu, rating, String price, String imgPath) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(
            width: 210,
            child: Row(
              children: [
                Container(
                  height: 75,
                  width: 75,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.grey,
                  ),
                  child: Center(
                    child: Image.asset(
                      imgPath,
                      height: 50,
                      width: 50,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      shopMenu,
                      style: GoogleFonts.notoSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          '£' + price,
                          style: GoogleFonts.lato(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                              textStyle:
                                  const TextStyle(color: Color(0xFFF68D7F))),
                        ),
                        const SizedBox(width: 3.0),
                        Text(
                          '£' '17',
                          style: GoogleFonts.lato(
                              fontSize: 12.0,
                              decoration: TextDecoration.lineThrough,
                              fontWeight: FontWeight.w600,
                              textStyle: TextStyle(
                                  color: Colors.grey.withOpacity(0.4))),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          FloatingActionButton(
            heroTag: shopMenu,
            mini: true,
            onPressed: () {},
            child: const Center(
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.pink,
          )
        ],
      ),
    );
  }
}
