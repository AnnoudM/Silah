import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../index.dart';
import '../../main.dart';

final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    safeSetState(() => _loading = true);
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      safeSetState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      handleOpenedPushNotification();
    });
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: Color(0xFF2A497D),
          child: Image.asset(
            'assets/images/Screenshot_2024-09-08_at_10.16.51_AM.jpeg',
            fit: BoxFit.contain,
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'initialPage': ParameterData.none(),
  'Login': ParameterData.none(),
  'PendingPage': (data) async => ParameterData(
        allParams: {
          'familyname': getParameter<String>(data, 'familyname'),
        },
      ),
  'recoverpassword': ParameterData.none(),
  'SignUpAdmin': ParameterData.none(),
  'SignUpMember': (data) async => ParameterData(
        allParams: {
          'email': getParameter<String>(data, 'email'),
        },
      ),
  'HomeUser': ParameterData.none(),
  'requestsCopyCopy': ParameterData.none(),
  'HomeAdmin': ParameterData.none(),
  'verification': (data) async => ParameterData(
        allParams: {
          'familyname': getParameter<String>(data, 'familyname'),
          'email': getParameter<String>(data, 'email'),
        },
      ),
  'loggedinPage': (data) async => ParameterData(
        allParams: {
          'familyname': getParameter<String>(data, 'familyname'),
        },
      ),
  'RejectPage': (data) async => ParameterData(
        allParams: {
          'familyname': getParameter<String>(data, 'familyname'),
        },
      ),
  'profilePage': ParameterData.none(),
  'posts': (data) async => ParameterData(
        allParams: {
          'currentpage': getParameter<String>(data, 'currentpage'),
        },
      ),
  'EventDetails': (data) async => ParameterData(
        allParams: {
          'event': await getDocumentParameter<EventsRecord>(
              data, 'event', EventsRecord.fromSnapshot),
        },
      ),
  'EventEdit': (data) async => ParameterData(
        allParams: {
          'eventEdit': getParameter<DocumentReference>(data, 'eventEdit'),
        },
      ),
  'DirectoryPage': (data) async => ParameterData(
        allParams: {
          'currentpage': getParameter<String>(data, 'currentpage'),
        },
      ),
  'ProfileDetailsCopy': (data) async => ParameterData(
        allParams: {
          'name': await getDocumentParameter<UsersRecord>(
              data, 'name', UsersRecord.fromSnapshot),
        },
      ),
  'CalenderPage': (data) async => ParameterData(
        allParams: {
          'famName': await getDocumentParameter<FamilyRecord>(
              data, 'famName', FamilyRecord.fromSnapshot),
          'currentPage': getParameter<String>(data, 'currentPage'),
        },
      ),
  'CalenderPageCopy': (data) async => ParameterData(
        allParams: {
          'famName': await getDocumentParameter<FamilyRecord>(
              data, 'famName', FamilyRecord.fromSnapshot),
          'currentPage': getParameter<String>(data, 'currentPage'),
        },
      ),
  'DirectoryPageCopy': (data) async => ParameterData(
        allParams: {
          'currentpage': getParameter<String>(data, 'currentpage'),
        },
      ),
  'DirectoryPageCopy2': (data) async => ParameterData(
        allParams: {
          'currentpage': getParameter<String>(data, 'currentpage'),
        },
      ),
  'EditDesc': (data) async => ParameterData(
        allParams: {
          'editDesc': getParameter<DocumentReference>(data, 'editDesc'),
        },
      ),
  'HomeUserCopy': ParameterData.none(),
  'FamilyFunds': ParameterData.none(),
  'notificationCenter': ParameterData.none(),
  'postWithNotification': (data) async => ParameterData(
        allParams: {
          'currentpage': getParameter<String>(data, 'currentpage'),
          'notification': await getDocumentParameter<NotificationsRecord>(
              data, 'notification', NotificationsRecord.fromSnapshot),
        },
      ),
  'ChangePass': (data) async => ParameterData(
        allParams: {
          'userEdit': getParameter<DocumentReference>(data, 'userEdit'),
        },
      ),
  'EditProfile': (data) async => ParameterData(
        allParams: {
          'userEdit': getParameter<DocumentReference>(data, 'userEdit'),
        },
      ),
  'EventDetailsCopy': (data) async => ParameterData(
        allParams: {
          'event': await getDocumentParameter<EventsRecord>(
              data, 'event', EventsRecord.fromSnapshot),
        },
      ),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
