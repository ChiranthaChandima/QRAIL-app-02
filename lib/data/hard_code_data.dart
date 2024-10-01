import 'package:qrail_fp/data/schedule_data.dart';
import 'package:qrail_fp/screens/widgets/custom_selector.dart';

class HardCodedData {
  static late final List<ScheduleItem> _myScheduleList;
  static late final List<ScheduleItem> _availableTrains;
  //static late final List<TextFieldData> _routePageFieldsData;
  static late final List<CustomOptionSelectorData> _routePageRouteOptions;
  static late final List<CustomOptionSelectorData> _checkoutPagePaymentOptions;

  static List<ScheduleItem> get myScheduleData => _myScheduleList;
  static List<ScheduleItem> get availableTrains => _availableTrains;
  //static List<TextFieldData> get routePageFieldsData => _routePageFieldsData;
  static List<CustomOptionSelectorData> get routePageRouteOptions =>
      _routePageRouteOptions;
  static List<CustomOptionSelectorData> get checkoutPagePaymentOptions =>
      _checkoutPagePaymentOptions;

  static generateHardCodedData() {
    // _generateMyTrainss();
    // _generateAvailableTrainss();
    // _generateRoutePageFieldsData();
    _generateRoutePageRouteOptions();
    _generateCheckoutPagePaymentOptions();
  }

  // static _generateMyTrainss() => _myScheduleList = _generateTrainsData(
  //       DateTime.now().subtract(
  //         const Duration(days: 10),
  //       ),
  //     );

  // static List<ScheduleItem> _generateTrainsData(DateTime date) => List.generate(
  //       5,
  //       (index) => ScheduleItem(
  //         source: "CMB",
  //     sourceName: "Colombo",
  //     date: "March 01",
  //     destination: "KDY",
  //     destinationName: "Kandy",
  //     startTime: "07:30 AM",
  //     duration: "3h 35m",
  //     trainName: "Express",
  //     price: "1000.00LKR",
  //     trainClass: "First"
  //       ),
  //     );

  // static _generateAvailableTrainss() {
  //   final currentDate = DateTime.now();
  //   _availableTrains = List.generate(
  //     5,
  //     (index) => ScheduleItem(
  //       source: "KDY",
  //     sourceName: "Kandy",
  //     destination: "ELA",
  //     destinationName: "Ella",
  //     date: "March 20",
  //     startTime: "09:30 AM",
  //     duration: "6h 45m",
  //     trainName: "Hill Country Express",
  //     price: "1200.00",
  //     trainClass: "Observation"
  //     ),
  //   );
  // }

  static _generateRoutePageRouteOptions() => _routePageRouteOptions = [
        CustomOptionSelectorData(
          text: "One way",
          id: "0",
          leftBorder: false,
          topBorder: false,
        ),
        CustomOptionSelectorData(
          text: "Roundtrip",
          id: "1",
          topBorder: false,
        ),
        CustomOptionSelectorData(
          text: "Multiple",
          id: "2",
          topBorder: false,
          rightBorder: false,
        )
      ];

  static _generateCheckoutPagePaymentOptions() =>
      _checkoutPagePaymentOptions = [
        CustomOptionSelectorData(
          text: "iPay",
          id: "0",
          leftBorder: false,
          topBorder: false,
        ),
        CustomOptionSelectorData(
          text: "PayPal",
          id: "1",
          topBorder: false,
        ),
        CustomOptionSelectorData(
          text: "Wallet",
          id: "2",
          topBorder: false,
          rightBorder: false,
        )
      ];
}
