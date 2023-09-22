library flutter_pkg;

import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';

class PacIdQrCode extends StatelessWidget {
  final String pacIdLink;
  final double size;
  const PacIdQrCode({super.key, required this.pacIdLink, required this.size});

  @override
  Widget build(BuildContext context) {
    var p = PacId.fromLink(pacIdLink);
    if (!p.verify()) {
      return const Text("PAC-ID not valid.");
    }
    return Column(
      children: [
        BarcodeWidget(
          barcode: Barcode.qrCode(), // Barcode type and settings
          data: pacIdLink, // Content
          height: size,
        ),
        const SizedBox(
          height: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Link: $pacIdLink"),
            Text("Issuer: ${p.issuer}"),
            Text("Category: ${p.category}"),
            Text("Identifer: ${p.identifier}"),
          ],
        ),
      ],
    );
  }
}

class PacId {
  String issuer = "";
  String category = "";
  String identifier = "";

  PacId({
    required this.issuer,
    required this.category,
    required this.identifier,
  });

  PacId.fromLink(String pacIdString) {
    // This constructor instantiates an instance of PacID by parsing a URI

    final s = pacIdString.split("/");
    if (s.length == 4) {
      if (s[0] == "https:" || s[0] == "http:") {
        final i = s[3].split("?i=");
        if (i.length == 2) {
          issuer = s[2];
          category = i[0];
          identifier = i[1];
          return;
        }
      }
    }
    issuer = "";
    category = "";
    identifier = "";
  }

  bool verify() {
    // This is just a simple verification; it should be extended
    // to implement the specs at: https://github.com/ApiniLabs/PAC-ID

    if (issuer == "") {
      return false;
    }
    if (category == "") {
      return false;
    }
    if (identifier == "") {
      return false;
    }
    return true;
  }

  @override
  String toString() {
    if (verify()) {
      return "https://$issuer/$category?i=$identifier";
    }
    return "not valid";
  }
}
