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

  void _updateCountry() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    await _prefs.setString('country', _selectedCountry.name);
    debugPrint(_prefs.getString("country"));
  }

  void _loadCountry() async {
    try {
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      var _country = _prefs.getString("country") ?? "";
      if (_country != "") {
        Country found =
            countryList.singleWhere((element) => element.id == '1', orElse: () {
          return Country(
              name: 'Colombia', id: '2', image: 'assets/image/co.png');
        });
        _selectedCountry = found;
      } else {
        await _prefs.setString('country', 'Honduras');
      }
    } catch (e) {
      debugPrint(e.toString());
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
                style: const TextStyle(
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
              Image.asset(
                _selectedCountry.image,
                width: 25,
              ),
              Container(
                margin: EdgeInsets.only(left: 20),
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
          alignedDropdown: true,
          child: DropdownButton<Country>(
              hint: const Text('Seleccione un pais'),
              items: items3,
              value: _selectedCountry,
              onChanged: (newVal) {
                setState(() => {_selectedCountry = newVal!});
                _updateCountry();
              }),
        ),
      ),
    );
  }

  void fetchCountries() async {
    var resp = await http.get(Uri.parse(
        'https://run.mocky.io/v3/37b4cce0-dbdc-48eb-977b-8a67bd72827b'));
    if (resp.statusCode == 200) {
      setState(() {
        countryList = parseCountries(resp.body);
        debugPrint('${countryList.length} países cargados');
        _selectedCountry = countryList[1];
        _loadCountry();
      });
    } else {
      setState(() {
        _fillCountryList();
        _selectedCountry = countryList[1];
        _loadCountry();
      });
    }
  }

  List<Country> parseCountries(String responseBody) {
    final parsedJson = json.decode(responseBody);
    final parsed = parsedJson.cast<Map<String, dynamic>>();
    return parsed.map<Country>((json) => Country.fromJson(json)).toList();
  }

  void _fillCountryList() {
    countryList.addAll({
      Country(name: 'Bolivia', id: '1', image: 'assets/images/bo.png'),
      Country(name: 'Colombia', id: '2', image: 'assets/images/co.png'),
      Country(name: 'Guatemala', id: '3', image: 'assets/images/gt.png'),
      Country(name: 'Honduras', id: '4', image: 'assets/images/hn.png'),
      Country(name: 'Mexico', id: '5', image: 'assets/images/mx.png'),
      Country(name: 'Paraguay', id: '6', image: 'assets/images/py.png'),
    });
  }
}
