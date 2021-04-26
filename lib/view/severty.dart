import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zealth_symptomapp/components/rounded_button.dart';
import 'package:zealth_symptomapp/controller/apicontroller.dart';
import 'package:zealth_symptomapp/models/symptommodel.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SevertyPage extends StatefulWidget {
  List<String> sympList;
  SevertyPage({this.sympList});
  @override
  _SevertyPageState createState() => _SevertyPageState(sympList: sympList);
}

enum Severtylevel { mild, moderate, severe }

class _SevertyPageState extends State<SevertyPage> {
  Symptom symptom;
  SymptomModel symptomModel = new SymptomModel();
  int index = 1;
  List<String> sympList;
  _SevertyPageState({this.sympList});

  //  List<Map<String, num>> listOfSypmMapSeverty = [
  //   sympList[0]:_character1,
  //    "Fatigue":
  // ];

  Map<String, num> mapOfSever = {};

  @override
  void initState() {
    // TODO: implement initState
    print("=====>>>>>>>>>>>");
    print(sympList);
  }

  Severtylevel _character1 = Severtylevel.moderate;
  Severtylevel _character2 = Severtylevel.moderate;

  int _currentNav = 0;

  List bottomNavBars = <BottomNavigationBarItem>[
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
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentNav,
          type: BottomNavigationBarType.fixed,
          items: bottomNavBars,
          onTap: (index) {
            setState(() {
              _currentNav = index;
            });
          },
        ),
        body: SingleChildScrollView(
             
          child: Column(
            children: [
              customAppbar(),
              SizedBox(
                height: 38,
              ),
              moreAboutHeading(),
              if (index == 1) severtyCard(_character1),
              if (index == 2) severtyCard(_character2),
              medicationCommentsCard(),
         
            ],
          ),
        ),
        floatingActionButton: bottomButtonsRow(),
        resizeToAvoidBottomInset: true,
        );
  }

  Widget moreAboutHeading() {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 21.0),
        child: Text(
          "More about ${sympList[index - 1]}",
          style: Get.textTheme.headline3.copyWith(
              color: Color(0xFF0E1D2C),
              fontWeight: FontWeight.w600,
              fontSize: 18),
        ),
      ),
    );
  }

  Widget customAppbar() {
    return Padding(
      padding: EdgeInsets.only(top: 50, left: 12, right: 10),
      child: Row(
        children: [
          IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Color(0xFF08233D),
                size: 30,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
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
    );
  }

  Widget bottomButtonsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: 15,
        ),
        RoundedButton(
            widdd: Row(
              children: [
                Icon(Icons.arrow_back, color: Colors.white),
                SizedBox(
                  width: 6,
                ),
                Text(
                  "Previous",
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
            color: Color(0xFFA5B2BE),
            onPressed: () {
              if (index == 1) {
                // print(index);

                Navigator.pop(context);
              }
              if (index == sympList.length && index > 1) {
                setState(() {
                  index = index - 1;
                  print(index);
                });
              }
            }),
        RoundedButton(
            widdd: Row(
              children: [
                Text(
                  index == sympList.length ? "Update" : "Next",
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
            color: Color(0xFF51C185),
            onPressed: () async {
              if (index == sympList.length) {
                //print(index);
                Get.snackbar("Fd", "updated");
                print(mapOfSever['vomiting']);
                print(mapOfSever['fatigue']);
                // symptom = new Symptom();
                List<Map<String, num>> liOfSymp = [];
                mapOfSever.forEach((key, value) => liOfSymp.add({key: value}));

                List<Symptom> liOfSympOb = [];
                dynamic l;
                for (l in liOfSymp) {
                  liOfSympOb.add(Symptom.fromJson(l));
                }
                print(liOfSympOb);

                SymptomModel s =
                    new SymptomModel(userId: 123, symptoms: liOfSymp);
                s.toJson();
                print(s.toJson());
                // var code = await apiCall(s);
                // print(code);

                // Fluttertoast.showToast(msg: "updated with $code status");

                 Fluttertoast.showToast(msg: "Working on Emulator only(for localhost)");
                //Navigator.pop(context);
                // fun(s);
              }

              if (index < sympList.length) {
                setState(() {
                  index = index + 1;
                  print(index);
                });
              }
            }),
      ],
    );
  }

  void fun(SymptomModel s) {
    apiCall(s);
  }

  Widget medicationCommentsCard() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          height: 140,
          width: 420,
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding:
                      EdgeInsets.only(left: 15, right: 15, bottom: 21, top: 19),
                  child: Text(
                    'Any medication / Comments',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF0E1D2C)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                  right: 15,
                  bottom: 21,
                ),
                child: Container(
                    child: TextField(
                        
                  autocorrect: true,
                  decoration: InputDecoration(
                    hintText: 'Comment',
                   
                  
                    hintStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.white70,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      borderSide:
                          BorderSide(color: Color(0xFFE9EDF0), width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Color(0xFFFF902A)),
                    ),
                  ),
                )),
              ),
            ],
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0), color: Colors.white),
        ),
      ),
    );
  }

  Widget severtyCard(Severtylevel _character) {
    mapOfSever[sympList[index - 1].toLowerCase()] = _character.index;
    return Padding(
      padding: EdgeInsets.all(16),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          height: 200,
          width: 420,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0), color: Colors.white),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RadioListTile<Severtylevel>(
                title: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 19.0),
                      child: Container(
                        height: 21,
                        width: 21,
                        child: Image.asset("assets/Group 9280 (1).png"),
                      ),
                    ),
                    const Text(
                      'Able to do most activities',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF3E5061)),
                    ),
                  ],
                ),
                value: Severtylevel.mild,
                groupValue: _character,
                activeColor: Color(0xFFFF902A),
                onChanged: (Severtylevel value) {
                  setState(() {
                    if (index == 1) {
                      _character1 = value;
                      mapOfSever[sympList[index - 1].toLowerCase()] =
                          _character1.index + 1;
                    }
                    if (index == 2) {
                      _character2 = value;
                      mapOfSever[sympList[index - 1].toLowerCase()] =
                          _character2.index + 1;
                    }
                    print(mapOfSever[sympList[index - 1].toLowerCase()]);
                  });
                },
              ),
              RadioListTile<Severtylevel>(
                title: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 19.0),
                      child: Container(
                        height: 21,
                        width: 21,
                        child: Image.asset("assets/Group 9286.png"),
                      ),
                    ),
                    const Text(
                      'In bed less than 50% of the day',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF3E5061)),
                    ),
                  ],
                ),
                value: Severtylevel.moderate,
                groupValue: _character,
                activeColor: Color(0xFFFF902A),
                onChanged: (Severtylevel value) {
                  setState(() {
                    if (index == 1) {
                      _character1 = value;
                      mapOfSever[sympList[index - 1].toLowerCase()] =
                          _character1.index + 1;
                    }
                    if (index == 2) {
                      _character2 = value;
                      mapOfSever[sympList[index - 1].toLowerCase()] =
                          _character2.index + 1;
                    }
                    //_character = value;

                    print(mapOfSever[sympList[index - 1].toLowerCase()]);
                  });
                },
              ),
              RadioListTile<Severtylevel>(
                title: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 19.0),
                      child: Container(
                        height: 21,
                        width: 21,
                        child: Image.asset("assets/Group 9287.png"),
                      ),
                    ),
                    const Text(
                      'In bed more than 50% of the day',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF3E5061)),
                    ),
                  ],
                ),
                value: Severtylevel.severe,
                groupValue: _character,
                activeColor: Color(0xFFFF902A),
                onChanged: (Severtylevel value) {
                  setState(() {
                    if (index == 1) {
                      _character1 = value;
                      mapOfSever[sympList[index - 1].toLowerCase()] =
                          _character1.index + 1;
                    }
                    if (index == 2) {
                      _character2 = value;
                      mapOfSever[sympList[index - 1].toLowerCase()] =
                          _character2.index + 1;
                    }

                    print(mapOfSever[sympList[index - 1].toLowerCase()]);
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//  ElevatedButton(

//             style: ElevatedButton.styleFrom(
//               primary: Colors.purple,
//               padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
//               textStyle: TextStyle(
//                   fontSize: 30,
//                   fontWeight: FontWeight.bold)),
//                 onPressed: null,
//                 child: Row(
//                   children: [
//                     Icon(
//                       Icons.arrow_back,
//                       color: Colors.white,
//                     ),
//                     Text("Previous")
//                   ],
//                 ),
//               )
