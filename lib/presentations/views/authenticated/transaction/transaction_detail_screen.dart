import 'package:auto_route/auto_route.dart';
import 'package:busha_mobile_test/models/api_response_model/tezos_block/tezos_block_response_model.dart';
import 'package:busha_mobile_test/presentations/custom_designs/app_bar_widget.dart';
import 'package:busha_mobile_test/presentations/routes/__export__.dart';
import 'package:busha_mobile_test/presentations/styles/_export_.dart';
import 'package:busha_mobile_test/presentations/views/authenticated/transaction/components/__export__.dart';
import 'package:busha_mobile_test/utils/_export_.dart';
import 'package:busha_mobile_test/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../models/api_response_model/crypto_transaction_list_model/crypto_transaction_model.dart';
import '../../../custom_designs/__export__.dart';

@RoutePage(name: 'TransactionDetailScreen')
class TransactionDetailScreen extends StatelessWidget {
  const TransactionDetailScreen({
    super.key,
    this.cryptoTransactionModel,
    this.tezosBlockResponseModel,
  });

  final CryptoTransactionModel? cryptoTransactionModel;
  final TezosBlockResponseModel? tezosBlockResponseModel;
  @override
  Widget build(BuildContext context) {
    final appColorExtension = Theme.of(context).extension<AppColorExtension>()!;

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
              appBarTitle: 'Transaction details',
              onBackTap: () {
                locator<AppRouter>().back();
              },
            ),
            YMargin(24.h),
            if (cryptoTransactionModel != null) ...[
              TransactionDetailScreenCard(
                  description: cryptoTransactionModel!.hash ?? '',
                  label: 'Hash'),
              TransactionDetailScreenCard(
                  description:
                      (cryptoTransactionModel!.time ?? 0).formattedCryptoTime,
                  label: 'Time'),
              TransactionDetailScreenCard(
                  description: (cryptoTransactionModel!.size ?? 0).toString(),
                  label: 'Size'),
              TransactionDetailScreenCard(
                  description:
                      (cryptoTransactionModel!.blockIndex ?? 0).toString(),
                  label: 'Block index'),
              TransactionDetailScreenCard(
                  description:
                      (cryptoTransactionModel!.blockHeight ?? 0).toString(),
                  label: 'Height'),
              TransactionDetailScreenCard(
                  description:
                      (cryptoTransactionModel!.time ?? 0).formattedCryptoTime,
                  label: 'Received time'),
            ] else ...[
              TransactionDetailScreenCard(
                  description: tezosBlockResponseModel!.hash ?? '',
                  label: 'Hash'),
              TransactionDetailScreenCard(
                  description: tezosBlockResponseModel!.timestamp ?? "",
                  label: 'Time'),
              TransactionDetailScreenCard(
                  description: tezosBlockResponseModel!.level.toString(),
                  label: 'Level'),
              TransactionDetailScreenCard(
                  description:
                      (tezosBlockResponseModel!.reward ?? 0).toString(),
                  label: 'Reward'),
              TransactionDetailScreenCard(
                  description: (tezosBlockResponseModel!.bonus ?? 0).toString(),
                  label: 'Bonus'),
              TransactionDetailScreenCard(
                  description: (tezosBlockResponseModel!.fees ?? 0).toString(),
                  label: 'Fee'),
            ],
            YMargin(40.h),
            GestureDetector(
              onTap: () {
                if (tezosBlockResponseModel != null) {
                  locator<AppRouter>().navigate(NativeWebview(
                      initialUrl:
                          'https://tzkt.io/${tezosBlockResponseModel!.hash}'));
                } else {
                  locator<AppRouter>().navigate(NativeWebview(
                      initialUrl:
                          'https://blockchair.com/bitcoin/transaction/${cryptoTransactionModel!.hash}'));
                }
              },
              child: SizedBox(
                width: 1.sw,
                height: 56.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset('ic_view'.svg),
                    XMargin(16.w),
                    Expanded(
                      child: Text(
                        "View on blockchain explorer",
                        style: CustomStyle.textStyleInter.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 16.sp,
                          color: appColorExtension.blackColor.withOpacity(0.95),
                        ),
                      ),
                    ),
                    XMargin(16.w),
                    SvgPicture.asset('ic_arrow_right'.svg)
                  ],
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
