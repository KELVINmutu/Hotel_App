import 'package:bwa_cozy/pages/home_page.dart';
import 'package:bwa_cozy/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:bwa_cozy/providers/post_provider.dart';
import 'package:bwa_cozy/models/space.dart';
import 'package:provider/provider.dart';

class getPage extends StatelessWidget {
  final Space space;
  getPage(this.space);
  TextEditingController name = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController image_url = TextEditingController();
  TextEditingController rating = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController map_url = TextEditingController();
  TextEditingController number_of_kitchens = TextEditingController();
  TextEditingController number_of_bedrooms = TextEditingController();
  TextEditingController number_of_cupboards = TextEditingController();

  @override
  Widget build(BuildContext context) {
    PostProvider control = Provider.of<PostProvider>(context);
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Detail Data Pesawat"),
      //   centerTitle: true,
      //   flexibleSpace: Container(
      //     decoration: const BoxDecoration(
      //       image: DecorationImage(
      //         image: NetworkImage(
      //             "https://img.idxchannel.com/media/500/images/idx/2019/04/01/pesawat_terbang.jpg"),
      //         fit: BoxFit.fill,
      //       ),
      //     ),
      //   ),
      // ),
      body: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          const SizedBox(height: 15),
          //Text Nama
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Center(
              child: TextField(
                controller: name,
                autocorrect: false,
                decoration: InputDecoration(
                  labelText: "${space.name}",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          //Text Trips
          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 10),
          //   child: Center(
          //     child: TextField(
          //       controller: city,
          //       autocorrect: false,
          //       decoration: InputDecoration(
          //         labelText: "${space.city}",
          //         border: OutlineInputBorder(),
          //       ),
          //     ),
          //   ),
          // ),
          // const SizedBox(height: 15),
          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 10),
          //   child: Center(
          //     child: TextField(
          //       controller: country,
          //       autocorrect: false,
          //       decoration: InputDecoration(
          //         labelText: "${space.country}",
          //         border: OutlineInputBorder(),
          //       ),
          //     ),
          //   ),
          // ),
          // const SizedBox(height: 15),
          //Text Airplane
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Center(
              child: TextField(
                controller: price,
                autocorrect: false,
                decoration: InputDecoration(
                  labelText: "${space.price}",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          //Text Harga
          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 10),
          //   child: Center(
          //     child: TextField(
          //       controller: image_url,
          //       autocorrect: false,
          //       decoration: InputDecoration(
          //         labelText: "${space.imageUrl}",
          //         border: OutlineInputBorder(),
          //       ),
          //     ),
          //   ),
          // ),
          // const SizedBox(height: 15),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Center(
              child: TextField(
                controller: rating,
                autocorrect: false,
                decoration: InputDecoration(
                  labelText: "${space.rating}",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 10),
          //   child: Center(
          //     child: TextField(
          //       controller: address,
          //       autocorrect: false,
          //       decoration: InputDecoration(
          //         labelText: "${space.address}",
          //         border: OutlineInputBorder(),
          //       ),
          //     ),
          //   ),
          // ),
          // const SizedBox(height: 15),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Center(
              child: TextField(
                controller: phone,
                autocorrect: false,
                decoration: InputDecoration(
                  labelText: "${space.phone}",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 10),
          //   child: Center(
          //     child: TextField(
          //       controller: map_url,
          //       autocorrect: false,
          //       decoration: InputDecoration(
          //         labelText: "${space.mapUrl}",
          //         border: OutlineInputBorder(),
          //       ),
          //     ),
          //   ),
          // ),
          // const SizedBox(height: 15),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Center(
              child: TextField(
                controller: number_of_kitchens,
                autocorrect: false,
                decoration: InputDecoration(
                  labelText: "${space.numberOfKitchens}",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Center(
              child: TextField(
                controller: number_of_bedrooms,
                autocorrect: false,
                decoration: InputDecoration(
                  labelText: "${space.numberOfBedrooms}",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Center(
              child: TextField(
                controller: number_of_cupboards,
                autocorrect: false,
                decoration: InputDecoration(
                  labelText: "${space.numberOfCupboards}",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          //Button Update
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  control.path(
                    name.text,
                    // image_url.text,
                    int.parse(price.text),
                    // city.text,
                    // country.text,
                    int.parse(rating.text),
                    // address.text,
                    phone.text,
                    // map_url.text,
                    int.parse(number_of_kitchens.text),
                    int.parse(number_of_bedrooms.text),
                    int.parse(number_of_cupboards.text),
                    space.id,
                  );
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MainPage()));
                },
                child: const Text("Update Data"),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          //Button Delete
          const SizedBox(
            height: 20,
          ),
          const Divider(
            color: Color(0xFF0266FF),
            indent: 10,
            endIndent: 10,
            thickness: 0.2,
          ),
          //Text 1

          //Content 1 Gambar
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
