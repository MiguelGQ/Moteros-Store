import 'package:flutter/material.dart';
import 'package:votacion/model/models.dart';
import 'package:votacion/components/components.dart';
import 'package:votacion/config/config.dart';

class VotingScreen extends StatefulWidget {
  VotingScreen({@required this.user});

  final User user;

  @override
  State<VotingScreen> createState() => _VotingScreenState();
}

class _VotingScreenState extends State<VotingScreen> {
  List<Voted> lstVoted = [];

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    onInit();
    super.initState();
  }

  Future<void> onInit() async {
    //await _getMerchant();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.cumbiaSeller,
      appBar: AppBar(
        // Título centrado
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Tarjetones",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Palette.white,
          ),
        ),
        //color de fondo
        backgroundColor: Palette.cumbiaSeller,
        // Establecer la imagen de la pantalla frontal
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_outlined,
            color: Palette.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),

        // Coloca el icono detrás
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart_sharp),
            onPressed: () {
              // Navigator.push(
              //   context,
              //   CupertinoPageRoute(
              //     builder: (context) => Q1ShoppingCartScreen(),
              //   ),
              // );
            },
          ),
        ],
      ),
      body: Container(
        child: lstVoted.isNotEmpty
            ? Container(
                height: ((MediaQuery.of(context).size.width * 0.3) *
                        this.tamanoGrid(lstVoted)) +
                    10,
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: lstVoted.length < 6 ? lstVoted.length : 6,
                  itemBuilder: (BuildContext context, index) {
                    return GestureDetector(
                      onTap: () {},
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
                                  color: Palette.cumbiaCian,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  height: 40,
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
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
                  },
                ),
              )
            : Container(
                margin: EdgeInsets.all(20),
                child: Center(
                  child: Text(
                    "        Aún no hay Votados\nautorizados",
                    style: Styles.ulTransmision,
                  ),
                ),
              ),
      ),
    );
  }

  Future<void> _reload() async {
    //await _getLive();
  }

  // void getProducts() {
  //   allProducts.clear();
  //   LogMessage.get('PRODUCTS');
  //   References.products
  //       .where('uid', isEqualTo: widget.tienda.user.id)
  //       .get()
  //       .then((productDoc) {
  //     LogMessage.getSuccess('PRODUCTS');
  //     if (productDoc.docs.isNotEmpty) {
  //       productDoc.docs.forEach((product) {
  //         setState(() {
  //           allProducts.add(
  //             Product(
  //               id: product.id,
  //               idProduct: product.data()['idProduct'],
  //               uid: product.data()['uid'],
  //               mainProductId: product.data()['productInfo']['mainProductId'],
  //               imageUrl: product.data()['productInfo']['imageUrl'],
  //               productName: product.data()['productInfo']['productName'] ??
  //                   "No especifica",
  //               description: product.data()['productInfo']['description'] ??
  //                   "No especifica",
  //               reference:
  //                   product.data()['productInfo']['reference'] ?? "No especifica",
  //               isVariant: product.data()['productInfo']['isVariant'],
  //               height: product.data()['especifications']['height'] ??
  //                   "No especifica",
  //               large:
  //                   product.data()['especifications']['large'] ?? "No especifica",
  //               width:
  //                   product.data()['especifications']['width'] ?? "No especifica",
  //               weight: product.data()['especifications']['weight'] ??
  //                   "No especifica",
  //               color: product.data()['variantInfo']['color'] ?? "No especifica",
  //               dimension:
  //                   product.data()['variantInfo']['dimension'] ?? "No especifica",
  //               size: product.data()['variantInfo']['size'] ?? "No especifica",
  //               material:
  //                   product.data()['variantInfo']['material'] ?? "No especifica",
  //               style: product.data()['variantInfo']['style'] ?? "No especifica",
  //               avaliableUnits:
  //                   product.data()['avaliableUnits'] ?? "No especifica",
  //               price: product.data()['price'] ?? "No especifica",
  //               isSelected: product.data()['isSelected'],
  //               comission: product.data()['comission'],
  //               isFreeShipping: product.data()['isFreeShipping'] ?? false,
  //               isShipmentRequired: product.data()['isShipmentRequired'] ?? true,

  //               emeralds: product.data()['emeralds'] ?? 0,
  //               unitsCarrito: 1,
  //               unitsCheckout: 1,
  //             ),
  //           );
  //           products.clear();
  //           otherProducts.clear();
  //           getOtherProducts();
  //         });
  //       });
  //     }
  //   }).catchError((e) {
  //     LogMessage.getError('PRODUCTS', e);
  //   });
  // }

  double tamanoGrid(List<Voted> voted) {
    double cont = 0;
    for (var i = 0; i < voted.length; i++) {
      if (i % 2 == 0) {
        cont++;
      }
    }
    return cont;
  }
}
