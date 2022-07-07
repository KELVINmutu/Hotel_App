import 'package:bwa_cozy/pages/home_page.dart';
import 'package:bwa_cozy/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:bwa_cozy/providers/post_provider.dart';
import 'package:bwa_cozy/models/space.dart';
import 'package:provider/provider.dart';

class CreatePage extends StatelessWidget {
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
                  labelText: "nama hotel",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          //Text Trips
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Center(
              child: TextField(
                controller: city,
                autocorrect: false,
                decoration: InputDecoration(
                  labelText: "city",
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
                controller: country,
                autocorrect: false,
                decoration: InputDecoration(
                  labelText: "country",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          //Text Airplane
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Center(
              child: TextField(
                controller: price,
                autocorrect: false,
                decoration: InputDecoration(
                  labelText: "price",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          //Text Harga
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Center(
              child: TextField(
                controller: image_url,
                autocorrect: false,
                decoration: InputDecoration(
                  labelText: "image url",
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
                controller: rating,
                autocorrect: false,
                decoration: InputDecoration(
                  labelText: "rating",
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
                controller: address,
                autocorrect: false,
                decoration: InputDecoration(
                  labelText: "address",
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
                controller: phone,
                autocorrect: false,
                decoration: InputDecoration(
                  labelText: "phone number",
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
                controller: map_url,
                autocorrect: false,
                decoration: InputDecoration(
                  labelText: "map url",
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
                controller: number_of_kitchens,
                autocorrect: false,
                decoration: InputDecoration(
                  labelText: "number of kitchens",
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
                  labelText: "number of bedrooms",
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
                  labelText: "number of cupboards",
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
                  control.post(
                    name.text,
                    image_url.text,
                    int.parse(price.text),
                    city.text,
                    country.text,
                    int.parse(rating.text),
                    address.text,
                    phone.text,
                    map_url.text,
                    int.parse(number_of_kitchens.text),
                    int.parse(number_of_bedrooms.text),
                    int.parse(number_of_cupboards.text),
                  );
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MainPage()));
                },
                child: const Text("Create Data"),
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
