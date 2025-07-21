// import 'package:flutter/material.dart';
//
// class Wallet extends StatefulWidget {
//   const Wallet({super.key});
//
//   @override
//   State<Wallet> createState() => _WalletState();
// }
//
// class _WalletState extends State<Wallet> {
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }

// first replace
// import 'package:flutter/material.dart';
//
// class Wallet extends StatefulWidget {
//   const Wallet({super.key});
//
//   @override
//   State<Wallet> createState() => _WalletState();
// }
//
// class _WalletState extends State<Wallet> {
//   int walletBalance = 1000;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("My Wallet"),
//         backgroundColor: const Color(0xffef2b39),
//       ),
//       body: Container(
//         padding: const EdgeInsets.all(20.0),
//         color: const Color(0xFFF9F9F9),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             const SizedBox(height: 20),
//             Material(
//               elevation: 5,
//               borderRadius: BorderRadius.circular(20),
//               child: Container(
//                 width: double.infinity,
//                 padding: const EdgeInsets.all(30.0),
//                 decoration: BoxDecoration(
//                   color: const Color(0xff1E1E99),
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text(
//                       "Available Balance",
//                       style: TextStyle(
//                         color: Colors.white70,
//                         fontSize: 16,
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//                     Text(
//                       "₹$walletBalance",
//                       style: const TextStyle(
//                         color: Colors.white,
//                         fontSize: 40,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(height: 30),
//             Material(
//               elevation: 3,
//               borderRadius: BorderRadius.circular(15),
//               child: ListTile(
//                 leading: const Icon(Icons.account_balance_wallet_outlined, color: Colors.black),
//                 title: const Text(
//                   "Add Money",
//                   style: TextStyle(fontWeight: FontWeight.w600),
//                 ),
//                 trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 18),
//                 onTap: () {
//                   // Future action
//                 },
//               ),
//             ),
//             const SizedBox(height: 15),
//             Material(
//               elevation: 3,
//               borderRadius: BorderRadius.circular(15),
//               child: ListTile(
//                 leading: const Icon(Icons.receipt_long_outlined, color: Colors.black),
//                 title: const Text(
//                   "Transaction History",
//                   style: TextStyle(fontWeight: FontWeight.w600),
//                 ),
//                 trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 18),
//                 onTap: () {
//                   // Future action
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  int walletBalance = 1000;

  void showAddMoneyDialog() {
    TextEditingController amountController = TextEditingController();

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Add Money",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: amountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Enter amount",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffef2b39),
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
                onPressed: () {
                  if (amountController.text.isNotEmpty) {
                    int addedAmount = int.parse(amountController.text);
                    setState(() {
                      walletBalance += addedAmount;
                    });
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.green,
                        content: Text("₹$addedAmount added to your wallet!"),
                      ),
                    );
                  }
                },
                child: const Text(
                  "Add Money",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Wallet"),
        backgroundColor: const Color(0xffef2b39),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        color: const Color(0xFFF9F9F9),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(30.0),
                decoration: BoxDecoration(
                  color: const Color(0xff1E1E99),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Available Balance",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "₹$walletBalance",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            Material(
              elevation: 3,
              borderRadius: BorderRadius.circular(15),
              child: ListTile(
                leading: const Icon(Icons.account_balance_wallet_outlined, color: Colors.black),
                title: const Text(
                  "Add Money",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 18),
                onTap: showAddMoneyDialog,
              ),
            ),
            const SizedBox(height: 15),
            Material(
              elevation: 3,
              borderRadius: BorderRadius.circular(15),
              child: ListTile(
                leading: const Icon(Icons.receipt_long_outlined, color: Colors.black),
                title: const Text(
                  "Transaction History",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 18),
                onTap: () {
                  // Future action
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
