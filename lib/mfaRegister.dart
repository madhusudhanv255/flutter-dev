import 'dart:convert';

import 'package:adv_basics/custom_widget/app_titlebar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:adv_basics/custom_widget/app_buttons.dart';
import 'package:adaptive_theme/adaptive_theme.dart';

class MFA extends StatefulWidget {
  const MFA({super.key});
  @override
  State<MFA> createState() {
    return _MfaState();
  }
}

class _MfaState extends State<MFA> {
  // Fetch content from the json file
  readJson() async {
    final String response =
        await rootBundle.loadString('assets/data/countries.json');
    final data = await jsonDecode(response);
    return data['countries'];
  }

  final _formKey = GlobalKey<FormState>();
  final String _phoneNumber = '';
  final int _selectedFruit = 0;
  var _selectedCountry = 'Select Country';
  @override
  void initState() {
    super.initState();
    // Call the readJson method when the app starts
    readJson();
  }

  @override
  Widget build(context) {
    void _submitAuthy() async {}
    onSelectedItemChanged() {
      return '';
    }

    _showDialog() async {
      _selectedCountry = await showCupertinoModalPopup(
        context: context,
        builder: (BuildContext context) => SizedBox(
          width: double.infinity,
          height: 300,
          child: FutureBuilder(
            future: readJson(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                if (!snapshot.hasData) {
                  return const Text('No Data Found');
                }

                return CupertinoPicker(
                  backgroundColor: Colors.white,
                  onSelectedItemChanged: (value) {
                    setState(() {
                      print(value);
                    });
                  },
                  itemExtent: 32.0,
                  children: snapshot.data
                      .map<Widget>(
                        (item) => Text(item['label']),
                      )
                      .toList(),
                  // cancelButton: CupertinoActionSheetAction(
                  //   isDefaultAction: true,
                  //   onPressed: () {
                  //     Navigator.pop(context, 'Cancel');
                  //   },
                  //   child: const Text('Cancel'),
                  // ),
                );
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ),
      );
      setState(() {
        _selectedCountry = _selectedCountry;
      });
    }

    return CupertinoPageScaffold(
      navigationBar: appTitleBar(
          context,
          const Icon(
            Icons.arrow_back_ios,
            size: 22.0,
          //  color: CupertinoColors.white,
          ),
         
         ///Icon(IconData(0xF394, fontFamily: CupertinoIcons.iconFont, fontPackage: CupertinoIcons.iconFontPackage)
          'Two Factor Authentication'),

      // CupertinoNavigationBar(
      //   leading: GestureDetector(
      //     child: const Icon(
      //       Icons.arrow_back_ios,
      //       size: 22.0,
      //       color: CupertinoColors.white,
      //     ),
      //     onTap: () {
      //       Navigator.pushReplacement(
      //         context,
      //         MaterialPageRoute(builder: (context) => const Login()),
      //       );
      //     },
      //   ),
      //   middle: const Text('Two factor authentication'),
      // ),
      child: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              CupertinoFormSection(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 20, right: 0),
                          child: Icon(Icons.location_on),
                        ),
                        CupertinoButton(
                          onPressed: () => _showDialog(),
                          child: Text(
                            _selectedCountry,
                            textAlign: TextAlign.left,
                            //  style: TextStyle(),
                          ),
                        ),
                      ],
                    ),
                    CupertinoTextFormFieldRow(
                      prefix: const Icon(Icons.phone_iphone_sharp),
                      placeholder: 'Phone Number',
                      onSaved: (value) {
                        //_password = value;
                      },
                      validator: (String? value) {
                        return (value == null || value.isEmpty
                            ? 'Enter Password'
                            : null);
                      },
                    )
                  ]),
              const SizedBox(
                height: 20,
              ),
              Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: AppButtons(
                    textColor: Colors.white,
                    backgroundColor: Colors.blue,
                    borderColor: Colors.blue,
                    text: 'Submit',
                    size: 50.0,
                    onPressed: () {},
                    onTap: () {},
                  )

                  // CupertinoButton.filled(onPressed: () {}, child: const Text('Submit')),
                  ),
              Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: AppButtons(
                    textColor: Colors.white,
                    backgroundColor: Colors.blue,
                    borderColor: Colors.blue,
                    text: 'Change Dark Theme',
                    size: 50.0,
                    onPressed: () {
                      CupertinoAdaptiveTheme.of(context).setDark();
                    },
                    onTap: () {},
                  )

                  // CupertinoButton.filled(onPressed: () {}, child: const Text('Submit')),
                  ),
              Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: AppButtons(
                    textColor: Colors.white,
                    backgroundColor: CupertinoColors.systemFill,
                    borderColor: Colors.blue,
                    text: 'Change Light Theme',
                    size: 50.0,
                    onPressed: () {
                      CupertinoAdaptiveTheme.of(context).setLight();
                    },
                    onTap: () {},
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
