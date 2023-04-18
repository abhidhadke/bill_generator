import 'package:bill_generator/screens/Quotation/components/date_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class NameField extends StatefulWidget {
  final String label;
  final String hint;
  final Function(String) onSaved;
  final TextEditingController? controller;
  final bool isDate;

  const NameField(
      {Key? key,
      required this.label,
      required this.hint,
      required this.onSaved,
      required this.isDate, this.controller})
      : super(key: key);

  @override
  State<NameField> createState() => _NameFieldState();
}

class _NameFieldState extends State<NameField> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return widget.isDate
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${widget.label}:',
                style: GoogleFonts.nunito(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(color: Colors.blueAccent)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: TextFormField(
                          readOnly: true,
                          controller: widget.controller,
                          decoration: InputDecoration(
                              hintText: widget.hint,
                              hintStyle:
                                  GoogleFonts.nunito(fontStyle: FontStyle.italic),
                              border: InputBorder.none),
                          onChanged: widget.onSaved,
                        ),
                      ),
                      IconButton(onPressed: () async {
                        var date = await datePickerDialog(context);
                        widget.controller?.text = DateFormat('dd/MM/yyyy').format(date!);
                      }, icon: const Icon(Icons.date_range_rounded))
                    ],
                  )),
            ]
                .map((e) => Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, top: 10),
                      child: e,
                    ))
                .toList(),
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${widget.label}:',
                style: GoogleFonts.nunito(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(color: Colors.blueAccent)),
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: widget.hint,
                        hintStyle:
                            GoogleFonts.nunito(fontStyle: FontStyle.italic),
                        border: InputBorder.none),
                    onChanged: widget.onSaved,
                  )),
            ]
                .map((e) => Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, top: 10),
                      child: e,
                    ))
                .toList(),
          );
  }
}
