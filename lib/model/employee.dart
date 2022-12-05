import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class Employee  {
  final String employee_name;
  final String employee_emailid;
  final String employee_city;
  final String employee_dob;

  Employee({
    required this.employee_name,
    required this.employee_emailid,
    required this.employee_city,
    required this.employee_dob,


  });


}
