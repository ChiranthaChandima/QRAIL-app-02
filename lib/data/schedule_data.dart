class ScheduleItem {
  final String source;
  final String sourceName;
  final String destination;
  final String destinationName;
  final String date;
  final String startTime;
  final String duration;
  final String trainName;
  final String price;
  final String trainClass;
  ScheduleItem(
      {required this.source,
      required this.sourceName,
      required this.destination,
      required this.destinationName,
      required this.date,
      required this.startTime,
      required this.duration,
      required this.trainName,
      required this.price,
      required this.trainClass});
}

List<ScheduleItem> scheduleList = [
  ScheduleItem(
      source: "CMB",
      sourceName: "Colombo",
      destination: "KDY",
      destinationName: "Kandy",
      date: "May 07",
      startTime: "07:30 AM",
      duration: "3h 35m",
      trainName: "Express",
      price: "1000.00LKR",
      trainClass: "First"),
  ScheduleItem(
      source: "GLE",
      sourceName: "Galle",
      destination: "MTA",
      destinationName: "Matara",
      date: "May 08",
      startTime: "08:45 AM",
      duration: "1h 15m",
      trainName: "Southern Express",
      price: "500.00",
      trainClass: "Second"),
  ScheduleItem(
      source: "CMB",
      sourceName: "Colombo",
      destination: "GLE",
      destinationName: "Galle",
      date: "May 10",
      startTime: "10:00 AM",
      duration: "2h 30m",
      trainName: "Coastal Express",
      price: "750.00",
      trainClass: "First"),
  ScheduleItem(
      source: "ANP",
      sourceName: "Anuradhapura",
      destination: "JAF",
      destinationName: "Jaffna",
      date: "May 25",
      startTime: "07:00 AM",
      duration: "3h 50m",
      trainName: "Northern Explorer",
      price: "950.00",
      trainClass: "First"),
  ScheduleItem(
      source: "KDY",
      sourceName: "Kandy",
      destination: "ELA",
      destinationName: "Ella",
      date: "March 20",
      startTime: "09:30 AM",
      duration: "6h 45m",
      trainName: "Hill Country Express",
      price: "1200.00",
      trainClass: "Observation")
];
