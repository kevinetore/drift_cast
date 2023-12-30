enum COUNTRY {
  belgium,
  netherlands,
}

extension ScreenTypeExt on COUNTRY {
  String get text {
    switch (this) {
      case COUNTRY.belgium:
        return "x";
      case COUNTRY.netherlands:
        return "y";
    }
  }
}
