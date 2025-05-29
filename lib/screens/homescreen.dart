import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../const/custom_text.dart';
import '../main.dart';

class HomeScreen extends StatefulWidget {
   HomeScreen({super.key});


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Map<String,dynamic>>doctorDetails=[
    {
      "image":"assets/images/doctorOne.jpg",
      "name":"Dr.Samira Ali",
      "field":"Dermatologist",
      "location":"Zamalek - Mohandessin",
      "rating":4.8,
      "reviews":1987
    },
    {
      "image":"assets/images/doctorTwo.jpg",
      "name":"Dr.Hassan Mahmoud",
      "field":"Orthopedic Surgeon",
      "location":"New Cairo - Nasr City",
      "rating":4.7,
      "reviews":1756
    },
    {
      "image":"assets/images/doctorThree.jpg",
      "name":"Dr.Ahmed Khan",
      "field":"Cardiologist",
      "location":"Giza - Dokki - Maadi",
      "rating":4.9,
      "reviews":2435
    },
    {
      "image":"assets/images/doctorFour.jpg",
      "name":"Dr.Omer Khalefa",
      "field":"Pediatrician",
      "location":"6th of October City",
      "rating":4.9,
      "reviews":2150
    }

  ];
List<Map<String,dynamic>>categories=[
  {
    "icon":"assets/svg/cardiology.svg",
    "text":"Cardiology"
  },
  {
    "icon":"assets/svg/pulmonology.svg",
    "text":"Pulmonology"
  },
  {
    "icon":"assets/svg/neurology.svg",
    "text":"Neurology"
  },
  {
    "icon":"assets/svg/surgery.svg",
    "text":"Surgery"
  },
  {
    "icon":"assets/svg/dermatology.svg",
    "text":"Dermatology"
  },
  {
    "icon":"assets/svg/nephrology.svg",
    "text":"Nephrology"
  },
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        toolbarHeight: width*0.2,
        backgroundColor: Colors.grey[200],
        leading: CircleAvatar(
          backgroundImage: AssetImage("assets/images/person.jpg"),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(title: 'Hi, Mohamed',
            ),
            CustomText(title: "How are you today?",
            color: Colors.blue.shade900,
            ),
          ],
        ),
        actions: [
          Container(
            height: width*0.06,
            width: width*0.06,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(width*0.02),
              color: Colors.white,
              border: Border.all(
                color: Colors.grey.shade200
              )
              
            ),
            child: Icon(Icons.notifications_none_rounded,color: Colors.black,),
          ),
          SizedBox(width: width*0.03,)
        ],

      ),
      body: Padding(
        padding: EdgeInsets.all(width*0.03),
        child: SingleChildScrollView(
          child: SizedBox(
            height: width*3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: width*1.15,
                  width: width*1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(width*0.03),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.15),
                              offset: Offset(0, 2),
                              blurRadius: 3,
                              spreadRadius: 1
                            )
                          ]
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: Icon(Icons.search,color: Colors.grey[400],),
                            labelText: "Search for Doctor",
                            labelStyle: TextStyle(
                              color: Colors.grey[400]
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(width*0.03)
                            )
                          ),
                        ),
                      ),
                                     CustomText(title: "Our  Services"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: width*0.17,
                            width: width*0.45,
                            padding: EdgeInsets.all(width*0.03),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(width*0.03)
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SvgPicture.asset("assets/svg/clinicAppointment.svg",
                                color: Colors.blue.shade900,
                                height: width*0.06,
                                ),
                                CustomText(title: "Clinic appointment")
                              ],
                            )


                          ),
                          Container(
                            height: width*0.17,
                            width: width*0.45,
                            padding: EdgeInsets.all(width*0.03),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(width*0.03)
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SvgPicture.asset("assets/svg/onlineAppointment.svg",
                                  color: Colors.blue.shade900,
                                  height: width*0.06,
                                ),
                                CustomText(title: "Online appointment")
                              ],
                            )


                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(title: "Offers"),
                          Text("See All",
                          style: TextStyle(
                            color: Colors.blue.shade900,
                            fontSize: width*0.03,
                            fontWeight: FontWeight.w600,decoration: TextDecoration.underline,
                            decorationColor: Colors.blue.shade900
                          ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: width*0.25,
                        width: width*1,
                        child: ListView.separated(
                          itemCount: 5,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                                height: width*0.25,
                                width: width*0.45,
                                padding: EdgeInsets.all(width*0.03),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(width*0.03)
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(title: "Hello Doctor!"),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: CustomText(title: "Offer 50% off for your first video call with your doctor",
                                            fontSize: width*0.02,
                                            color: Colors.grey.shade400,
                                          ),
                                        ),
                                        Expanded(
                                          child:
                                          Container(
                                            height: width*0.09,
                                            width: width*0.08,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQx_Ac4EqErfBGKoDPQu_9vC-Oaf2SqODDwfw&s"),
                                                    fit: BoxFit.fill
                                                ),
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(width*0.02)
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Container(
                                      height: width*0.05,
                                      width: width*0.15,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: Colors.blue.shade900,
                                          borderRadius: BorderRadius.circular(width*0.015)
                                      ),
                                      child: CustomText(title: "Get Offer",color: Colors.white,
                                        fontSize: width*0.03,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )

                                  ],
                                )


                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(width:width*0.03);
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(title: "Categories"),
                          Text("See All",
                            style: TextStyle(
                                color: Colors.blue.shade900,
                                fontSize: width*0.03,
                                fontWeight: FontWeight.w600,decoration: TextDecoration.underline,
                                decorationColor: Colors.blue.shade900
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: width*0.22,
                        width: width*1,
                        child: GridView.builder(
                          itemCount: categories.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                            mainAxisSpacing: width*0.013,
                            crossAxisSpacing: width*0.013,
                            childAspectRatio: 0.31
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              height: width*0.09,
                              padding: EdgeInsets.only(left: width*0.015,right: width*0.015),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(width*0.02)
                              ),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    color: Colors.blue.shade900,
                                    categories[index]['icon'],
                                    // height: width*0.04,
                                  ),
                                  CustomText(title: categories[index]['text'],)
                                ],
                              ),
                            );
                          },

                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(title: "Top Doctors"),
                          Text("See All",
                            style: TextStyle(
                                color: Colors.blue.shade900,
                                fontSize: width*0.03,
                                fontWeight: FontWeight.w600,decoration: TextDecoration.underline,
                                decorationColor: Colors.blue.shade900
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: ListView.separated(
                    itemCount: doctorDetails.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                          width: width*1,
                          padding: EdgeInsets.all(width*0.03),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(width*0.03)
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    height: width*0.17,
                                    width: width*0.15,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image:AssetImage(doctorDetails[index]['image']),
                                            fit: BoxFit.fill
                                        ),
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(width*0.015)
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CustomText(title: doctorDetails[index]['name']),
                                      CustomText(title: doctorDetails[index]['field'],
                                        fontSize: width*0.03,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey.shade400,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Icon(Icons.location_on_sharp,color: Colors.blue,),
                                          CustomText(title: doctorDetails[index]['location'],
                                            fontSize: width*0.03,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.grey.shade400,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.star,color: Colors.yellow),
                                          CustomText(title: doctorDetails[index]['rating'].toString())
                                        ],
                                      ),
                                      CustomText(title: "${doctorDetails[index]['reviews']} Reviews",
                                        fontSize: width*0.03,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey.shade400,
                                      )

                                    ],
                                  ),
                                  SizedBox(
                                    height: width*0.2,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(Icons.favorite,color: Colors.red,),
                                        CustomText(title: "400 EGP",
                                          color: Colors.blue.shade900,
                                        )
                                      ],
                                    ),
                                  )

                                ],
                              ),

                            ],
                          )


                      );
                    },
                  separatorBuilder: (context, index) {
                      return SizedBox(
                        height: width*0.02,
                      );
                  },
                  ),
                )


              ],
            ),
          ),
        ),
      ),
    );
  }
}
