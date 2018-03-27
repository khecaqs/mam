// Copyright (c) 2018, Brian Armstrong. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

var httpClient = createHttpClient();



var url = "http://mam.epizy.com/todo/api.php/User/";

enum ResultStatus {
  success,
  failure,
  loading,
}

class auth {
  
  ResultStatus _status;
  String _userId;
  String _name;
  String _password;
  String _key;
  String _email;
 


  @override
  void initState() {
    _status = null;
  
  }
  var setState;

  Future onSubmit(String userId, String pass) async {
    setState(() {
      _status = ResultStatus.loading;
    }); 

    try {
      final response = await httpClient.get(url+'/$userId');
      if (response.statusCode != 200) {
         setState(() {
          _status = ResultStatus.failure;
        }); 
      } else {
        final Map data = JSON.decode(response.body);
        setState(() {
          _status = ResultStatus.success;
          _userId = data['user'] ?? '<Name Not Found>';
          _name = data['name'] ?? '<Name Not Found>';
          _password = data['password'] ?? '<Name Not Found>';
          _key = data['key'] ?? '<Name Not Found>';
          _email = data['email'] ?? '<Name Not Found>';
          

           if (_name?.isNotEmpty == true) {
            print('Userid: $_userId');
            print('Name: $_name');
            print('password: $_password');
            print('Key: $_key');
            print('email: $_email');
          }

        });
      }
    } catch (e) {
      setState(() {
        _status = ResultStatus.failure;
      });
    };
  }


 
      

  
}
