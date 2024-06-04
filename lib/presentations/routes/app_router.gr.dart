// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:busha_mobile_test/models/api_response_model/crypto_transaction_list_model/crypto_transaction_model.dart'
    as _i8;
import 'package:busha_mobile_test/models/api_response_model/tezos_block/tezos_block_response_model.dart'
    as _i9;
import 'package:busha_mobile_test/presentations/views/authenticated/dashboard/dashboard_screen.dart'
    as _i3;
import 'package:busha_mobile_test/presentations/views/authenticated/dashboard/native_web_view.dart'
    as _i4;
import 'package:busha_mobile_test/presentations/views/authenticated/transaction/transaction_detail_screen.dart'
    as _i1;
import 'package:busha_mobile_test/presentations/views/authenticated/transaction/transaction_screen.dart'
    as _i2;
import 'package:busha_mobile_test/presentations/views/onboarding/login_screen.dart'
    as _i5;
import 'package:flutter/material.dart' as _i7;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    TransactionDetailScreen.name: (routeData) {
      final args = routeData.argsAs<TransactionDetailScreenArgs>(
          orElse: () => const TransactionDetailScreenArgs());
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.TransactionDetailScreen(
          key: args.key,
          cryptoTransactionModel: args.cryptoTransactionModel,
          tezosBlockResponseModel: args.tezosBlockResponseModel,
        ),
      );
    },
    TransactionScreen.name: (routeData) {
      final args = routeData.argsAs<TransactionScreenArgs>(
          orElse: () => const TransactionScreenArgs());
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.TransactionScreen(
          key: args.key,
          isTezos: args.isTezos,
        ),
      );
    },
    DashBoardScreen.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.DashBoardScreen(),
      );
    },
    NativeWebview.name: (routeData) {
      final args = routeData.argsAs<NativeWebviewArgs>();
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.NativeWebview(
          key: args.key,
          initialUrl: args.initialUrl,
        ),
      );
    },
    LoginScreen.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.LoginScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.TransactionDetailScreen]
class TransactionDetailScreen
    extends _i6.PageRouteInfo<TransactionDetailScreenArgs> {
  TransactionDetailScreen({
    _i7.Key? key,
    _i8.CryptoTransactionModel? cryptoTransactionModel,
    _i9.TezosBlockResponseModel? tezosBlockResponseModel,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          TransactionDetailScreen.name,
          args: TransactionDetailScreenArgs(
            key: key,
            cryptoTransactionModel: cryptoTransactionModel,
            tezosBlockResponseModel: tezosBlockResponseModel,
          ),
          initialChildren: children,
        );

  static const String name = 'TransactionDetailScreen';

  static const _i6.PageInfo<TransactionDetailScreenArgs> page =
      _i6.PageInfo<TransactionDetailScreenArgs>(name);
}

class TransactionDetailScreenArgs {
  const TransactionDetailScreenArgs({
    this.key,
    this.cryptoTransactionModel,
    this.tezosBlockResponseModel,
  });

  final _i7.Key? key;

  final _i8.CryptoTransactionModel? cryptoTransactionModel;

  final _i9.TezosBlockResponseModel? tezosBlockResponseModel;

  @override
  String toString() {
    return 'TransactionDetailScreenArgs{key: $key, cryptoTransactionModel: $cryptoTransactionModel, tezosBlockResponseModel: $tezosBlockResponseModel}';
  }
}

/// generated route for
/// [_i2.TransactionScreen]
class TransactionScreen extends _i6.PageRouteInfo<TransactionScreenArgs> {
  TransactionScreen({
    _i7.Key? key,
    bool isTezos = false,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          TransactionScreen.name,
          args: TransactionScreenArgs(
            key: key,
            isTezos: isTezos,
          ),
          initialChildren: children,
        );

  static const String name = 'TransactionScreen';

  static const _i6.PageInfo<TransactionScreenArgs> page =
      _i6.PageInfo<TransactionScreenArgs>(name);
}

class TransactionScreenArgs {
  const TransactionScreenArgs({
    this.key,
    this.isTezos = false,
  });

  final _i7.Key? key;

  final bool isTezos;

  @override
  String toString() {
    return 'TransactionScreenArgs{key: $key, isTezos: $isTezos}';
  }
}

/// generated route for
/// [_i3.DashBoardScreen]
class DashBoardScreen extends _i6.PageRouteInfo<void> {
  const DashBoardScreen({List<_i6.PageRouteInfo>? children})
      : super(
          DashBoardScreen.name,
          initialChildren: children,
        );

  static const String name = 'DashBoardScreen';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i4.NativeWebview]
class NativeWebview extends _i6.PageRouteInfo<NativeWebviewArgs> {
  NativeWebview({
    _i7.Key? key,
    required String initialUrl,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          NativeWebview.name,
          args: NativeWebviewArgs(
            key: key,
            initialUrl: initialUrl,
          ),
          initialChildren: children,
        );

  static const String name = 'NativeWebview';

  static const _i6.PageInfo<NativeWebviewArgs> page =
      _i6.PageInfo<NativeWebviewArgs>(name);
}

class NativeWebviewArgs {
  const NativeWebviewArgs({
    this.key,
    required this.initialUrl,
  });

  final _i7.Key? key;

  final String initialUrl;

  @override
  String toString() {
    return 'NativeWebviewArgs{key: $key, initialUrl: $initialUrl}';
  }
}

/// generated route for
/// [_i5.LoginScreen]
class LoginScreen extends _i6.PageRouteInfo<void> {
  const LoginScreen({List<_i6.PageRouteInfo>? children})
      : super(
          LoginScreen.name,
          initialChildren: children,
        );

  static const String name = 'LoginScreen';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}
