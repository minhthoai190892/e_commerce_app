import 'package:e_commerce_app/widgets/custom_appbar.dart';
import 'package:e_commerce_app/widgets/custom_nabar.dart';
import 'package:flutter/material.dart';

import '../../widgets/order_summary.dart';

class CheckoutScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController zipCodeController = TextEditingController();

  Padding _buildTextFormField(
    TextEditingController controller,
    BuildContext context,
    String labelText,
    
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          SizedBox(
            width: 75,
            child: Text(
              labelText,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          Expanded(
            child: TextFormField(
              controller: controller,
              decoration: const InputDecoration(
                
                  isDense: true,
                  contentPadding: EdgeInsets.only(left: 10),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black))),
            ),
          )
        ],
      ),
    );
  }

  CheckoutScreen({Key? key}) : super(key: key);
  static const String routeName = '/checkout';
  static Route route() {
    return MaterialPageRoute(
        builder: (context) => CheckoutScreen(),
        settings: const RouteSettings(name: routeName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Checkout"),
      bottomNavigationBar: const CustomNavBar(screen: routeName),
      body: ListView(
        children: [
          Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "CUSTOMER INFORMATION",
              style: Theme.of(context).textTheme.headline2,
            ),
            _buildTextFormField(emailController, context, 'Email',),
            _buildTextFormField(nameController, context, 'Full Name'),
           
          
            Text(
              "DELIVERY INFORMATION",
              style: Theme.of(context).textTheme.headline2,
            ),
            _buildTextFormField(addressController, context, 'Address'),
            _buildTextFormField(cityController, context, 'City'),
            _buildTextFormField(countryController, context, 'Country'),
            _buildTextFormField(zipCodeController, context, 'Zip Code'),
            Text(
              "ORDER SUMMARY",
              style: Theme.of(context).textTheme.headline2,
            ),
            const OrderSummary(),
          ],
        ),
      ),
        ],
      ),
    );
  }
}
