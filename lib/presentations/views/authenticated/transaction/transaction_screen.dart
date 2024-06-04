import 'package:auto_route/auto_route.dart';
import 'package:busha_mobile_test/presentations/custom_designs/app_bar_widget.dart';
import 'package:busha_mobile_test/presentations/routes/__export__.dart';
import 'package:busha_mobile_test/presentations/styles/_export_.dart';
import 'package:busha_mobile_test/presentations/view_models/_default_viewmodel/dashboard_viewmodel.dart';
import 'package:busha_mobile_test/utils/_export_.dart';
import 'package:busha_mobile_test/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../custom_designs/__export__.dart';
import 'components/__export__.dart';

@RoutePage(name: 'TransactionScreen')
class TransactionScreen extends StatefulHookConsumerWidget {
  const TransactionScreen({super.key, this.isTezos = false});
  final bool isTezos;
  @override
  ConsumerState<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends ConsumerState<TransactionScreen> {
  @override
  Widget build(BuildContext context) {
    final appColorExtension = Theme.of(context).extension<AppColorExtension>()!;
    final useDashBoardChangeNotifier = ref.watch(dashboardChangeNotifier);
    return BaseScaffold(
      includeHorizontalPadding: true,
      backgroundColor: appColorExtension.whiteColor,
      safeBottom: true,
      safeTop: true,
      builder: (size, icontext) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBarWidget(
              appBarTitle: 'BTC transactions',
              onBackTap: () {
                locator<AppRouter>().back();
              },
            ),
            if (widget.isTezos) ...[
              if (useDashBoardChangeNotifier
                  .tezosBlockChainBlockInfoList.isNotEmpty) ...[
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.only(top: 24.h),
                    itemBuilder: (context, index) {
                      return TransactionListTile(
                        walletAddress: useDashBoardChangeNotifier
                                .tezosBlockChainBlockInfoList[index].hash ??
                            '',
                        timeStamp: useDashBoardChangeNotifier
                                .tezosBlockChainBlockInfoList[index]
                                .timestamp ??
                            "",
                        onTransactionItemTapped: () {
                          locator<AppRouter>().navigate(TransactionDetailScreen(
                              tezosBlockResponseModel:
                                  useDashBoardChangeNotifier
                                      .tezosBlockChainBlockInfoList[index]));
                        },
                      );
                    },
                    itemCount: useDashBoardChangeNotifier
                        .tezosBlockChainBlockInfoList.length,
                  ),
                )
              ] else ...[
                const Center(
                  child: Text("Transaction is empty"),
                )
              ],
            ] else ...[
              if (useDashBoardChangeNotifier
                  .blockChainBlockInfoList.isNotEmpty) ...[
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.only(top: 24.h),
                    itemBuilder: (context, index) {
                      return TransactionListTile(
                        walletAddress: useDashBoardChangeNotifier
                                .blockChainBlockInfoList[index].hash ??
                            '',
                        timeStamp: (useDashBoardChangeNotifier
                                    .blockChainBlockInfoList[index].time ??
                                0)
                            .formattedCryptoTime,
                        onTransactionItemTapped: () {
                          locator<AppRouter>().navigate(TransactionDetailScreen(
                              cryptoTransactionModel: useDashBoardChangeNotifier
                                  .blockChainBlockInfoList[index]));
                        },
                      );
                    },
                    itemCount: useDashBoardChangeNotifier
                        .blockChainBlockInfoList.length,
                  ),
                )
              ] else ...[
                const Center(
                  child: Text("Transaction is empty"),
                )
              ],
            ]
          ],
        );
      },
    );
  }
}
