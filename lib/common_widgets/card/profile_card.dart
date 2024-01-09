import 'package:cached_network_image/cached_network_image.dart';
import 'package:dataspot_machine_test/common_widgets/colors/colors.dart';
import 'package:dataspot_machine_test/common_widgets/text/text.dart';
import 'package:dataspot_machine_test/extensions/extension.dart';
import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final String image, email, name, mobileNumber, location;
  const ProfileCard(
      {super.key,
      required this.image,
      required this.email,
      required this.name,
      required this.mobileNumber,
      required this.location});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: const Color(0xFFF8F8F8),
            border: Border.all(color: greyColor, width: 1),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              15.0.spaceY,
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey, width: 1.0),
                ),
                child: ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: image,
                    fit: BoxFit.contain,
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.person),
                  ),
                ),
              ),
              10.0.spaceY,
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  height: size.height * 0.05,
                  width: size.width * 0.5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.blueGrey.withOpacity(0.2)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      commonText(name),
                      commonText(email, color: greyColor, fontSize: 12)
                    ],
                  ),
                ),
              ),
              8.0.spaceY,
              commonText(mobileNumber, color: greyColor, fontSize: 12),
              commonText(location, color: greyColor, fontSize: 12),
              15.0.spaceY,
              Container(
                height: 12,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                  color: Colors.red,
                  border: Border.all(color: greyColor, width: 1),
                ),
              ),
            ],
          )),
    );
  }
}
