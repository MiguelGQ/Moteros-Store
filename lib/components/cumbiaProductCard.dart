import 'package:flutter/material.dart';
import 'package:votacion/model/models.dart';
import 'package:votacion/config/config.dart';
import 'package:flutter/cupertino.dart';

class CumbiaProductCard extends StatelessWidget {
  const CumbiaProductCard({
    @required this.borderColor,
    @required this.onPress,
  });

  final Color borderColor;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Container(
              height: MediaQuery.of(context).size.width * 0.3,
              width: MediaQuery.of(context).size.width * 0.3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    "product.imageUrl,",
                  ),
                  fit: BoxFit.fill,
                ),
                border: Border.all(
                  color: borderColor,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "",
                        style: Styles.precioProductos,
                      ),
                      Image.asset(
                        'images/emerald.png',
                        width: 25,
                        height: 25,
                        fit: BoxFit.cover,
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
