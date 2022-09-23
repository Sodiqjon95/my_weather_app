class Coord{

  Coord({required this.lon, required this.lat});
  double lon;
  double lat;


  factory Coord.fromJson(Map<String, dynamic> json) => Coord(
    lat: json['lat'] as double? ?? 0.0,
    lon:  json['lon'] as double? ?? 0.0,
  );

  Map<String, dynamic> toJson()=> {
    'lat': lat,
    'lon':lon,
  };


}