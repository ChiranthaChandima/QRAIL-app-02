class StationRequest {
  final String id;
  final String stationName;

  StationRequest({
    required this.id,
    required this.stationName,
  });

  factory StationRequest.fromJson(Map<String, dynamic> json) {
    return StationRequest(
      id: json['station_id'],
      stationName: json['station_name'],
    );
  }

  Map<String, dynamic> toJson() => {
        'station_id': id,
        'station_name' :stationName
      };
}
