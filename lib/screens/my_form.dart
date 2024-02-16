import 'package:flutter/material.dart';

class MyFormWidget extends StatefulWidget {
  @override
  _MyFormWidgetState createState() => _MyFormWidgetState();
}

class _MyFormWidgetState extends State<MyFormWidget> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _textController = TextEditingController();
  String? _errorMessage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _textController.addListener(_clearError);
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
          child: Column(
            children: [

              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
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

              SizedBox(height: 16.0),

             /*if (_errorMessage != null)
                Text(
                  _errorMessage!,
                  style: TextStyle(color: Colors.blue),
                ),
        */
              //SizedBox(height: 16.0),

              ElevatedButton(
                onPressed: () {
                  setState(() {
                    // Validate the form when the button is pressed
                    if (_formKey.currentState!.validate()) {
                      // Form is valid
                      _errorMessage = null;
                    } else {
                      // Form is invalid, display an error message
                      _errorMessage = 'Please fix the errors above';
                    }
                  });
                  // You can also call _submitForm() here if needed
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _clearError()
  {
   if(_errorMessage!=null)
   {
   setState(() {
  _errorMessage=null;
    });

   }



  }
}
