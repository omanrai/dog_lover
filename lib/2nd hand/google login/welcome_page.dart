import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
// import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';

import '../../dog/controller/dog_controller.dart';
import '../../dog/view/about.dart';
import '../../dog/view/shareApp.dart';
import '../signup_login/signup_screen.dart';
import 'first_screen.dart';
import 'google_auth_method.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var dogController = Get.put(DogController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        centerTitle: true,
        title: Text('Dog Info'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // showSearch(context: context, delegate: CustomSearchDelegate());
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName:
                  Text("${FirebaseAuth.instance.currentUser!.displayName}"),
              accountEmail: Text("${FirebaseAuth.instance.currentUser!.email}"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.black26,
                radius: 150,
                child: Image.network(
                  "${FirebaseAuth.instance.currentUser!.photoURL}",
                  color: Colors.transparent,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
              title: Text("About App"),
              leading: Icon(Icons.info_outline),
              onTap: () {
                // Get.to(() => AboutView());
              },
            ),
            ListTile(
              title: Text('Share App'),
              leading: Icon(Icons.share),
              onTap: () {
                Get.to(() => SharePage());
              },
            ),
            ListTile(
              title: Text('Sign Up'),
              leading: Icon(Icons.person_add),
              onTap: () {
                Get.to(() => SignupScreen());
              },
            ),
            ListTile(
              title: Text('Log Out'),
              leading: Icon(Icons.logout),
              onTap: () async {
                await FirebaseServices().googleSignOut();
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FirstScreen()));
              },
            ),
          ],
        ),
      ),
      body: Obx(
        () {
          if (dogController.isLoading.value == true) {
            return Center(
              child: Lottie.asset(
                'images/dog.json',
                height: 200,
                width: 200,
              ),
            );
          } else {
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: ListView.builder(
                      itemCount: dogController.dogList.length,
                      shrinkWrap: true,
                      physics: AlwaysScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                            bottom: 5,
                          ),
                          child: Card(
                            child: ListTile(
                              leading: SizedBox(
                                  width: 100,
                                  height: 100,
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        "${dogController.dogList[index].image!.url.toString()}",
                                    placeholder: (context, url) => Center(
                                      child: Lottie.asset(
                                        'images/dog.json',
                                        height: 50,
                                        width: 50,
                                      ),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  )),
                              title: Text(dogController.dogList[index].name!),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      "Origin: ${dogController.dogList[index].origin}"),
                                  Text(
                                      "Life Span: ${dogController.dogList[index].lifeSpan}"),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

// class CustomSearchDelegate extends SearchDelegate {
//   var dogController = Get.put(DogController());

//   @override
//   List<Widget> buildActions(BuildContext context) {
//     return [
//       IconButton(
//         icon: Icon(Icons.clear),
//         onPressed: () {
//           query = '';
//         },
//       ),
//     ];
//   }

//   @override
//   Widget buildLeading(BuildContext context) {
//     return IconButton(
//       icon: Icon(Icons.arrow_back),
//       onPressed: () {
//         close(context, null);
//       },
//     );
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     if (query.length < 3) {
//       return Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Center(
//             child: Text(
//               "Search term must be longer than two letters.",
//             ),
//           )
//         ],
//       );
//     }
//     var nameOfDog = [
//       'Bella',
//       'Charlie',
//       'Luna',
//       'Lucy',
//       'Max',
//       'Bailey',
//       'Cooper',
//       'Daisy',
//       'Sadie',
//       'Molly',
//       'Buddy',
//       'Lola',
//       'Stella',
//       'Tucker',
//       'Bentley',
//       'Zoey',
//       'Harley',
//       'Maggie',
//       'Riley',
//       'Bear',
//       'Sophie',
//       'Duke',
//       'Jax',
//       'Oliver',
//       'Chloe',
//       'Jack',
//       'Penny',
//       'Rocky',
//       'Lily',
//       'Milo',
//       'Piper',
//       'Toby',
//       'Zeus',
//       'Ellie',
//       'Nala',
//       'Roxy',
//       'Winston',
//       'Gracie',
//       'Coco',
//       'Murphy',
//       'Dexter',
//       'Teddy',
//       'Ruby',
//       'Diesel',
//       'Rosie',
//       'Marley',
//       'Loki',
//       'Scout',
//       'Mia',
//       'Leo',
//       'Gus',
//       'Abby',
//     ];
//     List<String> matchQuery = [];
//     for (var name in nameOfDog) {
//       if (name.toLowerCase().contains(query.toLowerCase())) {
//         matchQuery.add(name);
//       }
//     }
//     return ListView.builder(
//       itemCount: matchQuery.length,
//       shrinkWrap: true,
//       physics: NeverScrollableScrollPhysics(),
//       itemBuilder: (BuildContext context, int index) {
//         var result = matchQuery[index];
//         return ListTile(
//           title: Text(result),
//         );
//       },
//     );
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     dogController.buildSuggestions(query);
//     return Obx(() {
//       return ListView.builder(
//         itemCount: dogController.matchQuery.length,
//         shrinkWrap: true,
//         physics: NeverScrollableScrollPhysics(),
//         itemBuilder: (BuildContext context, int index) {
//           var result = dogController.matchQuery[index];
//           return ListTile(
//             title: Text(result),
//           );
//         },
//       );
//     });
//   }
// }
