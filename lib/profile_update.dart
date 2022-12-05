import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_database/employee_profile.dart';
import 'package:firestore_database/model/employee.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileUpdate extends StatefulWidget {
  const ProfileUpdate({Key? key, required this.employee,  required this.docID}) : super(key: key);
  final Employee employee;
  final String docID;

  @override
  _ProfileUpdateState createState() => _ProfileUpdateState();
}

class _ProfileUpdateState extends State<ProfileUpdate> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController cityController;
  late TextEditingController dobController;

  @override
  void initState() {
    super.initState();

    nameController =
        TextEditingController(text: '${widget.employee.employee_name}');
    emailController = TextEditingController(text: '${widget.employee.employee_emailid}');
    cityController = TextEditingController(text: '${widget.employee.employee_city}');
    dobController = TextEditingController(text: '${widget.employee.employee_dob}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                SafeArea(
                    child: Center(
                        child: Text(
                  'Update Profile',
                  style: TextStyle(fontSize: 18, color: Colors.blue),
                ))),
                SizedBox(height: 10),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter Username',
                      hintText: 'Enter Username'),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter Email address',
                      hintText: 'Enter Email address'),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: cityController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter City',
                      hintText: 'Enter City'),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: dobController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter Date of Birth',
                      hintText: 'Enter Date of Birth'),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                    onPressed: () {
                      updateProfile();
                    },
                    child: Text(
                      'Update',
                      style: TextStyle(fontSize: 15),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  updateProfile() {

    FirebaseFirestore.instance.collection('emplyoee').doc(widget.docID).update(
        {'employee_name': nameController.text.toString(),
          'employee_dob': dobController.text.toString(),
          'employee_city': cityController .text.toString(),
          'employee_emailid': emailController.text.toString()});

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => EmployeeProfile()));
  }
}
