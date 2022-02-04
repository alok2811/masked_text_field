
<h1 align="center">Masked Text Field</h1>

## Masked Text Field

[![pub package](https://img.shields.io/pub/v/masked_text_field.svg)](https://pub.dev/packages/masked_text_field)
[![pub points](https://badges.bar/masked_text_field/pub%20points)](https://pub.dev/packages/masked_text_field)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-in-0e76a8)](https://www.linkedin.com/in/alok-dubey-02ba331b6)
[![Instagram](https://img.shields.io/badge/Instagram-E4405F?logo=instagram&logoColor=white)](https://www.instagram.com/flutter_coding_/)
[![Facebook](https://img.shields.io/badge/Facebook-1877F2?logo=facebook&logoColor=white)](https://www.facebook.com/dalok2811/)
[![Youtube](https://img.shields.io/badge/YouTube-FF0000?logo=youtube&logoColor=white)](https://www.youtube.com/channel/UC7S6rSRNON1_YvKgiUjfyIw)

## Features

A package for masked text field for format your text (eg. Date, phone number, IP address etc.), so if you want a mask for phone number, or IP address or any kind of format. Use this package.
<br>
![Image](https://github.com/alok2811/masked_text_field/blob/master/screenshots/example.gif)

## Getting started

Add the dependency in pubsec.yaml file.

```
dart
  dependencies:
    flutter:
      sdk: flutter
    masked_text_field: any
```
## Usage Example

import flutter_social_button.dart

```

import 'package:masked_text_field/masked_text_field.dart';

```


## for add Text Field

It's very simple, it's a Widget as all the other ones.

```

MaskedTextField
(
    maskedTextFieldController: textfieldController,
    mask: "xxx.xxx.xxx.xxx",
    maxLength: 15,
    keyboardType: TextInputType.number,
    inputDecoration: new InputDecoration(
    hintText: "192.192.192.192", 
    counterText: "",
    labelText: "IP Address"),
);

```

'x' is the normal char that your text will have.

this sample reproduces something like this in the end: 192.192.192.192.

You can also change the escape character you want to use.

If you want to change it, you just need to fill the property escapeCharacter with the character you want.

```

MaskedTextField
(
    maskedTextFieldController: textfieldController,
    escapeCharacter: '#',
    mask: "###.###.###.###",
    maxLength: 15,
    keyboardType: TextInputType.number,
    inputDecoration: new InputDecoration(
    counterText: "",
    hintText: "192.192.192.192", 
    labelText: "IP Address"),
);

```

'x' is the default escape character.


## Example

```

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

```

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.
