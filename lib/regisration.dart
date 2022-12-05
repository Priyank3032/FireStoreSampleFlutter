import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_database/employee_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController dobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(child: Text('Registration',style: TextStyle(fontSize: 20,color: Colors.blue),)),
                ),

                SizedBox(height: 10),

                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter Username',
                      hintText: 'Enter User name'),

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
                SizedBox(height: 15),
                ElevatedButton(onPressed: (){
                  uploadingData(nameController.text.toString(),
                      emailController.text.toString(),
                      cityController.text.toString(),
                      dobController.text.toString());



                }, child:

                Text('Register',style: TextStyle(fontSize: 15),))

              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> uploadingData(String _employee_name, String _employee_emailid,
      String _employee_city, String _employee_dob) async {

    await FirebaseFirestore.instance.collection("emplyoee").add({
      'employee_name': _employee_name,
      'employee_emailid': _employee_emailid,
      'employee_city': _employee_city,
      'employee_dob': _employee_dob,
    });

    Navigator.push(context,MaterialPageRoute(builder: (context) =>  EmployeeProfile()));
  }

}
