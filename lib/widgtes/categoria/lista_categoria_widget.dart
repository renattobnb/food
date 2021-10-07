import 'package:appfood/const/const.dart';
import 'package:appfood/model/categoria_model.dart';
import 'package:appfood/widgtes/common/common_widgets.dart';
import 'package:auto_animated/auto_animated.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListaCategoriaWidget extends StatelessWidget {
  final List<CategoriaModel> lst;

  const ListaCategoriaWidget(this.lst);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: LiveGrid(
          showItemInterval: Duration(milliseconds: 100),
          showItemDuration: Duration(milliseconds: 100),
          reAnimateOnVisibility: true,
          scrollDirection: Axis.vertical,
          itemCount: lst.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 1, mainAxisSpacing: 1),
          itemBuilder: animationItemBuilder((index) => InkWell(
                onTap: () {},
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      CachedNetworkImage(
                        imageUrl: lst[index].imagem,
                        fit: BoxFit.cover,
                        errorWidget: (context, url, err) => Center(
                          child: Icon(Icons.image),
                        ),
                        progressIndicatorBuilder:
                            (context, url, donwloadProgress) => Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                      Container(
                        color: Color(COLOR_OVERLAY),
                      ),
                      Center(
                        child: Text(
                          '${lst[index].nome}',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.jetBrainsMono(
                              color: Colors.white, fontSize: 18),
                        ),
                      )
                    ],
                  ),
                ),
              )),
        ))
      ],
    );
  }
}
