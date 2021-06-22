import 'package:flutter/material.dart';
import 'package:gestionferme/Screens/MatieresPremieres/Consommations/Components/selectProvende.dart';
import 'package:get/get.dart';

class NewConsProvende extends StatelessWidget {
  const NewConsProvende(this.pageController);
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 10, top: 4),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    pageController.previousPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeOutBack);
                  },
                  icon: Icon(
                    Icons.close,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 16),
            child: Material(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
              shadowColor: Colors.black,
              elevation: 2,
              child: InkWell(
                borderRadius: BorderRadius.circular(6),
                splashColor: Theme.of(context).primaryColor,
                onTap: () {
                  Get.to(() => SelectProvende("1er Service"));
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  height: 100,
                  width: Get.width - 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("1er Service"),
                      Container(
                        height: 1,
                        constraints: BoxConstraints(),
                        color: Color(0xffbebebe),
                      ),
                      Text("32 / 58 lots"),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 16),
            child: Material(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
              shadowColor: Colors.black,
              elevation: 2,
              child: InkWell(
                borderRadius: BorderRadius.circular(6),
                splashColor: Theme.of(context).primaryColor,
                onTap: () {
                  Get.to(() => SelectProvende("2ème Service"));
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  height: 100,
                  width: Get.width - 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("2ème Service"),
                      Container(
                        height: 1,
                        constraints: BoxConstraints(),
                        color: Color(0xffbebebe),
                      ),
                      Text("0 / 58 lots"),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 16),
            child: Material(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
              shadowColor: Colors.black,
              elevation: 2,
              child: InkWell(
                borderRadius: BorderRadius.circular(6),
                splashColor: Theme.of(context).primaryColor,
                onTap: () {
                  Get.to(() => SelectProvende("3ème Service"));
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  height: 100,
                  width: Get.width - 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("3ème Service"),
                      Container(
                        height: 1,
                        constraints: BoxConstraints(),
                        color: Color(0xffbebebe),
                      ),
                      Text("0 / 58 lots"),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
