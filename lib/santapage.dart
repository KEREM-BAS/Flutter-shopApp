// ignore_for_file: use_key_in_widget_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SantaPage extends StatefulWidget {
  final imgPath, shopName, pricePerItem, heroTag;
  const SantaPage(
      {this.heroTag, this.imgPath, this.pricePerItem, this.shopName});

  @override
  _SantaPageState createState() => _SantaPageState();
}

class _SantaPageState extends State<SantaPage> {
  var netPrice = 0.0;
  var quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.menu, color: Colors.black),
                Stack(
                  children: [
                    Container(
                      height: 45,
                      width: 45,
                      color: Colors.transparent,
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.pink.withOpacity(0.3),
                            blurRadius: 6,
                            spreadRadius: 4,
                            offset: const Offset(0.0, 0.4),
                          )
                        ],
                        color: Colors.pink,
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 1,
                      right: 4,
                      child: Container(
                        height: 14,
                        width: 14,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          ' 1',
                          style: GoogleFonts.notoSans(
                            fontSize: 12,
                            textStyle: const TextStyle(color: Colors.red),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              'SUPER',
              style: GoogleFonts.notoSans(
                  fontWeight: FontWeight.w800, fontSize: 27),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              widget.shopName.toString().toUpperCase(),
              style: GoogleFonts.notoSans(
                fontWeight: FontWeight.w800,
                fontSize: 27,
              ),
            ),
          ),
          const SizedBox(height: 48),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Hero(
                tag: widget.heroTag,
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(widget.imgPath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 45,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.pink.withOpacity(0.1),
                              blurRadius: 6,
                              spreadRadius: 6,
                              offset: const Offset(5, 11),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white),
                        child: const Center(
                          child: Icon(
                            Icons.favorite_border,
                            color: Colors.pink,
                            size: 25,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 70,
                width: 125,
                color: Colors.white,
                child: Center(
                  child: Text(
                    '£' +
                        (int.parse(widget.pricePerItem) * quantity).toString(),
                    style: GoogleFonts.notoSans(
                      fontSize: 40,
                      color: Colors.grey.shade800,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Container(
                height: 60,
                width: 225,
                decoration: const BoxDecoration(
                  color: Colors.pink,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 40,
                      width: 105,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            iconSize: 17,
                            onPressed: () {
                              adjustQuantity('MINUS');
                            },
                            icon: const Icon(
                              Icons.remove,
                              color: Colors.pink,
                            ),
                          ),
                          Text(
                            quantity.toString(),
                            style: GoogleFonts.notoSans(
                              fontSize: 14,
                              color: Colors.pink,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          IconButton(
                            iconSize: 17,
                            onPressed: () {
                              adjustQuantity('PLUS');
                            },
                            icon: const Icon(
                              Icons.add,
                              color: Colors.pink,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'Add to cart',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.notoSans(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              'FEATURED',
              style: GoogleFonts.notoSans(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(
            height: 225,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildListItem('1'),
                _buildListItem('2'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildListItem(String columnNumber) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          if (columnNumber == '1')
            _buildcolumnItem(
              'assets/christmas-sweater.png',
              'Sweater',
              '39',
              Colors.red.shade300,
            ),
          if (columnNumber == '1')
            const SizedBox(
              height: 15,
            ),
          if (columnNumber == '1')
            _buildcolumnItem(
              'assets/santa-hat.png',
              'Santa Hat',
              '10',
              Colors.red.shade300,
            ),
          if (columnNumber == '2')
            _buildcolumnItem(
              'assets/wreath.png',
              'Wreath',
              '15',
              Colors.red.shade300,
            ),
          if (columnNumber == '2')
            const SizedBox(
              height: 15,
            ),
          if (columnNumber == '2')
            _buildcolumnItem(
              'assets/elf.png',
              'Elf',
              '5',
              Colors.red.shade300,
            ),
        ],
      ),
    );
  }

  _buildcolumnItem(
      String imgPath, String shopName, String price, Color bgColor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 210,
          child: Row(children: [
            Container(
              height: 75,
              width: 75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: bgColor,
              ),
              child: Center(
                child: Image.asset(
                  imgPath,
                  height: 50,
                  width: 50,
                ),
              ),
            ),
            const SizedBox(width: 20.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(shopName,
                    style: GoogleFonts.notoSans(
                        fontSize: 14.0, fontWeight: FontWeight.w400)),
                Text(
                  '£' + price,
                  style: GoogleFonts.lato(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    textStyle: const TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ]),
        ),
      ],
    );
  }

  adjustQuantity(pressed) {
    switch (pressed) {
      case 'PLUS':
        setState(() {
          quantity += 1;
        });
        return;
      case 'MINUS':
        setState(() {
          if (quantity != 0) {
            quantity -= 1;
          }
        });
        return;
    }
  }
}
