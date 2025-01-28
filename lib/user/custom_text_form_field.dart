import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String text;
  final TextInputType type;
  final TextEditingController controller ;
  const CustomTextFormField({super.key,required this.text,required this.type,required this.controller,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        validator: (value){
          if(value!.isEmpty){
            return '$text must not be empty';
          }
          return null;
        },
        controller: controller,
        keyboardType:type,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
             borderSide: BorderSide(
               color: Colors.indigo,
               width: 1.5,
             )
          ),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: Colors.red,
                width: 2,
              )
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: Colors.indigo,
                width: 1.5,
              )
          ),
          label: Text(text ,style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400
          ),),
        ),
      ),
    );
  }
}
