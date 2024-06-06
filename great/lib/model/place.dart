import 'dart:io';

class PlaceLocation {
  final double latitude;
  final double longitude;
  final String adddress;

  PlaceLocation({
    required this.latitude,
    required this.longitude,
    required this.adddress,
  });
}

class Place {
  final String id;
  final String title;
  final PlaceLocation location;
  final File image;
  Place({
    required this.id,
    required this.title,
    required this.location,
    required this.image,
  });
}
