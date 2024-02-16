import 'package:flutter/material.dart';

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  String? _inputValue;

  @override
  Widget build(BuildContext context) {
    initState();

    return
      Scaffold(
    body:
      Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Enter a value',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),

              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a value';
                }
                return null;
              },
              onSaved: (value) {
                _inputValue = value;
              },
            ),

            SizedBox(height: 10.0),

            ElevatedButton(
              onPressed: ()
              {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  // Process the input value here
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Input value: $_inputValue'),
                    ),
                  );
                }
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
      ) );
  }
}




