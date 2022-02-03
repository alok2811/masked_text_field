import 'package:flutter/material.dart';
import 'package:masked_text_field/masked_text_field.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(title: 'Masked Text Field'),
    );
  }
}

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var ipController = TextEditingController();
  var dateController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Enter IP Address'),
            const SizedBox(height: 5,),
            MaskedTextField(
              textFieldController: ipController,
              inputDecoration: const InputDecoration(
                hintText: '192.192.192.192',
                  counterText: ""
              ),
              autofocus: true,
              mask: 'xxx.xxx.xxx.xxx',
              maxLength: 15,
              keyboardType: TextInputType.number,
              onChange: (String value) {
                print(value);
              },
            ),
            const SizedBox(height: 10,),
            const Text('Enter Date'),
            const SizedBox(height: 5,),
            MaskedTextField(
              textFieldController: dateController,
              inputDecoration: const InputDecoration(
                  hintText: 'DD/MM/YYYY',
                  counterText: ""
              ),
              autofocus: true,
              mask: 'xx/xx/xxxx',
              maxLength: 10,
              keyboardType: TextInputType.number,
              onChange: (String value) {
                print(value);
              },
            ),
            const SizedBox(height: 10,),
            const Text('Enter Phone Number'),
            const SizedBox(height: 5,),
            MaskedTextField(
              textFieldController: phoneController,
              inputDecoration: const InputDecoration(
                  hintText: '98765-43210',
                  counterText: "",
                prefixText: '+91 ',
              ),
              autofocus: true,
              mask: 'xxxxx-xxxxx',
              maxLength: 11,
              keyboardType: TextInputType.number,
              onChange: (String value) {
                print(value);
              },
            ),
          ],
        ),
      ),
    );
  }
}


