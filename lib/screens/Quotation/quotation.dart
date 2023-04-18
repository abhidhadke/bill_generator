import 'package:bill_generator/screens/Quotation/components/app_bar.dart';
import 'package:bill_generator/screens/Quotation/components/form_field.dart';
import 'package:bill_generator/screens/Quotation/item_lists.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../bill.dart';

class Quotation extends StatefulWidget {
  const Quotation({Key? key}) : super(key: key);

  @override
  State<Quotation> createState() => _QuotationState();
}

class _QuotationState extends State<Quotation> {
  String error = '';
  bool isError = false;
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          NameField(
            label: '*Name',
            hint: 'name',
            onSaved: (value) {
              debugPrint(value);
              name = value;
            },
            isDate: false,
          ),
          NameField(
            label: 'Bill/Quotation No.',
            hint: 'bill/quotation number',
            onSaved: (value) {
              billNo = value;
            },
            isDate: false,
          ),
          NameField(
              label: '*Date',
              hint: 'date',
              onSaved: (value) {
                date = value;
                debugPrint(_controller.text);
              },
              controller: _controller,
              isDate: true),
          const Spacer(),
          Visibility(
              visible: isError,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
           error,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: GoogleFonts.nunito(
                color: Colors.redAccent,
                fontSize: 18,
                fontStyle: FontStyle.italic
            ),
          ),
              )),
          Row(
            children: [
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: ElevatedButtonTheme(
                  data: ElevatedButtonThemeData(
                    style: ButtonStyle(
                        padding: const MaterialStatePropertyAll(
                            EdgeInsets.fromLTRB(20, 10, 20, 10)),
                        elevation: const MaterialStatePropertyAll(8),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)))),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      if(_controller.text != ''){
                        date = _controller.text;
                      }
                      else{
                       return setState(() {
                          error = 'Date not provided!!';
                          isError = true;
                        });
                      }
                      if(name == ''){
                        return setState(() {
                          error = 'Name not provided!!';
                          isError = true;
                        });
                      }

                      setState(() {
                        isError = false;
                        Navigator.push(context, MaterialPageRoute(builder: (_)=>const ItemList()));
                      });
                    },
                    child: Text(
                      "Next",
                      style: GoogleFonts.nunito(
                          fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
