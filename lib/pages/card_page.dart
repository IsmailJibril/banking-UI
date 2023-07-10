import 'package:banking/gata_json/card_json.dart';
import 'package:banking/gata_json/operation_json.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardPage extends StatefulWidget {
  CardPage({Key? key}) : super(key: key);

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:
          PreferredSize(child: getAppBar(), preferredSize: Size.fromHeight(60)),
      body: getBody(),
    );
  }

  Widget getAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 22,
          )),
      title: Text(
        'Card',
        style: TextStyle(fontSize: 18, color: Colors.black),
      ),
      centerTitle: true,
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_vert,
              color: Colors.black,
              size: 25,
            ))
      ],
    );
  }

  Widget getBody() {
    final PageController controller = PageController();
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            height: 240,
            child: PageView(
              controller: controller,
              children: List.generate(cardLists.length, (index) {
                return getCards(
                  cardLists[index]['amount'],
                  cardLists[index]['currency'],
                  cardLists[index]['card_number'],
                  cardLists[index]['valid_date'],
                  cardLists[index]['bg_color'],
                );
              }),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 10,
                      blurRadius: 10)
                ]),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Container(
                          width: size.width / 2,
                          height: 55,
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Colors.blueAccent, width: 3.5))),
                          child: Center(
                            child: Text(
                              'Oprerations',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.blueAccent,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Container(
                          width: size.width / 2,
                          height: 55,
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                            color: Colors.black.withOpacity(0.05),
                            width: 1,
                          ))),
                          child: Center(
                            child: Text(
                              'History',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.blueAccent.withOpacity(0.5),
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  children: List.generate(Cardoperations.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 20),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  spreadRadius: 10,
                                  blurRadius: 10),
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Row(
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: CupertinoColors.secondaryLabel
                                        .withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(12)),
                                child: Center(
                                  child: Icon(
                                    Cardoperations[index]['icon'],
                                    size: 20,
                                    color: Colors.blueAccent,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                Cardoperations[index]['title'],
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ),
                SizedBox(height: 30,)
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget getCards(amount, currency, cardNumber, validDate, bgColor) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              currency,
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const SizedBox(width: 4),
            Text(
              amount,
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          width: size.width * 0.85,
          height: 160,
          decoration: BoxDecoration(
              color: bgColor, borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.credit_card,
                      size: 30,
                      color: Colors.white.withOpacity(0.3),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      cardNumber,
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 20,
                          wordSpacing: 15),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "VALID DATE",
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.3),
                              fontSize: 12),
                        ),
                        Text(
                          validDate,
                          style: TextStyle(color: Colors.white, fontSize: 13),
                        )
                      ],
                    ),
                    Image.asset(
                      'assets/Mastercard_Logo.wine.png',
                      width: 50,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
