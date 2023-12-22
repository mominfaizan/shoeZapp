import 'package:ShoeZapp/consts/colors.dart';
import 'package:ShoeZapp/consts/consts.dart';
import 'package:ShoeZapp/consts/list.dart';
import 'package:flutter/material.dart';

class cartscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Container(
        color: whiteColor,
        padding: EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: cartitemlist.length,
          itemBuilder: (context, index) {
            final cartItem = cartitemlist[index];
            return Padding(
              padding: EdgeInsets.only(bottom: 16.0), // Add space between cards
              child: Card(
                elevation: 3,
                child: ListTile(
                  contentPadding:
                      EdgeInsets.all(12.0), // Add space within the card
                  leading: Image.asset(
                    nikeImage,
                    width: 80,
                  ),
                  // 8.widthBox(),
                  title: Text(
                    cartItem.toString(),
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    'Price: \$600',
                    style: TextStyle(color: redColor, fontSize: 14),
                  ),
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            // Handle "Buy Now" button press
          },
          style: ElevatedButton.styleFrom(
            primary: redColor,
            padding: EdgeInsets.all(16.0),
          ),
          child: Text(
            'Buy Total Amount: \$${cartitemlist.length * 600}',
            style: TextStyle(fontSize: 16, color: whiteColor),
          ),
        ),
      ),
    );
  }
}
