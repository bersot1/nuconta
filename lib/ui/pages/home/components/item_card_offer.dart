import 'package:flutter/material.dart';

import '../../../../data/models/models.dart';
import '../../../../ui/components/components.dart';

class ItemCardOffer extends StatelessWidget {
  final MediaQueryTools mediaQuery;
  final OfferModel offer;
  final Function()? func;

  const ItemCardOffer({
    required this.mediaQuery,
    // required this.urlImage,
    // required this.nameProduct,
    // required this.price,
    required this.offer,
    this.func,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: func,
      child: Column(
        children: [
          Hero(
            tag: offer.product.id,
            child: Container(
              width: mediaQuery.width(130),
              height: mediaQuery.height(130),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: NetworkImage(
                    offer.product.image,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: mediaQuery.width(130),
            child: Text(
              offer.product.name,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          Text(
            "R\$ ${offer.price}",
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
