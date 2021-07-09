import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../data/models/models.dart';

import '../../../../ui/components/components.dart';
import '../../../../ui/pages/home/components/components.dart';
import '../../../../ui/ui.dart';

class ListOferts extends StatelessWidget {
  final MediaQueryTools mediaQuery;

  final List<OfferModel> offers;

  ListOferts({required this.mediaQuery, required this.offers});

  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<IHomePresenter>(context);

    return Expanded(
      child: Container(
        child: GridView.builder(
          itemCount: offers.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 2.0,
            crossAxisSpacing: 2.0,
            childAspectRatio: 0.75,
          ),
          itemBuilder: (_, index) {
            var item = offers[index];
            return ItemCardOffer(
              mediaQuery: mediaQuery,
              // nameProduct: item.product.name,
              // price: item.price.toDouble(),
              // urlImage: item.product.image,
              offer: item,
              func: () =>
                  _configurandoModalBottomSheet(context, item, presenter),
            );
          },
        ),
      ),
    );
  }

  void _configurandoModalBottomSheet(
    BuildContext context,
    OfferModel offer,
    IHomePresenter presenter,
  ) {
    showModalBottomSheet(
      context: context,
      enableDrag: true,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (BuildContext bc) {
        return Container(
          height: MediaQuery.of(context).size.height / 1.8,
          child: InteractiveViewer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Container(
                    height: 10,
                    margin: EdgeInsets.only(top: 10),
                    width: MediaQuery.of(context).size.width / 2.2,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorLight,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Hero(
                    tag: offer.id,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                        offer.product.image,
                      ),
                      radius: 100.0,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    "${offer.product.name} - R\$ ${offer.price.toDouble()}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      offer.product.description,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: ElevatedButton(
                      onPressed: () async {
                        await presenter.buy(offer);
                        Navigator.pop(context);
                      },
                      child: Text("Aproveitar oferta".toUpperCase()),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
