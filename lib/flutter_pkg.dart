library flutter_pkg;

class PacId {
  String issuer = "";
  String category = "";
  String identifier = "";

  PacId(this.issuer, this.category, this.identifier);

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
    issuer = "not valid";
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
