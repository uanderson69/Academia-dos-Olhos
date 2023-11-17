import 'package:bic_ofic/pages/tela_inicial2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:timezone/timezone.dart';
import 'package:timezone/data/latest.dart' as tzdata;
import 'package:http/http.dart' as http;

class RotinasPage extends StatefulWidget {
  static const String routeName = '/rotinas';

  @override
  _RotinasPageState createState() => _RotinasPageState();
}

class _RotinasPageState extends State<RotinasPage> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  final _hourDayController = TextEditingController();
  final _hourNightController = TextEditingController();

  @override
  void initState() {
    super.initState();
    tzdata.initializeTimeZones();

    final settingsAndroid = AndroidInitializationSettings('app_icon');
    final initializationSettings =
        InitializationSettings(android: settingsAndroid);
    flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  TZDateTime _scheduleNotificationTime(int hour, int minute) {
    final now = TZDateTime.now(local);
    final scheduledTime =
        TZDateTime(local, now.year, now.month, now.day, hour, minute);
    if (scheduledTime.isBefore(now)) {
      scheduledTime.add(Duration(days: 1));
    }
    return scheduledTime;
  }

  Future<void> _scheduleNotification(
      int hour, int minute, String message) async {
    final scheduledTime = _scheduleNotificationTime(hour, minute);

    final androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'daily_notification',
      'Scheduled Notification',
      importance: Importance.high,
      channelShowBadge: false,
    );

    final notificationDetails = NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );

    await flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      'Atividade',
      message,
      scheduledTime,
      notificationDetails,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: true,
    );
  }

  Future<void> _saveHorarios(String hourDay, String hourNight) async {
    final response = await http.post(
      Uri.parse('http://localhost/api/rotinas.php'),
      body: {
        'hourDay': hourDay,
        'hourNight': hourNight,
      },
    );

    if (response.statusCode == 200) {
      Fluttertoast.showToast(
        msg: "Horários salvos com sucesso",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.green,
        textColor: Colors.white,
      );
      Navigator.pushNamed(context, TelaInicial2.routeName);
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Erro'),
            content: Text('Erro ao salvar os horários. Tente novamente.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rotinas"),
        backgroundColor: Color(0xFFD1A4F4),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/telinha.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _hourDayController,
                    decoration: InputDecoration(
                      labelText: 'Dia',
                      prefixIcon: Icon(Icons.wb_sunny),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _hourNightController,
                    decoration: InputDecoration(
                      labelText: 'Noite',
                      prefixIcon: Icon(Icons.nights_stay),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    final hourDay = _hourDayController.text;
                    final hourNight = _hourNightController.text;

                    if (hourDay.isNotEmpty && hourNight.isNotEmpty) {
                      _saveHorarios(hourDay, hourNight);
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Entrada Inválida'),
                            content: Text(
                                'Certifique-se de que os horários são válidos.'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFD1A4F4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    textStyle: TextStyle(fontSize: 16),
                  ),
                  child: Text('Salvar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
