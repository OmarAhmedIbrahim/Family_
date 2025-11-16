import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quran_app/constants/colors.dart';
import 'package:quran_app/constants/spaces.dart';
import 'package:quran_app/constants/textstyles.dart';
import 'package:quran_app/widgets/custom_button.dart';
import 'package:quran_app/widgets/custom_icon.dart';
import 'package:quran_app/widgets/user_assigned_pages.dart';

class FamilyPage extends StatefulWidget {
  const FamilyPage({super.key});

  @override
  State<FamilyPage> createState() => _FamilyPageState();
}

class _FamilyPageState extends State<FamilyPage> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;
        return Scaffold(
          appBar: AppBar(
            shape: Border(
              bottom: BorderSide(
                color: selectedColor, // Line color
                width: 1.0, // Line thickness
              ),
            ),
            //elevation: 1,
            automaticallyImplyLeading: false,
            backgroundColor: appBackgroundColor,
            title: Text('Family Page', style: appbarText()),
            //centerTitle: true,
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomButton(
                  onTap: () {},
                  buttonColor: appBackgroundColor,
                  text: "Manage Families",
                  width: 150,
                  borderRadius: 10,
                  border: Border.all(width: 2.0, color: borderSelectedColor),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Iconsax.setting_2, color: Colors.white),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  midHeightSpace(),
                  Card(
                    elevation: 20,
                    child: Container(
                      width: screenWidth * 0.9,
                      //height: 300,
                      decoration: BoxDecoration(
                        color: cardColor,
                        border: Border.all(width: 3, color: lightBlue),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(avgPadding),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Family Name', style: avgText()),
                                    SelectableText(
                                      'Code : ABC123',
                                      style: smallText(
                                        weight: FontWeight.w300,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                                Card(
                                  elevation: 20,
                                  child: Container(
                                    width: screenWidth * 0.2,
                                    //height: 300,
                                    decoration: BoxDecoration(
                                      color: selectedColor,
                                      border: Border.all(
                                        width: 1,
                                        color: lightBlue,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      children: [
                                        smallHeightSpace(),
                                        Icon(
                                          Iconsax.cup,
                                          color: dividerColor,
                                          size: 30,
                                        ),
                                        Text("6", style: smallText()),
                                        Text(
                                          "Finished",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            midHeightSpace(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Today\'s Progress',
                                  style: smallText(weight: FontWeight.w300),
                                ),
                                Text(
                                  "1/5",
                                  style: smallText(weight: FontWeight.w300),
                                ),
                              ],
                            ),
                            smallHeightSpace(),
                            Container(
                              height: 10,
                              width: screenWidth * 0.9,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              // Container's decoration does not automatically clip its child.
                              // Wrap the progress indicator with ClipRRect so it respects
                              // the same border radius and displays rounded corners.
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: LinearProgressIndicator(
                                  value: 1 / 5,
                                  backgroundColor: borderNotSelectedColor,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    dividerColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  largeHeightSpace(),
                  Card(
                    elevation: 20,
                    child: Container(
                      width: screenWidth * 0.9,
                      //height: 300,
                      decoration: BoxDecoration(
                        color: cardColor,
                        border: Border.all(width: 3, color: lightBlue),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: avgPadding),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: avgPadding),
                              child: Row(
                                children: [
                                  CustomIcon(
                                    color: dividerColor,
                                    icon: Iconsax.profile_2user,
                                    iconColor: Colors.black,
                                    length: 50,
                                    size: 27,
                                  ),
                                  midWidthSpace(),
                                  Text("Family Reading Status", style: appbarText()),
                                  
                                ],
                              ),
                             
                            ),
                            smallHeightSpace(),
                             Text("Today's progress for all members" , style: smallText(weight: FontWeight.w300),),
                             midHeightSpace(),
                             Center(
                               child: UserAssignedPages(
                                 title: "John Doe",
                                 subtitle: "Pages 7 - 10",
                                 buttonText: "Mark as done",
                                 width: screenWidth * 0.8,
                                 onButtonTap: () {},
                                 icon: Iconsax.book_saved,
                               ),
                             ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
