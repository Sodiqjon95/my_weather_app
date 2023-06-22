import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_weather_app/api/service/api_provider.dart';
import 'package:my_weather_app/presentation/widgets/widgets_one.dart';
import 'package:my_weather_app/utils/styles.dart';
import '../api/models/one_call/one_call_data.dart';

class WeatherDetailPage extends StatefulWidget {
  const WeatherDetailPage({Key? key, required this.lon, required this.lat}) : super(key: key);

  final double lon;
  final double lat;

  @override
  State<WeatherDetailPage> createState() => _WeatherDetailPageState();
}

class _WeatherDetailPageState extends State<WeatherDetailPage> {
  DateFormat dateFormat = DateFormat.Hm();
  DateFormat weekFormat2 = DateFormat.EEEE();
  late WeatherDetailPage weatherDetailPage;
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
    weatherDetailPage = (await ApiProvider.getOneCallWeatherByText(latitude: widget.lat, longitude: widget.lon)) as WeatherDetailPage;
    isLoading = false;
    isError = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF356973),
          title: Text(
            "Next 7 Days",
            style: MyTextStyle.interSemiBold600.copyWith(
              fontSize: 24,
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              FutureBuilder(
                future: ApiProvider.getOneCallWeatherByText(
                  longitude: widget.lon,
                  latitude: widget.lat,
                ),
                builder: (BuildContext context, AsyncSnapshot<OneCallData> snapshot) {
                  if (snapshot.hasData) {
                    var oneCallData = snapshot.data!;
                    return SafeArea(
                      child: Stack(children: [
                        Lottie.asset("assets/lottie/windy-weather.json"),
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              Positioned(
                                  child: OneWidget(
                                dateFormat: dateFormat,
                                dailySunRise: oneCallData.daily[0].sunrise,
                                dailySunSet: oneCallData.daily[0].sunset,
                                dailyTempNight: oneCallData.daily[0].temp.night,
                                hourlyMain: oneCallData.hourly[0].weather[0].main,
                                hourlyTemp: oneCallData.hourly[0].temp,
                                hourlyWeatherDis: oneCallData.hourly[0].weather[0].description,
                                timeZone: oneCallData.timezone,
                              )),
                              SizedBox(
                                height: 300,
                                child: ListView.builder(
                                    itemCount: oneCallData.daily.length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                          margin: EdgeInsets.all(10),
                                          padding: EdgeInsets.all(10),
                                          width: double.infinity,
                                          height: 60,
                                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(35), color: Colors.white.withOpacity(0.5)),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                weekFormat2.format(DateTime.fromMillisecondsSinceEpoch(oneCallData.daily[index].dt * 1000)).toString(),
                                                style: MyTextStyle.interMedium500.copyWith(fontSize: 18),
                                              ),
                                              Container(
                                                child: Row(
                                                  children: [
                                                    Text(oneCallData.daily[index].temp.day.floor().toString(), style: MyTextStyle.interMedium500.copyWith(fontSize: 18)),
                                                    Text(" C"),
                                                    Image.network(
                                                      "http://openweathermap.org/img/wn/${oneCallData.daily[index].weather[0].icon}@2x.png",
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ));
                                    }),
                              ),
                              SizedBox(
                                height: 150,
                                child: ListView.builder(
                                  
                                    scrollDirection: Axis.horizontal,
                                    itemCount: oneCallData.hourly.length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                          margin: EdgeInsets.all(10),
                                          padding: EdgeInsets.all(10),
                                          width: 60,
                                          // height: 120,
                                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white.withOpacity(0.5)),
                                          child: Column(
                                            children: [
                                              Text(dateFormat.format(DateTime.fromMillisecondsSinceEpoch(oneCallData.hourly[index].dt * 1000))),
                                              Image.network(
                                                "http://openweathermap.org/img/wn/${oneCallData.hourly[index].weather[0].icon}@2x.png",
                                              ),
                                              Row(
                                                children: [
                                                  Text(oneCallData.hourly[index].temp.floor().toString(), style: MyTextStyle.interMedium500.copyWith(fontSize: 20)),
                                                  const Text("C"),
                                                ],
                                              ),
                                            ],
                                          ));
                                    }),
                              ),
                            ],
                          ),
                        ),
                      ]),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  } else {
                    return Column(
                      children: [
                        Lottie.asset("assets/lottie/windy-weather.json"),
                        const Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        )
                      ],
                    );
                  }
                },
              ),
            ],
          ),
        ));
  }
}
