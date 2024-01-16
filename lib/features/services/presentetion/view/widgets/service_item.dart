import 'package:flutter/material.dart';

import '../../../../../core/app_image/app_image.dart';
import '../../../data/model/services_model.dart';

class ServiceItem extends StatelessWidget {
  final ServiceModel serviceModel;
  const ServiceItem({
    Key? key,
    required this.serviceModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 157,
      height: 100,
      margin: const EdgeInsets.only(left: 10),
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 5,
            spreadRadius: -5,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    serviceModel.mainImage,
                    height: 103,
                    width: 151,
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 7,
                  child: Container(
                    height: 26,
                    width: 55,
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                      child: Text(
                        '\$${serviceModel.price}',
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Text(
            serviceModel.title,
            textAlign: TextAlign.center,
            maxLines: 2,
            style: const TextStyle(
              fontSize: 12,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              Text(
                "(${serviceModel.averageRating})",
                style: const TextStyle(color: Colors.amber),
              ),
              const SizedBox(width: 10),
              Image.asset(
                AppImage.line,
                height: 20.0,
              ),
              const SizedBox(
                width: 7,
              ),
              Image.asset(
                AppImage.vector,
                height: 10.0,
              ),
              const SizedBox(
                width: 5,
              ),
              const Text('20'),
            ],
          )
        ],
      ),
    );
  }
}
