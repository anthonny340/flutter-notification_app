import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:notification_app/firebase_options.dart';

part 'notifications_event.dart';
part 'notifications_state.dart';

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  NotificationsBloc() : super(NotificationsState()) {
    on<NotificationStatusChanged>(_notificationStatusChanged);

    //Verificar el estado de las notificaciones
    _initialStatusCheck();

    //Listener para notificaciones en Foreground
    _onForegroundMessage();
  }

  //Inicializar el FCM (Firebase Cloud Messagings)
  static Future<void> initilizedFCM() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  void _notificationStatusChanged(
    NotificationStatusChanged event,
    Emitter<NotificationsState> emit,
  ) {
    emit(state.copyWith(status: event.status));
    _getFCMToken();
  }

  //Metodo para inicializar todos los permisos dados previamente se lo llama en el constructor
  void _initialStatusCheck() async {
    final settings = await messaging.getNotificationSettings();
    add(NotificationStatusChanged(settings.authorizationStatus));
  }

  void _getFCMToken() async {
    final settings = await messaging.getNotificationSettings();
    if (settings.authorizationStatus != AuthorizationStatus.authorized) return;

    final String? token = await messaging.getToken();
    print(token);
  }

  void _handleRemoteMassage(RemoteMessage message) {
    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');

    if (message.notification == null) return;

    print('Message also contained a notificaction: ${message.notification}');
  }

  void _onForegroundMessage() {
    FirebaseMessaging.onMessage.listen(_handleRemoteMassage);
  }

  void requestPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: true,
      provisional: false,
      sound: true,
    );

    add(NotificationStatusChanged(settings.authorizationStatus));
    // settings.authorizationStatus;
  }
}
