import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zealth_symptomapp/view/severty.dart';


bool boolVar = true;

class SymptomsPage extends StatefulWidget {
  @override
  _SymptomsPageState createState() => _SymptomsPageState();
}

class _SymptomsPageState extends State<SymptomsPage> {
  bool checkStatus = false;
  List listOfIcon = <Widget>[
    Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: SizedBox(
          width: 20, height: 20, child: Image.asset("assets/Fill (1).png")
          // .alignCenter
          // .ripple(() {}, borderRadius: BorderRadius.circular(13)
          // )
          ),
    ),
    Text("Search symptoms")
  ];

  String prewid = "dummywid";
  final _formKey = GlobalKey<FormState>();
  int _currentNav = 0;
  bool _isChecked1 = false;
  bool _isChecked2 = false;
  fun() {}

  Map<String, bool> values = {
    'Fatigue ': false,
    'Vomiting': false,
  };

  List<String> tmpArray = [];

  getCheckboxItems() {
    values.forEach((key, value) {
      if (value == true) {
        tmpArray.add(key);
      }
    });

    // Printing all selected items on Terminal screen.
    print(tmpArray);
    // Here you will get all your selected Checkbox items.

    // Clear array after use.
    tmpArray.clear();
  }

  Map<String, Widget> map = {
    'icon': Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: SizedBox(
          width: 20, height: 20, child: Image.asset("assets/Fill (1).png")
          // .alignCenter
          // .ripple(() {}, borderRadius: BorderRadius.circular(13)
          // )
          ),
    ),
    'hintext': Text("Search symptoms")
  };
  List listOfWid = <Widget>[];

  @override
  Widget build(BuildContext context) {
    listOfWid.clear();
    map.forEach((key, value) => listOfWid.add(value));

    boolVar = false;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentNav,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 7, top: 10),
              child: Container(
                height: 21,
                width: 30,
                child: Image.asset("assets/Home.png"),
              ),
            ),
            title: Text(
              "Home",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF3E5061)),
            ),
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 7, top: 10),
              child: Container(
                height: 21,
                width: 30,
                child: Image.asset("assets/thermometer 1.png"),
              ),
            ),
            title: Text(
              "Symptoms",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFFFF0270)),
            ),
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 7, top: 10),
              child: Container(
                height: 21,
                width: 30,
                child: Image.asset("assets/medical jar 1.png"),
              ),
            ),
            title: Text(
              "Medication  ",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF3E5061)),
            ),
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 7, top: 10),
              child: Container(
                height: 21,
                width: 30,
                child: Image.asset("assets/Activity.png"),
              ),
            ),
            title: Text(
              "Reports",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF3E5061)),
            ),
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentNav = index;
          });
        },
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 50, left: 21, right: 10),
              child: Row(
                children: [
                  Container(
                    height: 32,
                    width: 26.91,
                    child: Image.asset("assets/Shape.png"),
                  ),
                  SizedBox(
                    width: 123,
                  ),
                  Text(
                    "Symptoms",
                    style: Get.textTheme.headline4.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Color(0xFF08233D)),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 38,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 21.0),
                child: Text(
                  "Search & Add Your Symptoms",
                  style: Get.textTheme.headline5.copyWith(
                      color: Color(0xFF0E1D2C),
                      fontWeight: FontWeight.w500,
                      fontSize: 14),
                ),
              ),
            ),

            // Form(
            //     key: _formKey,
            //     child: Column(
            //       children: [
            //         TextFormField(
            //           decoration: InputDecoration(
            //               //prefix: Text('widgetold'),
            //               prefixIcon: Row(
            //                 children: listOfIcon

            //                 ,
            //               ),
            //               hintText: "prewid"),
            //         ),
            //         FlatButton(
            //             onPressed: () {
            //               if (_formKey.currentState.validate() != false) {
            //                 // If the form is valid, display a snackbar. In the real world,
            //                 // you'd often call a server or save the information in a database.

            //                 setState(() {
            //                   prewid = "nayaagaya";
            //                   listOfIcon.add(Row(children: [Icon(Icons.access_alarm),Text('t1')],));
            //                 });
            //               }
            //             },
            //             child: Text('form check'))
            //       ],
            //     )),

            ///TEXT FIELD STARTS FROM HERE

            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Container(
                height: 55,
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                width: 370,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(13)),
                  border: Border.all(
                    width: 1,
                    color: Color(0xffA5B2BE),
                  ),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Color(0xffA5B2BE),
                      blurRadius: 15,
                      offset: Offset(5, 5),
                    )
                  ],
                ),
                child: TextField(
                  onSubmitted: null,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    border: InputBorder.none,
                    hintText: "Search Symptoms",
                    // prefix: ,
                    // suffixText: "fdf",
                    // prefix: ListView(
                    //   children:  tempArr,
                    // ),

                    //prefixText: 'fdfd',

                    hasFloatingPlaceholder: true,

                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(13.0),
                      child: Row(
                        children: listOfWid,
                      ),
                    ),
                    // hintStyle: TextStyle.body.subTitleColor,
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: InkWell(
                        onTap: () {
                          if (checkStatus) {
                           print(tmpArray);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      SevertyPage(sympList: tmpArray)),
                            );
                          }
                        },
                        child: Container(
                          width: 64,
                          height: 22,
                          decoration: BoxDecoration(
                              color: checkStatus
                                  ? Color(0xFFFFE9E4)
                                  : Color(0xFFEAEFF4),
                              borderRadius: BorderRadius.circular(40)),
                          child: Center(
                            child: Text(
                              "Check",
                              style: TextStyle(
                                  color: checkStatus
                                      ? Color(0xFFFF0270)
                                      : Color(0xFFA5B2BE),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 11),
                            ),
                          ),
                          // child: Image.asset("assets/Fill (1).png    ",
                          // scale:0.5,)
                          // .alignCenter
                          // .ripple(() {}, borderRadius: BorderRadius.circular(13)
                          // )
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 21.0),
                child: Text(
                  "Suggested symptoms",
                  style: Get.textTheme.bodyText1.copyWith(
                      color: Color(0xFF3E5061), fontWeight: FontWeight.w500),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 26),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            //backgroundBlendMode: ,
                            color: Colors.white,
                            border: Border.all(color: Colors.white, width: 2),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        width: 76,
                        height: 104,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 34,
                              width: 33,
                              child: Image.asset("assets/headache (1) 2.png"),
                            ),
                            Text("Fatigue ")
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            //backgroundBlendMode: ,
                            color: Colors.transparent,
                            border: Border.all(color: Colors.white, width: 2),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        width: 76,
                        height: 104,
                        child: Checkbox(
                          materialTapTargetSize: MaterialTapTargetSize.padded,

                          value: _isChecked1,
                          tristate: boolVar,
                          checkColor: Colors.green,
                          fillColor:
                              MaterialStateProperty.resolveWith(getColor),

                          activeColor: Colors.green,
                          focusColor: Colors.pink,
                          // fillColor: ,
                          // focusNode: ,
                          // overlayColor: ,
                          // materialTapTargetSize: ,
                          // visualDensity: ,

                          onChanged: (bool isChecked) {
                            if (_formKey.currentState.validate() != false) {
                              setState(() {
                                _isChecked1 = isChecked;
                                if (_isChecked1 == true) {
                                  checkStatus = true;
                                  map.remove('icon');
                                  map.remove('hintext');
                                  tmpArray.add('Fatigue');
                                  map['Fatigue'] = Padding(
                                    padding: const EdgeInsets.only(left: 9.0),
                                    child: Container(
                                      height: 30,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: 30,
                                            width: 30,
                                            child: Image.asset(
                                                'assets/headache (1) 2.png'),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0, top: 4),
                                            child: Text(
                                              'Fatigue',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xFF3E5061)),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                  print(listOfWid);
                                }
                                if (_isChecked1 == false) {
                                  tmpArray.remove('Fatigue');
                                  map.remove('Fatigue');

                                  if (map.isEmpty) {
                                    checkStatus = false;

                                    map['icon'] = Padding(
                                      padding:
                                          const EdgeInsets.only(right: 16.0),
                                      child: SizedBox(
                                          width: 20,
                                          height: 20,
                                          child:
                                              Image.asset("assets/Fill (1).png")
                                          // .alignCenter
                                          // .ripple(() {}, borderRadius: BorderRadius.circular(13)
                                          // )
                                          ),
                                    );

                                    map['hintext'] = Text("Search symptoms");
                                  }
                                  print(listOfWid);
                                }

                                print(tmpArray);
                              });
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            //backgroundBlendMode: ,
                            color: Colors.white,
                            border: Border.all(color: Colors.white, width: 2),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        width: 76,
                        height: 104,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 34,
                              width: 33,
                              child: Image.asset(
                                  "assets/icons8-coughing-48 1.png"),
                            ),
                            Text("Vomiting ")
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            //backgroundBlendMode: ,
                            color: Colors.transparent,
                            border: Border.all(color: Colors.white, width: 2),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        width: 76,
                        height: 104,
                        child: Checkbox(
                          materialTapTargetSize: MaterialTapTargetSize.padded,

                          value: _isChecked2,
                          tristate: boolVar,
                          checkColor: Colors.green,
                          fillColor:
                              MaterialStateProperty.resolveWith(getColor),

                          activeColor: Colors.green,
                          focusColor: Colors.pink,
                          // fillColor: ,
                          // focusNode: ,
                          // overlayColor: ,
                          // materialTapTargetSize: ,
                          // visualDensity: ,

                          onChanged: (bool isChecked) {
                            if (_formKey.currentState.validate() != false) {
                              setState(() {
                                _isChecked2 = isChecked;

                                if (_isChecked2 == true) {
                                  checkStatus = true;
                                  map.remove('icon');
                                  map.remove('hintext');

                                  tmpArray.add('Vomiting');
                                  map['Vomiting'] = Padding(
                                    padding: const EdgeInsets.only(left: 9.0),
                                    child: Container(
                                      height: 30,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: 30,
                                            width: 30,
                                            child: Image.asset(
                                                'assets/icons8-coughing-48 1.png'),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0, top: 4),
                                            child: Text(
                                              'Vomiting',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xFF3E5061)),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                  print(listOfWid);

                                  //listOfWid.add(map['Vomiting']);
                                }
                                if (_isChecked2 == false) {
                                  tmpArray.remove('Vomiting');
                                  map.remove('Vomiting');
                                  print(listOfWid);

                                  if (map.isEmpty) {
                                    checkStatus = false;
                                    map['icon'] = Padding(
                                      padding:
                                          const EdgeInsets.only(right: 16.0),
                                      child: SizedBox(
                                          width: 20,
                                          height: 20,
                                          child:
                                              Image.asset("assets/Fill (1).png")
                                          // .alignCenter
                                          // .ripple(() {}, borderRadius: BorderRadius.circular(13)
                                          // )
                                          ),
                                    );

                                    map['hintext'] = Text("Search symptoms");
                                  }

                                  //listOfWid.add(map['Vomiting']);
                                }

                                print(tmpArray);
                              });
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.transparent;
  }
}
