import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _sliderValue = 100.0;

  bool _blockCheckbox = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sliders"),
      ),
      body: Container(
        child: Column(
          children: [
            _createSlider(),
            createCheckBox(),
            createSwitch(),
            Expanded(child: _createImage()),
          ],
        ),
      ),
    );
  }

  Widget _createSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: "Tamaño de la Imagen",
      // divisions: 20,
      value: _sliderValue,
      min: 10.0,
      max: 200.0,
      onChanged: _blockCheckbox
          ? null
          : (value) => setState(() {
                _sliderValue = value;
              }),
    );
  }

  Widget _createImage() {
    return Image(
      image: NetworkImage(
          "https://images.pexels.com/photos/351495/pexels-photo-351495.jpeg"),
      width: _sliderValue,
      fit: BoxFit.contain,
    );
  }

  Widget createCheckBox() {
    // return Checkbox(
    //   value: _blockCheckbox,
    //   onChanged: (value) => setState(() {
    //     _blockCheckbox = value;
    //   }),
    // );
    //
    return CheckboxListTile(
      title: Text("Bloquear Slider"),
      value: _blockCheckbox,
      onChanged: (value) => setState(() {
        _blockCheckbox = value;
      }),
    );
  }

  Widget createSwitch() {
    return SwitchListTile(
      title: Text("Bloquear Slider"),
      value: _blockCheckbox,
      onChanged: (value) => setState(() {
        _blockCheckbox = value;
      }),
    );
  }
}
