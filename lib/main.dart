import 'dart:convert';

import 'package:appfood/model/cart_model.dart';
import 'package:appfood/model/restaurante_model.dart';
import 'package:appfood/screens/restaurante_home.dart';
import 'package:appfood/state/cart_state.dart';
import 'package:appfood/state/main_state.dart';
import 'package:appfood/view_model/main_vm/main_view_model_imp.dart';
import 'package:appfood/widgtes/common/common_widgets.dart';
import 'package:auto_animated/auto_animated.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseApp app = await Firebase.initializeApp();
  await GetStorage.init();
  runApp(MyApp(app: app));
}

class MyApp extends StatefulWidget {
  final FirebaseApp app;
  final viewModel = MainViewModelImp();
  final mainStateController = Get.put(MainStateController());
  final box = GetStorage();
  final cartStateController = Get.put(CartStateController());

  MyApp({required this.app});
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      if (widget.box.hasData('CART_STORAGE')) {
        var salvarCart = await widget.box.read('CART_STORAGE') as String;
        if (salvarCart.length > 0 && salvarCart.isNotEmpty) {
          final listCart = jsonDecode(salvarCart) as List<dynamic>;
          final listCartParsed = listCart.map((e) => CartModel.fromJson(e)).toList();
          if (listCartParsed.length > 0) {
            widget.cartStateController.cart.value = listCartParsed;
          }
        }
      } else {
        widget.cartStateController.cart.value =
            new List<CartModel>.empty(growable: true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(app: widget.app),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final FirebaseApp app;
  final viewModel = MainViewModelImp();
  final mainStateController = Get.put(MainStateController());

  MyHomePage({required this.app});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Restaurantes',
          style: GoogleFonts.jetBrainsMono(
              fontWeight: FontWeight.w900, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 10,
      ),
      body: FutureBuilder(
        future: viewModel.displayRestauranteList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(
              child: CircularProgressIndicator(),
            );
          else {
            var lst = snapshot.data as List<RestauranteModel>;
            return Container(
              margin: const EdgeInsets.only(top: 10),
              child: LiveList(
                showItemDuration: Duration(milliseconds: 100),
                showItemInterval: Duration(milliseconds: 100),
                reAnimateOnVisibility: true,
                scrollDirection: Axis.vertical,
                itemCount: lst.length,
                itemBuilder: animationItemBuilder((index) => InkWell(
                      onTap: () {
                        mainStateController.restauranteSelecionado.value =
                            lst[index];
                        Get.to(() => RestauranteHome());
                      },
                      child: Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height / 2.5 * 1.1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 250,
                              child: Card(
                                semanticContainer: true,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: CachedNetworkImage(
                                    imageUrl: lst[index].imageUrl,
                                    fit: BoxFit.cover,
                                    errorWidget: (context, url, err) => Center(
                                          child: Icon(Icons.image),
                                        ),
                                    progressIndicatorBuilder: (context, url,
                                            donwloadProgress) =>
                                        Center(
                                          child: CircularProgressIndicator(),
                                        )),
                              ),
                            ),
                            Card(
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                width: double.infinity,
                                child: Column(
                                  children: [
                                    Text(
                                      lst[index].nome,
                                      style: GoogleFonts.jetBrainsMono(
                                          fontWeight: FontWeight.w900),
                                    ),
                                    Text(
                                      lst[index].endereco,
                                      style: GoogleFonts.jetBrainsMono(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )),
              ),
            );
          }
        },
      ),
    );
  }
}
