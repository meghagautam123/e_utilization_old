import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShrinkText extends StatefulWidget
{
  @override
  _ShrinkTextState createState() => _ShrinkTextState();




}
class _ShrinkTextState extends State<ShrinkText>
{

  final _formKey = GlobalKey<FormState>();
  TextEditingController _textController = TextEditingController();
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _textController.addListener(_clearError);
  }

  void _clearError() {
    if (_errorMessage != null) {
      setState(() {
        _errorMessage = null;
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Form is valid, you can perform your action here
      // For example, you can submit data to a server
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form with TextFormField and Error Message'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: 60.0, // Set the maximum height of the TextFormField
                  minHeight: 40.0, // Set the minimum height of the TextFormField
                ),
                child: TextFormField(
                  controller: _textController,
                  decoration: InputDecoration(
                    labelText: 'Enter Text',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Field cannot be empty';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 16.0),
              if (_errorMessage != null)
                Text(
                  _errorMessage!,
                  style: TextStyle(color: Colors.red),
                ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (_formKey.currentState!.validate()) {
                      _errorMessage = null;
                    } else {
                      _errorMessage = 'Please fix the errors above';
                    }
                  });
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



