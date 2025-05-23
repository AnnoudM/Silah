import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';

import '/auth/base_auth_user_provider.dart';

import '/backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;
import '/index.dart';
import '/flutter_flow/flutter_flow_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) => appStateNotifier.loggedIn
          ? const LoggedinPageWidget()
          : const InitialPageWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.loggedIn
              ? const LoggedinPageWidget()
              : const InitialPageWidget(),
        ),
        FFRoute(
          name: 'initialPage',
          path: '/initialPage',
          builder: (context, params) => const InitialPageWidget(),
        ),
        FFRoute(
          name: 'Login',
          path: '/login',
          builder: (context, params) => const LoginWidget(),
        ),
        FFRoute(
          name: 'PendingPage',
          path: '/pendingPage',
          builder: (context, params) => PendingPageWidget(
            familyname: params.getParam(
              'familyname',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'recoverpassword',
          path: '/recoverpassword',
          builder: (context, params) => const RecoverpasswordWidget(),
        ),
        FFRoute(
          name: 'SignUpAdmin',
          path: '/signUpAdmin',
          builder: (context, params) => const SignUpAdminWidget(),
        ),
        FFRoute(
          name: 'SignUpMember',
          path: '/signUpMember',
          builder: (context, params) => SignUpMemberWidget(
            email: params.getParam(
              'email',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'HomeUser',
          path: '/homeUser',
          builder: (context, params) => const HomeUserWidget(),
        ),
        FFRoute(
          name: 'Requests',
          path: '/requests',
          builder: (context, params) => const RequestsWidget(),
        ),
        FFRoute(
          name: 'HomeAdmin',
          path: '/homeAdmin',
          builder: (context, params) => const HomeAdminWidget(),
        ),
        FFRoute(
          name: 'verification',
          path: '/verification',
          builder: (context, params) => VerificationWidget(
            familyname: params.getParam(
              'familyname',
              ParamType.String,
            ),
            email: params.getParam(
              'email',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'loggedinPage',
          path: '/loggedinPage',
          builder: (context, params) => LoggedinPageWidget(
            familyname: params.getParam(
              'familyname',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'RejectPage',
          path: '/rejectPage',
          builder: (context, params) => RejectPageWidget(
            familyname: params.getParam(
              'familyname',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'profilePage',
          path: '/profilePage',
          builder: (context, params) => const ProfilePageWidget(),
        ),
        FFRoute(
          name: 'posts',
          path: '/posts',
          builder: (context, params) => PostsWidget(
            currentpage: params.getParam(
              'currentpage',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'EventDetails',
          path: '/eventDetails',
          asyncParams: {
            'event': getDoc(['Events'], EventsRecord.fromSnapshot),
          },
          builder: (context, params) => EventDetailsWidget(
            event: params.getParam(
              'event',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'EventEdit',
          path: '/eventEdit',
          builder: (context, params) => EventEditWidget(
            eventEdit: params.getParam(
              'eventEdit',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Events'],
            ),
          ),
        ),
        FFRoute(
          name: 'DirectoryPage',
          path: '/directoryPage',
          builder: (context, params) => DirectoryPageWidget(
            currentpage: params.getParam(
              'currentpage',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'ProfileDetails',
          path: '/profileDetails',
          asyncParams: {
            'name': getDoc(['Users'], UsersRecord.fromSnapshot),
          },
          builder: (context, params) => ProfileDetailsWidget(
            name: params.getParam(
              'name',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'CalenderPage',
          path: '/calenderPage',
          asyncParams: {
            'famName': getDoc(['Family'], FamilyRecord.fromSnapshot),
          },
          builder: (context, params) => CalenderPageWidget(
            famName: params.getParam(
              'famName',
              ParamType.Document,
            ),
            currentPage: params.getParam(
              'currentPage',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'EditDesc',
          path: '/editDesc',
          builder: (context, params) => EditDescWidget(
            editDesc: params.getParam(
              'editDesc',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Family'],
            ),
          ),
        ),
        FFRoute(
          name: 'FamilyFunds',
          path: '/familyFunds',
          builder: (context, params) => const FamilyFundsWidget(),
        ),
        FFRoute(
          name: 'notificcc',
          path: '/notificcc',
          builder: (context, params) => NotificccWidget(
            time: params.getParam(
              'time',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: 'ChangePass',
          path: '/changePass',
          builder: (context, params) => ChangePassWidget(
            userEdit: params.getParam(
              'userEdit',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Users'],
            ),
          ),
        ),
        FFRoute(
          name: 'EditProfile',
          path: '/editProfile',
          builder: (context, params) => EditProfileWidget(
            userEdit: params.getParam(
              'userEdit',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Users'],
            ),
          ),
        ),
        FFRoute(
          name: 'giveAdminstrativeRole',
          path: '/giveAdminstrativeRole',
          builder: (context, params) => const GiveAdminstrativeRoleWidget(),
        ),
        FFRoute(
          name: 'comment',
          path: '/comment',
          builder: (context, params) => CommentWidget(
            postRef: params.getParam(
              'postRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Posts'],
            ),
            userRef: params.getParam(
              'userRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Users'],
            ),
            replyRef: params.getParam(
              'replyRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['reply'],
            ),
          ),
        ),
        FFRoute(
          name: 'postsCopy',
          path: '/postsCopy',
          builder: (context, params) => PostsCopyWidget(
            currentpage: params.getParam(
              'currentpage',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'analytics',
          path: '/analytics',
          builder: (context, params) => const AnalyticsWidget(),
        ),
        FFRoute(
          name: 'Album',
          path: '/album',
          builder: (context, params) => AlbumWidget(
            currentpage: params.getParam(
              'currentpage',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'postsCopy2',
          path: '/postsCopy2',
          builder: (context, params) => PostsCopy2Widget(
            currentpage: params.getParam(
              'currentpage',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'Replied',
          path: '/replied',
          asyncParams: {
            'postUserRef': getDoc(['Posts'], PostsRecord.fromSnapshot),
          },
          builder: (context, params) => RepliedWidget(
            currentpage: params.getParam(
              'currentpage',
              ParamType.String,
            ),
            post: params.getParam(
              'post',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Posts'],
            ),
            userRef: params.getParam(
              'userRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Users'],
            ),
            postUserRef: params.getParam(
              'postUserRef',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'notificationCenter',
          path: '/notificationCenter',
          builder: (context, params) => NotificationCenterWidget(
            time: params.getParam(
              'time',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: 'giveAdminstrativeRoleCopy',
          path: '/giveAdminstrativeRoleCopy',
          builder: (context, params) => const GiveAdminstrativeRoleCopyWidget(),
        ),
        FFRoute(
          name: 'NameAnalytics',
          path: '/nameAnalytics',
          builder: (context, params) => const NameAnalyticsWidget(),
        ),
        FFRoute(
          name: 'analyticsCopy',
          path: '/analyticsCopy',
          builder: (context, params) => const AnalyticsCopyWidget(),
        ),
        FFRoute(
          name: 'RequestsCopy',
          path: '/requestsCopy',
          builder: (context, params) => const RequestsCopyWidget(),
        ),
        FFRoute(
          name: 'RequestsCopy2',
          path: '/requestsCopy2',
          builder: (context, params) => const RequestsCopy2Widget(),
        ),
        FFRoute(
          name: 'RepliedCopy',
          path: '/repliedCopy',
          asyncParams: {
            'postUserRef': getDoc(['Posts'], PostsRecord.fromSnapshot),
          },
          builder: (context, params) => RepliedCopyWidget(
            currentpage: params.getParam(
              'currentpage',
              ParamType.String,
            ),
            post: params.getParam(
              'post',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Posts'],
            ),
            userRef: params.getParam(
              'userRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['Users'],
            ),
            postUserRef: params.getParam(
              'postUserRef',
              ParamType.Document,
            ),
          ),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/initialPage';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: const Color(0xFF2A497D),
                  child: Image.asset(
                    'assets/images/Screenshot_2024-09-08_at_10.16.51_AM.jpeg',
                    fit: BoxFit.contain,
                  ),
                )
              : PushNotificationsHandler(child: page);

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => const TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
