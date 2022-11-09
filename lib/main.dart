import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocation_practice/enum.dart';
import 'package:geolocation_practice/home/data_source/vworld_data_source.dart';
import 'package:geolocation_practice/home/home_cubit/home_cubit.dart';
import 'package:geolocation_practice/home/home_cubit/home_state.dart';
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
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.blue),
              borderRadius: BorderRadius.circular(10.0),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 8.0,
            ),
          ),
        ),
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
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit(
        vWorldDataSource: VWorldDataSource(),
      ),
      child: Builder(builder: (context) {
        return BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                foregroundColor: Colors.white,
                title: Text(widget.title),
              ),
              body: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      buildLocationExplanation(state),
                      buildAddressViewWidget(state),
                      const SizedBox(height: 30),
                      TextButton(
                        onPressed: () {
                          context.read<HomeCubit>().getLocation(locationTimeType: LocationTimeType.current);
                        },
                        child: Text(
                          "현재 위치 얻기",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      const SizedBox(width: 20.0),
                      TextButton(
                        onPressed: () {
                          context.read<HomeCubit>().getLocation(locationTimeType: LocationTimeType.last);
                        },
                        child: Text(
                          "최근에 얻었던 좌표 얻기",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      const SizedBox(width: 20.0),
                      TextButton(
                        onPressed: () {
                          context.read<HomeCubit>().changePositionToAddress();
                        },
                        child: Text(
                          "얻은 좌표를 주소로 바꾸기",
                          style: TextStyle(fontSize: 20),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }

  Widget buildAddressViewWidget(HomeState state) {

    if (state.coordinateToAddressModel != null) {
      return DefaultTextStyle(
        style: TextStyle(fontSize: 25.0, color: Colors.red),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Column(
            children: [
              Text("현재 당신의 주소는..\n"),
              Text("${state.coordinateToAddressModel!.text} 입니다."),
            ],
          ),
        ),
      );
    } else {
      return SizedBox.shrink();
    }
  }

  Widget buildLocationExplanation(HomeState state) {
    final headline5 = Theme.of(context).textTheme.headline5!;
    final headline6 = Theme.of(context).textTheme.headline6!;

    switch (state.locationStatus) {
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
                text: "현재 위치는.....\n\n",
                style: headline6.copyWith(color: Colors.cyan),
              ),
              TextSpan(
                text: "위도 : ${state.position!.latitude}\n경도 : ${state.position!.longitude}",
                style: headline5.copyWith(color: Colors.deepPurple),
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
}
