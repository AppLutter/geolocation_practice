import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocation_practice/enum.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          foregroundColor: Colors.white,
          sizeConstraints: BoxConstraints(
            minWidth: 150,
            minHeight: 150,
            maxHeight: 150,
            maxWidth: 150,
          ),
        ),
        indicatorColor: Colors.cyan,
      ),
      home: const MyHomePage(title: 'Geolocation 연습'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  LocationStatus locationStatus = LocationStatus.notExecute;
  Position? position;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text(widget.title),
      ),
      body: Center(child: buildLocationExplanation()),
      floatingActionButton: fab(),
    );
  }

  Widget buildLocationExplanation() {
    final headline5 = Theme.of(context).textTheme.headline5!;
    final headline6 = Theme.of(context).textTheme.headline6!;

    switch (locationStatus) {
      case LocationStatus.notExecute:
        return Text(
          '버튼을 눌러서 위치를 확인해보세요',
          style: headline5.copyWith(color: Colors.cyan),
        );
      case LocationStatus.unAuth:
        return Text(
          '위치 권한이 거부되었습니다.',
          style: headline5.copyWith(color: Colors.orange),
        );
      case LocationStatus.error:
        return Text(
          '위치를 불러오지 못했습니다.',
          style: headline5.copyWith(color: Colors.redAccent),
        );
      case LocationStatus.complete:
        return Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: "현재 위치는.....\n",
                style: headline6.copyWith(color: Colors.cyan),
              ),
              TextSpan(
                text: "위도 : ${position!.latitude}, 경도 : ${position!.longitude}",
                style: headline5.copyWith(color: Colors.deepPurple),
              ),
              TextSpan(
                text: " 입니다.",
                style: headline6.copyWith(color: Colors.cyan),
              ),
            ],
          ),
        );

      case LocationStatus.searching:
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            const SizedBox(height: 35.0),
            Text(
              '현재 위치를 불러오는 중 입니다.',
              style: headline5.copyWith(
                color: Colors.cyan.withOpacity(0.5),
              ),
            ),
          ],
        );
    }
  }

  Future<void> getLocation() async {
    try {
      setState(() {
        locationStatus = LocationStatus.searching;
      });

      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        setState(() {
          locationStatus = LocationStatus.unAuth;
        });
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          setState(() {
            locationStatus = LocationStatus.unAuth;
          });
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        setState(() {
          locationStatus = LocationStatus.unAuth;
        });
        return;
      }

      Position newPosition = await Geolocator.getCurrentPosition();
      setState(() {
        locationStatus = LocationStatus.complete;
        position = newPosition;
      });
    } catch (e) {
      setState(() {
        locationStatus = LocationStatus.error;
      });
    }
  }

  FloatingActionButton fab() {
    return FloatingActionButton(
      onPressed: () {
        getLocation();
      },
      child: Icon(
        CupertinoIcons.location_solid,
        size: 100,
      ),
    );
  }
}
