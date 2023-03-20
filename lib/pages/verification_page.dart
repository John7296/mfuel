import 'package:flutter/material.dart';
import 'package:mfuel/pages/payment.dart';
import 'package:mfuel/widgets/circleIntersection.dart';
import 'package:mfuel/widgets/topBar.dart';

class VerificationPage extends StatelessWidget {
  VerificationPage({Key? key}) : super(key: key);

  final fuels = ["Petrol", "Diesel"];
  String? selectedFuel;
  final quantity = ["1 Litre", "2 Litre", "3 Litre", "4 Litre", "5 Litre"];
  String? selectedQuantity;

  Widget divider(double height) {
    return SizedBox(
      height: height,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEEBD8),
      // appBar: AppBar(
      //   backgroundColor: Color(0xFFB8D8C9),
      //   elevation: 0,
      // ),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopBar(
              welComeText: "",
              mainText: 'Confirm Booking',
              allText: false,
            ),
            divider(15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: Color(0xff85D7B0),
                ),
                height: 100,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Test Fuel Station",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text("Address of fuel station"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Distance"),
                        Text("5kms"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Price"),
                        Text("₹110/Litre"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            divider(15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: Color(0xff85D7B0),
                ),
                child: DropdownButtonFormField(
                  dropdownColor: Color(0xff85D7B0),
                    decoration: InputDecoration(
                      enabledBorder:
                      UnderlineInputBorder(borderSide: BorderSide.none),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      // label: Text('Select Fuel'),
                    ),
                    hint: selectedFuel == null?Text('Select Fuel'):Text(''),
                    items: fuels
                        .map((e) => DropdownMenuItem(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(e),
                              ),
                              value: e,

                            ))
                        .toList(),
                    onChanged: (value) {
                      selectedFuel = value;
                    }),
              ),
            ),
            divider(15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: Color(0xff85D7B0),
                ),
                child: DropdownButtonFormField(
                  dropdownColor: Color(0xff85D7B0),
                    decoration: InputDecoration(
                      enabledBorder:
                          UnderlineInputBorder(borderSide: BorderSide.none),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      // label: Text('Select Quantity'),
                    ),
                    hint: selectedFuel == null?Text('Select Quantity'):Text(''),
                    items: quantity
                        .map((e) => DropdownMenuItem(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(e),
                              ),
                              value: e,
                            ))
                        .toList(),
                    onChanged: (value) {
                      selectedQuantity = value;
                    }),
              ),
            ),
            divider(15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  // color: Color(0xff85D7B0),
                ),
                height: 110,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Payment Details",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(""),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Fuel Price"),
                        Text("₹110"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Delivery fee"),
                        Text("₹50"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("GST"),
                        Text("₹50"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Total Amount"),
                        Text("₹150"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            divider(15),
            Center(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Container(
                height: 50,
                width: double.infinity,
                child: OutlinedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xffE9DA73)),
                    shape: MaterialStateProperty.all(
                      StadiumBorder(),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return PaymentPage(
                            amount: '150',
                          );
                        },
                      ),
                    );
                  },
                  child: Text(
                    "Proceed To Payment",
                    style: TextStyle(
                        color: Color(0xff225E4A),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}

// Widget verificationPhone() {
//   return ClipRRect(
//     borderRadius: BorderRadius.all(Radius.circular(20)),
//     child: TextField(
//       decoration: InputDecoration(
//         enabledBorder: InputBorder.none,
//         focusedBorder: InputBorder.none,
//         disabledBorder: InputBorder.none,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(30),
//         ),
//         filled: true,
//         hintStyle: TextStyle(color: Colors.grey[600]),
//         hintText: "Phone Number",
//         fillColor: Colors.white,
//         // suffixIcon: InkWell(
//         //   child: Icon(
//         //     Icons.search,
//         //     color: Colors.grey[600],
//         //   ),
//         //   onTap: () {},
//         // ),
//       ),
//     ),
//   );
// }
