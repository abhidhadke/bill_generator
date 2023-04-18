import 'package:bill_generator/screens/Quotation/quotation.dart';
import 'package:bill_generator/screens/admin_expense/admin_expense.dart';
import 'package:bill_generator/screens/homepage/components/app_bar.dart';
import 'package:bill_generator/screens/invoice/invoice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:google_fonts/google_fonts.dart';



class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      floatingActionButton: SpeedDial(
        children: [
          SpeedDialChild(
            backgroundColor: Colors.greenAccent,
            labelBackgroundColor: Colors.greenAccent,
            label: 'Quotation/Bill',
            labelStyle: GoogleFonts.poppins(fontWeight: FontWeight.w600),
              child: const Icon(Icons.edit),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (_) => const Quotation()));
            }
          ),
          SpeedDialChild(
            labelBackgroundColor: Colors.yellowAccent,
            backgroundColor: Colors.yellowAccent,
            label: 'Invoice Bill',
              labelStyle: GoogleFonts.poppins(fontWeight: FontWeight.w600),
              child: const Icon(Icons.edit),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (_) => const InvoiceBill()));
              }
          ),
          SpeedDialChild(
            labelBackgroundColor: Colors.redAccent,
            backgroundColor: Colors.redAccent,
            label: 'Admin Expense',
              labelStyle: GoogleFonts.poppins(fontWeight: FontWeight.w600),
            child: const Icon(Icons.edit),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (_) => const AdminExpense()));
              }
          )
        ],
        child: const Icon(Icons.add_rounded),
      ),
      body: Container(

      ),
    );
  }
}
