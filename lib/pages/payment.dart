import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PaymentPage extends StatefulWidget {
  PaymentPage({
    required this.amount,
  });

  String amount;

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  Razorpay? _razorpay;
  TextEditingController amountController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 0), () {
      _razorpay = Razorpay();
      _razorpay!.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
      _razorpay!.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    });
  }

  _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
        msg: "Payment is successfull \n Reference Number is : " +
            response.paymentId.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "Error occured while making the payment" +
            response.error.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  openCheckOut() {
    var options = {
      'key': 'rzp_test_VpoOcNOah6avtB',
      'amount':
          widget.amount+ "00", //in the smallest currency sub-unit.
      'name': 'Acme Corp.',
      'description': 'Fine T-Shirt',
      'timeout': 60, // in seconds
      'prefill': {'contact': '9123456789', 'email': 'gaurav.kumar@example.com'}
    };
    try {
      _razorpay!.open(options);
    } catch (e) {
      // debugPrint('Error: e');
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff85D7B0),
        centerTitle: true,
        title: Text("Payment"),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // TextField(
                  //   controller: amountController,
                  //   keyboardType: TextInputType.number,
                  //   inputFormatters: [

                  //     FilteringTextInputFormatter.digitsOnly,
                  //   ],
                  //   decoration: InputDecoration(hintText: "Enter the amount"),
                  // ),
                  Container(
                    child: Text(widget.amount),
                  ),
                  Center(
                    child: TextButton(
                        onPressed: () {
                          openCheckOut();
                        },
                        child: Text("Proceed to payment")),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay!.clear();
  }
}
