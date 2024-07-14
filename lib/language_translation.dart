import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class LanguageTranslation extends StatefulWidget {
  const LanguageTranslation({super.key});

  @override
  State<LanguageTranslation> createState() => _LanguageTranslationState();
}

class _LanguageTranslationState extends State<LanguageTranslation> {
  var languages = ['Hindi', 'English', 'Japanese'];
  var originLanguage = "From";
  var destinationLanguage = "To";
  var output = "";
  TextEditingController languageController = TextEditingController();

  void translate(String src, String dest, String input) async{
    GoogleTranslator translator= new GoogleTranslator();
    var translation = await translator.translate(input, from: src, to: dest);
    setState(() {
      output = translation.text.toString();
    });
    if(src=='--' || dest == '--'){
      output = "Fail to transalte";
    }
  }

  String getLanguageCode(String Language){
    if(Language=="English"){
      return "en";
    }
    else if(Language=="Hindi"){
      return "hi";
    }
    else if(Language=="Japanese"){
      return "ja";
    }
    return "--";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 137, 129),
      appBar: AppBar(
        title: const Text("Language Translator"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 176, 169),
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButton(
                    focusColor: Colors.white,
                    iconDisabledColor: Colors.white,
                    iconEnabledColor: Colors.white,
                    hint: Text(
                      originLanguage,
                      style: TextStyle(color: Colors.white),
                    ),
                    dropdownColor: Colors.white,
                    icon: Icon(Icons.keyboard_arrow_down),
                    items: languages.map((String dropDownStringItem) {
                      return DropdownMenuItem(
                        child: Text(dropDownStringItem),
                        value: dropDownStringItem,
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        originLanguage = value!;
                      });
                    },
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Icon(
                    Icons.arrow_right_alt_outlined,
                    color: Colors.white,
                    size: 40,
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  DropdownButton(
                    focusColor: Colors.white,
                    iconDisabledColor: Colors.white,
                    iconEnabledColor: Colors.white,
                    hint: Text(
                      destinationLanguage,
                      style: TextStyle(color: Colors.white),
                    ),
                    dropdownColor: Colors.white,
                    icon: Icon(Icons.keyboard_arrow_down),
                    items: languages.map((String dropDownStringItem) {
                      return DropdownMenuItem(
                        child: Text(dropDownStringItem),
                        value: dropDownStringItem,
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        destinationLanguage = value!;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: TextFormField(
                  cursorColor: Colors.white,
                  autofocus: false,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      labelText: 'Please enter your data...',
                      labelStyle: TextStyle(fontSize: 20, color: Colors.white),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1,
                      )),
                      errorStyle: TextStyle(color: Colors.red, fontSize: 18),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1),
                      )),
                  controller: languageController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your text";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child:
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor:  Colors.white),
                      onPressed: () {
                        translate(getLanguageCode(originLanguage), getLanguageCode(destinationLanguage), languageController.text.toString());
                      }, child: Text("Translate")),
              ),
              SizedBox(height: 22),
              Text("\n$output",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),)
            ],
          ),
        ),
      ),
    );
  }
}
