import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:user_info_with_firestore/user/custom_text_form_field.dart';
import 'package:user_info_with_firestore/user/user_details.dart';

class UserData extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController hobbyController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  UserData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'User Data',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: Form(
        key: formKey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextFormField(
                text: 'Name',
                type: TextInputType.name,
                controller: nameController,
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                text: 'Age',
                type: TextInputType.number,
                controller: ageController,
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                text: 'Favourite Hobby',
                type: TextInputType.text,
                controller: hobbyController,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                    onPressed: () {
                      if(formKey.currentState!.validate()){
                        final db = FirebaseFirestore.instance;
                        var data = {
                          'name': nameController.text,
                          'age': ageController.text,
                          'fav-hobby': hobbyController.text,
                        };
                        db.collection('users').add(data).then((documentSnapshot) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content:
                              Text('User Added with ID ${documentSnapshot.id}')));
                        });
                        clear();
                      }
                    },
                    color: Colors.indigo,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child:const Text(
                      'Add User',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                  FilledButton(onPressed:(){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>UserDetails()));
                  }, child: Text('show Users',style: TextStyle(color: Colors.white, fontSize: 15)))
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }

  void clear() {
    nameController.clear();
    ageController.clear();
    hobbyController.clear();
  }
}
