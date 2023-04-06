import 'package:budget_tracker_app/pages/add_expense.dart';
import 'package:budget_tracker_app/pages/add_income.dart';
import 'package:budget_tracker_app/widgets/profile_menu.dart';
import 'package:flutter/material.dart';
import 'package:budget_tracker_app/theme/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Profile extends StatelessWidget {
  Profile({super.key});

  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey.withOpacity(0.05),
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(
            color: black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        backgroundColor: white,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.alarm,
              color: black,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Text('Clara Smith',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: black
                  ),
                  ),
              Text(user.email!, 
              style: TextStyle(
                    fontSize: 18,
                    color: black
                  ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: primary,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: primary.withOpacity(0.01),
                        spreadRadius: 10,
                        blurRadius: 3,
                        // changes position of shadow
                      ),
                    ]),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 25, bottom: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "United Bank",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: white),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "\$2446.90",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: white),
                          ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: white)),
                        child: const Padding(
                          padding: EdgeInsets.all(13.0),
                          child: Text(
                            "Update",
                            style: TextStyle(color: white),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              //menu
              ProfileMenuWidget(
                title: "Income",
                icon: Icons.wallet_giftcard,
                onPress: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddIncome()));
                },
              ),
              ProfileMenuWidget(
                title: "Expense",
                icon: Icons.wallet,
                onPress: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddExpense()));
                },
              ),
              ProfileMenuWidget(
                title: "My Account",
                icon: Icons.person,
                onPress: () {},
              ),
              ProfileMenuWidget(
                title: "Notification",
                icon: Icons.notifications,
                onPress: () {},
              ),
              ProfileMenuWidget(
                title: "Settings",
                icon: Icons.settings,
                onPress: () {},
              ),
              ProfileMenuWidget(
                title: "Information",
                icon: Icons.info,
                onPress: () {},
              ),
              ProfileMenuWidget(
                title: "Logout",
                icon: Icons.logout,
                textColor: Colors.red,
                onPress: () {
                  FirebaseAuth.instance.signOut();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
