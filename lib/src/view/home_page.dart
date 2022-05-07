import 'package:flutter/material.dart';
import 'package:food_app/src/model/model.dart';
import 'package:food_app/src/service/api.dart';
import 'package:food_app/src/widget/rec_card.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();
  List<RecipeModel> _recipe = [];

  bool isLoading = false;
  @override
  void initState() {
    super.initState();

    getData();
  }

  Future<void> getData() async {
    _recipe = await RecipeApi().getData();

    setState(() {
      isLoading = false;
    });

    print(_recipe);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.restaurant_menu,
                color: Colors.black,
                size: 7.w,
              ),
              SizedBox(
                width: 2.w,
              ),
              Text(
                "Food Recipe",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              )
            ],
          ),
        ),
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(backgroundColor: Colors.red),
              )
            : ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: _recipe.length,
                itemBuilder: (context, index) {
                  return RecipeCard(
                      title: _recipe[index].name,
                      cookTime: _recipe[index].totalTime,
                      rating: _recipe[index].rating.toString(),
                      thumbnailUrl: _recipe[index].images);
                }));
  }
}
