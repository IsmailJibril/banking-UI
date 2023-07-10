import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../gata_json/balancd_json.dart';
import 'card_page.dart';

class DashboardPage extends StatefulWidget {
  DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar:
          PreferredSize(child: getAppBar(), preferredSize: Size.fromHeight(60)),
      body: getBady(),
    );
  }

  Widget getAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.blueAccent,
      leading: IconButton(
        onPressed: () {},
        icon: const CircleAvatar(
          
          //? backgroundImage: NetworkImage(
          //   "https://www.vhv.rs/dpng/d/426-4263064_circle-avatar-png-picture-circle-avatar-image-png.png",
          // ),
          backgroundImage: AssetImage('assets/jibrel.jpeg'),
        ),
        
      ),
      actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
    );
  }

  Widget getBady() {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          width: size.width,
          height: size.height * 0.25,
          decoration: BoxDecoration(color: Colors.blueAccent),
          child: Column(
            children: [
              Container(
                width: size.width,
                height: 110,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(balanceLists.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Container(
                          width: size.width * 0.7,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    balanceLists[index]['currency'],
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: index == 0
                                            ? Colors.white
                                            : Colors.white.withOpacity(0.5)),
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    balanceLists[index]['amount'],
                                    style: TextStyle(
                                        fontSize: 35,
                                        fontWeight: FontWeight.bold,
                                        color: index == 0
                                            ? Colors.white
                                            : Colors.white.withOpacity(0.5)),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Text(
                                balanceLists[index]['description'],
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white.withOpacity(0.5)),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
              Expanded(
                  child: Container(
                width: size.width,
                child: Row(
                  children: [
                    SizedBox(width: 15),
                    Flexible(
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color:
                                CupertinoColors.secondaryLabel.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                          child: Text(
                            'Add mony',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Flexible(
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color:
                                CupertinoColors.secondaryLabel.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                          child: Text(
                            'Exchanged',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15)
                  ],
                ),
              ))
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Container(
              width: size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25))),
              child: Padding(
                  padding: const EdgeInsets.only(
                      top: 25, bottom: 40, left: 20, right: 20),
                  child: getAccountSection()),
            ),
          ),
        )
      ],
    );
  }

  Widget getAccountSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Account',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 10,
                    blurRadius: 10)
              ]),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              color: CupertinoColors.secondaryLabel
                                  .withOpacity(0.3),
                              borderRadius: BorderRadius.circular(12)),
                          child: Center(
                            child: Icon(
                              Icons.wallet,
                              color: Colors.blueAccent,
                              size: 20,
                            ),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Text(
                          "40832-810-5-7000-012345",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        )
                      ],
                    ),
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.blueAccent,
                    )
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Divider(
                    thickness: 0.2,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color:
                              CupertinoColors.secondaryLabel.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(12)),
                      child: Center(
                        child: Icon(
                          Icons.euro,
                          color: Colors.blueAccent,
                          size: 20,
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Text(
                      "18 199.24 EUR",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Divider(
                    thickness: 0.2,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color:
                              CupertinoColors.secondaryLabel.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(12)),
                      child: Center(
                        child: Icon(
                          Icons.currency_pound,
                          color: Colors.blueAccent,
                          size: 20,
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Text(
                      "36.67 GBP",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Cards',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              width: 90,
              height: 22,
              decoration: BoxDecoration(
                  color: CupertinoColors.secondaryLabel.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add,
                    size: 16,
                    color: Colors.blueAccent,
                  ),
                  Text(
                    'ADD CARD',
                    style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent),
                  )
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => CardPage()));
          },
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 10,
                    blurRadius: 10,
                  ),
                ]),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                color: CupertinoColors.secondaryLabel
                                    .withOpacity(0.3),
                                borderRadius: BorderRadius.circular(12)),
                            child: Center(
                              child: Icon(
                                Icons.credit_card,
                                color: Colors.blueAccent,
                                size: 20,
                              ),
                            ),
                          ),
                          const SizedBox(width: 15),
                          Text(
                            "EUR *2330",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "8 199.24 EUR",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
