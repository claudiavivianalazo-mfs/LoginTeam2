import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/country.dart';

class DropdownButtonImgTxt extends StatefulWidget {
  @override
  _DropdownButtonImgTxtState createState() => _DropdownButtonImgTxtState();
}

class _DropdownButtonImgTxtState extends State<DropdownButtonImgTxt> {
  Country _selectedCountry =
      Country(name: "Colombia", id: "2", image: "assets/images/co.png");
  List<Country> countryList = [];

  void _loadCountry() async {
    try {
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      await _prefs.setString('country', 'Honduras');
      var _country = _prefs.getString("country") ?? "";
      if (_country != "") {
        Country _selectedCountry =
            countryList.firstWhere((country) => country.name == country);
      } else {
        print(_prefs.getString('country'));
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    fetchCountries();
  }

  @override
  Widget build(BuildContext context) {
    var items3 = countryList.map((item) {
      return DropdownMenuItem<Country>(
        child: Row(
          children: [
            Image.asset(
              item.image,
              //height: 20,
              width: 30,
            ),
            Container(
              margin: EdgeInsets.only(left: 20),
              decoration: const BoxDecoration(
                  //color: Colors.yellow,
                  ),
              child: Text(
                item.name,
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        value: item,
      );
    }).toList();

    if (items3.isEmpty) {
      items3 = [
        DropdownMenuItem<Country>(
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 10),
                child: Image.asset(
                  _selectedCountry.image,
                  width: 25,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                    //color: Colors.yellow,
                    ),
                child: Text(_selectedCountry.name),
              ),
            ],
          ),
          value: _selectedCountry,
        ),
      ];
    }

    return Container(
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          child: DropdownButton<Country>(
            hint: const Text('Seleccione un pais'),
            items: items3,
            value: _selectedCountry,
            onChanged: (newVal) => setState(() => _selectedCountry = newVal!),
          ),
        ),
      ),
    );
  }

  void fetchCountries() async {
    var resp = await http.get(Uri.parse(
        'https://run.mocky.io/v3/72a8fa80-5e0a-44f3-ae14-69bfd0ea2588'));
    if (resp.statusCode == 200) {
      setState(() {
        countryList = parseCountries(resp.body);
        _selectedCountry = countryList[1];
      });
    } else {
      debugPrint("Service error. Fetching items from local storage");
    }
  }

  List<Country> parseCountries(String responseBody) {
    final parsedJson = json.decode(responseBody);
    final parsed = parsedJson.cast<Map<String, dynamic>>();
    return parsed.map<Country>((json) => Country.fromJson(json)).toList();
  }
}
