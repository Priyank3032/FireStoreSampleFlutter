import 'package:firestore_database/model/employee.dart';
import 'package:firestore_database/profile_update.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EmployeeProfile extends StatefulWidget {
  EmployeeProfile({Key? key}) : super(key: key);

  @override
  _EmployeeProfileState createState() => _EmployeeProfileState();
}

class _EmployeeProfileState extends State<EmployeeProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
            ),
            Align(
                alignment: Alignment.center,
                child: Text(
                  'EmployeeList',
                  style: TextStyle(fontSize: 20, color: Colors.blue),
                )),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('emplyoee')
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError)
                      return new Text('Error: ${snapshot.error}');
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return new Text('Loading...');
                      default:
                        return ListView(
                          children: snapshot.data!.docs.map((doc) {
                            Employee employee = Employee(
                                employee_name: doc['employee_name'],
                                employee_emailid: doc['employee_emailid'],
                                employee_city: doc['employee_city'],
                                employee_dob: doc['employee_dob']);
                            return Padding(
                              padding: const EdgeInsets.only(
                                  left: 10.0, right: 10.0, bottom: 10.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0,
                                      right: 10.0,
                                      bottom: 5.0,
                                      top: 5.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                "Employee Name : ${doc['employee_name']}",
                                                style: TextStyle(fontSize: 15)),
                                            Text(
                                              "Email ID : ${doc['employee_emailid']}",
                                              style: TextStyle(fontSize: 15),
                                            ),
                                            Text(
                                                "City : ${doc['employee_city']}",
                                                style: TextStyle(fontSize: 15)),
                                            Text(
                                                "Date of birth : ${doc['employee_dob']}",
                                                style: TextStyle(fontSize: 15))
                                          ],
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                                FirebaseFirestore.instance
                                                    .collection("emplyoee")
                                                    .doc(doc.id)
                                                    .delete();
                                              },
                                              icon: Icon(
                                                Icons.delete,
                                                size: 28,
                                                color: Colors.blue,
                                              )),
                                          IconButton(
                                              onPressed: () {
                                                String docID = doc.id;
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            ProfileUpdate(
                                                                employee:
                                                                    employee,
                                                                docID:
                                                                    doc.id)));
                                              },
                                              icon: Icon(
                                                Icons.edit,
                                                size: 30,
                                                color: Colors.blue,
                                              )),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        );
                    }
                  }),
            )
          ],
        ),
      ),
    ));
  }
}
