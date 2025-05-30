import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medicalapp/auth/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

getUserName()async{
  SharedPreferences prefs=await SharedPreferences.getInstance();
  userName=prefs.getString('username');
  setState(() {

  });
}
removeUserName()async{
  SharedPreferences prefs =await SharedPreferences.getInstance();
  prefs.remove('username');
  prefs.clear();

}
@override
  void initState() {
    getUserName();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        toolbarHeight: width*0.15,
        backgroundColor: Colors.grey[200],
        leading: Padding(
          padding: EdgeInsets.only(left: width*0.02),
          child: CircleAvatar(
            backgroundImage: AssetImage("assets/images/person.jpg"),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(title: 'Hi, $userName',
              color: Colors.black,
            ),
            CustomText(title: "How are you today?",
            color: Colors.lightBlue.shade800,
            ),
          ],
        ),
        actions: [
          Container(
            height: width*0.08,
            width: width*0.08,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(width*0.02),
              color: Colors.white,
              border: Border.all(
                color: Colors.grey.shade200
              )
              
            ),
            child: Icon(Icons.notifications_none_rounded,color: Colors.black,),
          ),
          SizedBox(width: width*0.03,
          ),
          InkWell(
            onTap: () {
              removeUserName();
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
              setState(() {

              });
            },
            child: Container(
              height: width*0.08,
              width: width*0.08,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(width*0.02),
                  color: Colors.white,
                  border: Border.all(
                      color: Colors.grey.shade200
                  )

              ),
              child: Icon(Icons.logout,color: Colors.black,),
            ),
          ),
      SizedBox(width: width*0.03),
        ],

      ),
      body: Padding(
        padding: EdgeInsets.all(width*0.03),
        child: SingleChildScrollView(
          child: SizedBox(
            height: width*2.5,
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
                      SizedBox(height: width*0.01),
                      Container(
                        height: width*0.14,
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
                            labelText: "Search for 'Doctor'",
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

                      CustomText(title: "Our  Services",color: Colors.blueGrey.shade700),
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
                                color: Colors.lightBlue.shade800,
                                height: width*0.06,
                                ),
                                CustomText(title: "Clinic appointment",color: Colors.blueGrey.shade700)
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
                                  color: Colors.lightBlue.shade800,
                                  height: width*0.06,
                                ),
                                CustomText(title: "Online appointment",color:Colors.blueGrey.shade700)
                              ],
                            )


                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(title: "Offers",color: Colors.blueGrey.shade700),
                          Text("See All",
                          style: TextStyle(
                            color:Colors.lightBlue.shade800,
                            fontSize: width*0.03,
                            fontWeight: FontWeight.w600,decoration: TextDecoration.underline,
                            decorationColor:Colors.lightBlue.shade800,
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
                                    CustomText(title: "Hello Doctor!",color: Colors.blueGrey.shade700),
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
                                            height: width*0.096,
                                            width: width*0.096,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(image: AssetImage("assets/images/doctorvideo.jpg"),
                                                    fit: BoxFit.fitHeight
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
                                          color: Colors.lightBlue.shade800,
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
                          CustomText(title: "Categories",color: Colors.blueGrey.shade700),
                          Text("See All",
                            style: TextStyle(
                                color: Colors.lightBlue.shade800,
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
                            childAspectRatio: 0.34
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
                                    color: Colors.lightBlue.shade800,
                                    categories[index]['icon'],width: width*0.06,
                                    // height: width*0.04,
                                  ),
                                  CustomText(title: categories[index]['text'],color: Colors.blueGrey.shade700)
                                ],
                              ),
                            );
                          },

                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(title: "Top Doctors",color: Colors.blueGrey.shade700),
                          Text("See All",
                            style: TextStyle(
                                color:Colors.lightBlue.shade800,
                                fontSize: width*0.03,
                                fontWeight: FontWeight.w600,decoration: TextDecoration.underline,
                                decorationColor: Colors.blue.shade900
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: width*0.01,
                      )
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
                                      CustomText(title: doctorDetails[index]['name'],color: Colors.blueGrey.shade700),
                                      CustomText(title: doctorDetails[index]['field'],
                                        fontSize: width*0.03,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey.shade400,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Icon(Icons.location_on_sharp,color: Colors.lightBlue.shade800),
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
                                          CustomText(title: doctorDetails[index]['rating'].toString(),color: Colors.blueGrey.shade700)
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
                                          color:Colors.lightBlue.shade800,
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
