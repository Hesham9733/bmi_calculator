
import 'package:bmi_calculator/widgets/reusable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:ndialog/ndialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 1;
  double _value = 160.0;
  // ignore: prefer_final_fields
  int _weightValue = 60;
  // ignore: prefer_final_fields
  int _ageValue = 18;
  List calculateBMI() {
    // ignore: unused_local_variable
    String _resultText = '';
    // ignore: unused_local_variable
    String _resultDiscription = '';
    // ignore: unused_local_variable
    List<String> _resultFull;
    
    double height = _value / 100;
    double weight = _weightValue.toDouble();

    double heightSquare = height * height;
    double result = weight / heightSquare;
    // ignore: unused_local_variable
    String _result = result.toInt().toString();
    if (result < 18.5) {
      return _resultFull = [
        _resultText = 'Underweight',
        _resultDiscription = 'You Should Exercise and Eat',
      ];
    } else if (result > 18.5 && result < 24.9) {
      return _resultFull = [
        _resultText = 'Normal Weight',
        _resultDiscription = 'You Are Fit',
      ];
    } else if (result > 25 && result < 29.9) {
      return _resultFull = [
        _resultText = 'Overweight',
        _resultDiscription = 'You Need to Lose Weight',
      ];
    } else {
      return _resultFull = [
        _resultText = 'Obesity',
        _resultDiscription = 'You Need to Change your Lifestyle',
      ];
    }
  }

  showMeDialog() {
    return NDialog(
      dialogStyle: DialogStyle(titleDivider: true),
      title: const Text(
        'BMI Result',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.blue),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            calculateBMI().first,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 5,),
          Text(
            calculateBMI().last,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20),
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
            child: Text(
              "Ok".toUpperCase(),
              style: const TextStyle(color: Colors.red),
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
      ],
    ).show(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            _selectedIndex = 1;
                          });
                        },
                        child: GenderCard(
                          gender: 'Male',
                          iconGender: Icons.male,
                          iconColor: Colors.white,
                          cardColor: _selectedIndex == 1
                              ? Colors.blueGrey
                              : Colors.grey,
                          textColor: Colors.white,
                        ),
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _selectedIndex = 2;
                          });
                        },
                        child: GenderCard(
                          gender: 'Female',
                          iconGender: Icons.female,
                          iconColor: Colors.white,
                          cardColor: _selectedIndex == 2
                              ? Colors.blueGrey
                              : Colors.grey,
                          textColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 170,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      const Text(
                        'Height',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            _value.toInt().toString(),
                            style: const TextStyle(
                              fontSize: 30,
                              color: Colors.blue,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text(
                            'cm',
                          )
                        ],
                      ),
                      Slider(
                        min: 0.0,
                        max: 300.0,
                        value: _value,
                        activeColor: Colors.blue,
                        inactiveColor: Colors.white,
                        onChanged: (value) {
                          setState(() {
                            _value = value;
                          });
                        },
                      ),
                      const Text(
                        'Set Height Value',
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 185,
                        width: 190,
                        decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: [
                            const Text(
                              'Weight',
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text(
                                  _weightValue.toString(),
                                  style: const TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 45),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text(
                                  'kg',
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        _weightValue++;
                                      });
                                    },
                                    child: const CircleAvatar(
                                      child: Icon(Icons.add),
                                    ),
                                  ),
                                  const Spacer(),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        _weightValue--;
                                      });
                                    },
                                    child: const CircleAvatar(
                                      child: Icon(Icons.remove),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              'Set Weight Value',
                            ),
                          ],
                        ),
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      Container(
                        height: 185,
                        width: 190,
                        decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: [
                            const Text(
                              'Age',
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text(
                                  _ageValue.toString(),
                                  style: const TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 45),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text(
                                  'years',
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        _ageValue++;
                                      });
                                    },
                                    child: const CircleAvatar(
                                      child: Icon(Icons.add),
                                    ),
                                  ),
                                  const Spacer(),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        _ageValue--;
                                      });
                                    },
                                    child: const CircleAvatar(
                                      child: Icon(Icons.remove),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              'Set Age Value',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              calculateBMI();
              showMeDialog();
            },
            child: Container(
              width: double.infinity,
              height: 62,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25),
                    topLeft: Radius.circular(25)),
                color: Colors.blue,
              ),
              child: const Center(
                  child: Text(
                'Calculate',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
