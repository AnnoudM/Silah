import 'dart:async';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';


final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({super.key, required this.child});

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
          color: const Color(0xFF2A497D),
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
      (data) async => const ParameterData();
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
  'Requests': ParameterData.none(),
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
  'ProfileDetails': (data) async => ParameterData(
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
  'EditDesc': (data) async => ParameterData(
        allParams: {
          'editDesc': getParameter<DocumentReference>(data, 'editDesc'),
        },
      ),
  'FamilyFunds': ParameterData.none(),
  'notificcc': (data) async => ParameterData(
        allParams: {
          'time': getParameter<bool>(data, 'time'),
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
  'giveAdminstrativeRole': ParameterData.none(),
  'comment': (data) async => ParameterData(
        allParams: {
          'postRef': getParameter<DocumentReference>(data, 'postRef'),
          'userRef': getParameter<DocumentReference>(data, 'userRef'),
          'replyRef': getParameter<DocumentReference>(data, 'replyRef'),
        },
      ),
  'postsCopy': (data) async => ParameterData(
        allParams: {
          'currentpage': getParameter<String>(data, 'currentpage'),
        },
      ),
  'analytics': ParameterData.none(),
  'Album': (data) async => ParameterData(
        allParams: {
          'currentpage': getParameter<String>(data, 'currentpage'),
        },
      ),
  'postsCopy2': (data) async => ParameterData(
        allParams: {
          'currentpage': getParameter<String>(data, 'currentpage'),
        },
      ),
  'Replied': (data) async => ParameterData(
        allParams: {
          'currentpage': getParameter<String>(data, 'currentpage'),
          'post': getParameter<DocumentReference>(data, 'post'),
          'userRef': getParameter<DocumentReference>(data, 'userRef'),
          'postUserRef': await getDocumentParameter<PostsRecord>(
              data, 'postUserRef', PostsRecord.fromSnapshot),
        },
      ),
  'notificationCenter': (data) async => ParameterData(
        allParams: {
          'time': getParameter<bool>(data, 'time'),
        },
      ),
  'giveAdminstrativeRoleCopy': ParameterData.none(),
  'NameAnalytics': ParameterData.none(),
  'analyticsCopy': ParameterData.none(),
  'RequestsCopy': ParameterData.none(),
  'RequestsCopy2': ParameterData.none(),
  'RepliedCopy': (data) async => ParameterData(
        allParams: {
          'currentpage': getParameter<String>(data, 'currentpage'),
          'post': getParameter<DocumentReference>(data, 'post'),
          'userRef': getParameter<DocumentReference>(data, 'userRef'),
          'postUserRef': await getDocumentParameter<PostsRecord>(
              data, 'postUserRef', PostsRecord.fromSnapshot),
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
