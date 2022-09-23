import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:my_weather_app/presentation/weather_detaile_page.dart';
import 'package:my_weather_app/presentation/widgets/weathet_search_view.dart';
import 'package:my_weather_app/presentation/widgets/widgets_hourly.dart';
import 'package:my_weather_app/utils/styles.dart';
import '../api/models/current/currend_weather.dart';
import '../api/service/api_provider.dart';
import '../utils/my_colors.dart';

class TabBox extends StatefulWidget {
  const TabBox({Key? key, required this.lon, required this.lat}) : super(key: key);
  final double lon;
  final double lat;

  @override
  State<TabBox> createState() => _TabBoxState();
}

class _TabBoxState extends State<TabBox> {
  TextEditingController searchController = TextEditingController();

  DateFormat dateFormat = DateFormat.Hm();
  String searchText = "";
  late CurrentWeather currentWeather;
  bool isLoading = false;
  bool isError = false;

  @override
  void initState() {
    _init();
    super.initState();
  }

  void _init() async {
    isLoading = true;
    setState(() {});
    currentWeather = await ApiProvider.getOneCurrentWeatherByLatLong(
      latitude: widget.lat,
      longitude: widget.lon,
    );
    isLoading = false;
    setState(() {});
  }

  Future<void> _update({required String searchText}) async {
    isLoading = true;
    setState(() {});
    try {
      currentWeather = await ApiProvider.getOneCurrentWeatherByText(searchText: searchText);
      isError = false;
      isLoading = false;
      setState(() {});
    } catch (error) {
      isError = true;
      isLoading = false;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnnotatedRegion(
          value: const SystemUiOverlayStyle(statusBarColor: Color(0xFF356973), statusBarBrightness: Brightness.light, statusBarIconBrightness: Brightness.dark),
          child: isLoading
              ? SingleChildScrollView(
                  child: SafeArea(
                  child: Stack(children: [
                    Lottie.asset("assets/lottie/windy-weather.json"),
                    const Padding(
                      padding: EdgeInsets.only(top: 350, left: 180),
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    )
                  ]),
                ))
              : isError
                  ? SafeArea(child: Center(child: Text("ERROR", style: MyTextStyle.interMedium500.copyWith(fontSize: 40))))
                  : SingleChildScrollView(
                    child: SafeArea(
                        child: Stack(children: [
                          Lottie.asset("assets/lottie/windy-weather.json"),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              IconButton(
                                  onPressed: () async {
                                    searchController.text = await showSearch(
                                        context: context,
                                        delegate: WeatherSearchView(suggestionList: [
                                          "Tashkent",
                                          "Andijan",
                                          "Olmazor",
                                          "London",
                                          "Asaka",
                                          "Chust",
                                          "Fergana",
                                          "Samarkand",
                                          "Bukhara",
                                          "Moscow",
                                        ]));
                                    if (searchController.text.isNotEmpty) {
                                      _update(searchText: searchController.text);
                                    }
                                  },
                                  icon: const Icon(Icons.search,size: 35,)),
                              Center(
                                child: Text(
                                  currentWeather.name,
                                  style: MyTextStyle.interSemiBold600.copyWith(fontSize: 28, color: MyColors.white),
                                ),
                              ),
                              Center(
                                  child: Text(
                                dateFormat.format(
                                  DateTime.fromMillisecondsSinceEpoch(currentWeather.dt * 1000),
                                ),
                                style: MyTextStyle.interMedium500.copyWith(color: MyColors.white),
                              )),
                              Row(
                                children: [
                                  Image.network(
                                    "http://openweathermap.org/img/wn/${currentWeather.weather[0].icon}@2x.png",
                                    width: 200,
                                    height: 250,
                                    fit: BoxFit.cover,
                                  ),
                                  SizedBox(
                                      width: 100,
                                      child: Stack(children: [
                                        Column(
                                          children: [
                                            Text(
                                              (currentWeather.main.temp - 273.15).floor().toString(),
                                              style: MyTextStyle.interSemiBold600.copyWith(fontSize: 50, color: MyColors.white),
                                            ),
                                            Text(
                                              currentWeather.weather[0].description,
                                              style: MyTextStyle.interSemiBold600.copyWith(fontSize: 16, color: MyColors.white),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 95),
                                          child: Text(
                                            "C",
                                            style: MyTextStyle.interSemiBold600.copyWith(fontSize: 15, color: MyColors.white),
                                          ),
                                        )
                                      ])),
                                ],
                              ),
                              InfoWidget(image: "assets/images/img_1.png", text: "Rain Fall", text2: "${(currentWeather.main.humidity / 10).toString()} sm"),
                              InfoWidget(image: "assets/images/img.png", text: "Wind", text2: "${currentWeather.wind.speed} km/h"),
                              InfoWidget(image: "assets/images/img_2.png", text: "Humidity", text2: "${currentWeather.main.humidity} %")
                            ],
                          ),
                        ]),
                      ),
                  ),
        ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
            return WeatherDetailPage(
              lat: currentWeather.coord.lat,
              lon: currentWeather.coord.lon,
            );
          }));
        },
        label: const Text('More Info'),
        icon: const Icon(Icons.navigation_outlined),
        backgroundColor: Colors.deepPurpleAccent.withOpacity(0.5),
      ),
    );

  }


}
/*

 */