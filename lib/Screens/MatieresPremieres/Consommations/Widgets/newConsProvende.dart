import 'package:flutter/material.dart';
import 'package:gestionferme/App/Controllers/consommationController.dart';
import 'package:gestionferme/Screens/MatieresPremieres/Consommations/Components/selectProvende.dart';
import 'package:get/get.dart';

class NewConsProvende extends StatefulWidget {
  const NewConsProvende(this.pageController, this.controller);
  final PageController pageController;
  final ConsommationController controller;

  @override
  _NewConsProvendeState createState() =>
      _NewConsProvendeState(pageController, controller);
}

class _NewConsProvendeState extends State<NewConsProvende> {
  final PageController pageController;
  final ConsommationController controller;

  _NewConsProvendeState(this.pageController, this.controller);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Color(0xffeeeeee),
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
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 1,
                    spreadRadius: 0.1,
                  )
                ],
                borderRadius: BorderRadius.circular(5),
              ),
              child: Material(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
                shadowColor: Colors.black,
                elevation: 2,
                child: InkWell(
                  borderRadius: BorderRadius.circular(6),
                  splashColor: Theme.of(context).primaryColor,
                  onTap: () {
                    controller.getServiceOrder(1);
                    Get.to(() => SelectProvende("1er Service", pageController));
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    height: 100,
                    width: Get.width - 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "1er Service",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 18),
                        ),
                        /*Container(
                          height: 1,
                          constraints: BoxConstraints(),
                          color: Color(0xffbebebe),
                        ),
                        Text("32 / 58 lots"),*/
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 1,
                    spreadRadius: 0.1,
                  )
                ],
                borderRadius: BorderRadius.circular(5),
              ),
              child: Material(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
                shadowColor: Colors.black,
                elevation: 2,
                child: InkWell(
                  borderRadius: BorderRadius.circular(6),
                  splashColor: Theme.of(context).primaryColor,
                  onTap: () {
                    controller.getServiceOrder(2);
                    Get.to(
                        () => SelectProvende("2ème Service", pageController));
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    height: 100,
                    width: Get.width - 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "2ème Service",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 18),
                        ),
                        /*Container(
                          height: 1,
                          constraints: BoxConstraints(),
                          color: Color(0xffbebebe),
                        ),
                        Text("0 / 58 lots"),*/
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 1,
                    spreadRadius: 0.1,
                  )
                ],
                borderRadius: BorderRadius.circular(5),
              ),
              child: Material(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
                shadowColor: Colors.black,
                elevation: 2,
                child: InkWell(
                  borderRadius: BorderRadius.circular(6),
                  splashColor: Theme.of(context).primaryColor,
                  onTap: () {
                    controller.getServiceOrder(3);
                    Get.to(
                        () => SelectProvende("3ème Service", pageController));
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    height: 100,
                    width: Get.width - 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "3ème Service",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 18),
                        ),
                        /*Container(
                          height: 1,
                          constraints: BoxConstraints(),
                          color: Color(0xffbebebe),
                        ),
                        Text("0 / 58 lots"),*/
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
