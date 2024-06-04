import 'dart:convert';

import 'package:busha_mobile_test/handlers/_export_.dart';
import 'package:busha_mobile_test/models/api_response_model/crypto_transaction_list_model/crypto_transaction_model.dart';
import 'package:busha_mobile_test/models/api_response_model/tezos_block/tezos_block_response_model.dart';
import 'package:busha_mobile_test/presentations/custom_designs/__export__.dart';
import 'package:busha_mobile_test/presentations/custom_designs/custom_divider.dart';
import 'package:busha_mobile_test/presentations/custom_designs/dashboard_top_mover_card.dart';
import 'package:busha_mobile_test/presentations/routes/__export__.dart';
import 'package:busha_mobile_test/presentations/view_models/_default_viewmodel/dashboard_viewmodel.dart';
import 'package:busha_mobile_test/presentations/views/authenticated/dashboard/components/dashboard_section_title_widget.dart';
import 'package:busha_mobile_test/utils/_export_.dart';
import 'package:busha_mobile_test/utils/extension.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;

import '../../../../styles/_export_.dart';
import '../components/__export__.dart';

class ExplorePage extends StatefulHookConsumerWidget {
  const ExplorePage({super.key});

  @override
  ConsumerState<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends ConsumerState<ExplorePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // await ProviderScope.containerOf(context)
      //     .read(dashboardChangeNotifier)
      //     .getCryptoPriceList(executeWithIndicator: true);
      // ProviderScope.containerOf(context)
      //     .read(dashboardChangeNotifier)
      //     .getTopMovers();
    });
  }

  @override
  Widget build(BuildContext context) {
    final appColorExtension = Theme.of(context).extension<AppColorExtension>()!;
    final useDashBoardChangeNotifier = ref.watch(dashboardChangeNotifier);

    final showBalance = useState<bool>(false);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 1.sw,
                height: 44.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset('ic_scan'.svg),
                    Expanded(
                      child: Text(
                        'Explore'.tr(),
                        style: CustomStyle.textStyleRoobert.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: 18.sp,
                          color: appColorExtension.blackColor.withOpacity(0.95),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SvgPicture.asset('ic_search'.svg),
                    XMargin(16.w),
                    Stack(
                      children: [
                        Icon(
                          Icons.notifications_none_outlined,
                          size: 25,
                          color: appColorExtension.blackColor.withOpacity(0.95),
                        ),
                        Positioned(
                          right: 2,
                          top: 3,
                          child: Container(
                            width: 7.w,
                            height: 7.h,
                            decoration: BoxDecoration(
                                color: appColorExtension.error500,
                                shape: BoxShape.circle),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              YMargin(20.h),
              GestureDetector(
                onTap: () {
                  showBalance.value = !showBalance.value;
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'My balance'.tr(),
                        style: CustomStyle.textStyleRoobert.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                          color: appColorExtension.blackColor.withOpacity(0.60),
                        ),
                      ),
                      XMargin(4.w),
                      if (showBalance.value) ...[
                        SvgPicture.asset("ic_eye_open".svg)
                      ] else ...[
                        SvgPicture.asset("ic_eye_off".svg)
                      ]
                    ],
                  ),
                ),
              ),
              YMargin(8.h),
              showBalance.value
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 5.h),
                          child: Text(
                            '₦',
                            style: CustomStyle.textStyleInter.copyWith(
                              fontWeight: FontWeight.w700,
                              fontSize: 16.sp,
                              color: appColorExtension.blackColor
                                  .withOpacity(0.95),
                            ),
                          ),
                        ),
                        Text(
                          '5,000',
                          style: CustomStyle.textStyleRoobert.copyWith(
                            fontWeight: FontWeight.w700,
                            fontSize: 32.sp,
                            color:
                                appColorExtension.blackColor.withOpacity(0.95),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 5.h),
                          child: Text(
                            '00',
                            style: CustomStyle.textStyleRoobert.copyWith(
                              fontWeight: FontWeight.w700,
                              fontSize: 16.sp,
                              color: appColorExtension.blackColor
                                  .withOpacity(0.95),
                            ),
                          ),
                        ),
                      ],
                    )
                  : Text(
                      '*******',
                      style: CustomStyle.textStyleRoobert.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: 32.sp,
                        color: appColorExtension.blackColor.withOpacity(0.95),
                      ),
                    ),
            ],
          ),
        ),
        YMargin(16.h),
        const CustomHorizontalDivider(),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.only(top: 16.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 1.sw,
                  height: 0.6.sw,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DashBoardSectionTitleWidget(
                          titleLeft: 'My assets',
                          titleRight: 'See all',
                          onSeeAllTapped: () {},
                        ),
                        YMargin(16.5.h),
                        if (useDashBoardChangeNotifier
                            .cryptoTopMovers.isNotEmpty) ...[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: useDashBoardChangeNotifier.cryptoTopMovers
                                .asMap()
                                .keys
                                .map((index) {
                              if (useDashBoardChangeNotifier
                                      .cryptoTopMovers[index].id ==
                                  "solana") {
                                return const SizedBox.shrink();
                              }
                              return DashBoardAssetCard(
                                imgUrl: useDashBoardChangeNotifier
                                        .cryptoTopMovers[index].icon ??
                                    "",
                                cryptoAssetName: useDashBoardChangeNotifier
                                        .cryptoTopMovers[index].name ??
                                    '',
                                cryptoAssetCode: useDashBoardChangeNotifier
                                        .cryptoTopMovers[index].ticker ??
                                    '',
                                amount:
                                    '₦${Helper.formatCurrency((useDashBoardChangeNotifier.cryptoTopMovers[index].price ?? '').toString())}',
                                isUpwardTrend: (useDashBoardChangeNotifier
                                                .cryptoTopMovers[index]
                                                .change24h ??
                                            0) >
                                        0
                                    ? true
                                    : false,
                                onDashBoardAssetTapped: () {
                                  locator<AppRouter>().navigateNamed(
                                      Routes.transactionScreenRoute);
                                },
                                trendPercentage:
                                    '${useDashBoardChangeNotifier.cryptoTopMovers[index].change24h?.toStringAsFixed(2)}%',
                              );
                            }).toList(),
                          )
                        ] else ...[
                          DashBoardAssetCard(
                            imgUrl: 'ic_bitcoin',
                            cryptoAssetName: 'Bitcoin',
                            cryptoAssetCode: 'BTC',
                            amount: '₦24,500,00',
                            isUpwardTrend: true,
                            trendPercentage: '1.76%',
                            onDashBoardAssetTapped: () async {
                              locator<DialogHandler>()
                                  .showGlobalProgressIndicator();
                              String hash = await useDashBoardChangeNotifier
                                  .getblockChainBlockInfo(
                                executeWithIndicator: true,
                              );
                              if (hash.isNotEmpty) {
                                Future<Map<String, dynamic>> fetchData(
                                    String url) async {
                                  final response = await http.get(
                                    Uri.parse(url),
                                    headers: {
                                      'Content-Type': 'application/json',
                                    },
                                  );
                                  if (response.statusCode == 200) {
                                    final data = json.decode(response.body);
                                    return {'tx': data['tx']};
                                  } else {
                                    throw Exception('Failed to load data');
                                  }
                                }

                                try {
                                  Map<String, dynamic>? result = await compute(
                                      fetchData,
                                      "${dotenv.env['BASE_URL_BLOCK_CHAIN_INFO']!}/rawblock/$hash");
                                  if (result != null) {
                                    useDashBoardChangeNotifier
                                        .blockChainBlockInfoList = (result['tx']
                                            as List)
                                        .map((e) =>
                                            CryptoTransactionModel.fromJson(e))
                                        .toList();
                                    locator<DialogHandler>().dismissDialog();
                                    locator<AppRouter>().navigate(
                                        TransactionScreen(isTezos: false));
                                  }
                                } catch (e) {
                                  locator<DialogHandler>().dismissDialog();
                                  locator<DialogHandler>()
                                      .showCustomTopToastDialog(
                                          message: e.toString(),
                                          responseMessageType:
                                              ResponseMessageType.failure);
                                }
                              }
                            },
                          ),
                          DashBoardAssetCard(
                            imgUrl: 'ic_etherium',
                            cryptoAssetName: 'Ethereum',
                            cryptoAssetCode: 'ETH',
                            amount: '₦4,500',
                            isUpwardTrend: false,
                            trendPercentage: '6.76%',
                            onDashBoardAssetTapped: () {
                              locator<AppRouter>()
                                  .navigateNamed(Routes.transactionScreenRoute);
                            },
                          ),
                          DashBoardAssetCard(
                            imgUrl: 'ic_etherium',
                            cryptoAssetName: 'Tezos',
                            cryptoAssetCode: 'XTZ',
                            amount: '₦4,500',
                            isUpwardTrend: true,
                            trendPercentage: '9.06%',
                            onDashBoardAssetTapped: () async {
                              locator<DialogHandler>()
                                  .showGlobalProgressIndicator();
                              Future<Map<String, dynamic>> fetchData(
                                  String url) async {
                                final response = await http.get(
                                  Uri.parse(url),
                                  headers: {
                                    'Content-Type': 'application/json',
                                  },
                                );
                                if (response.statusCode == 200) {
                                  final data = json.decode(response.body);
                                  return {'tx': data};
                                } else {
                                  throw Exception('Failed to load data');
                                }
                              }

                              try {
                                Map<String, dynamic>? result = await compute(
                                    fetchData,
                                    "${dotenv.env['BASE_URL_TEZOS']!}/v1/blocks");
                                if (result != null) {
                                  useDashBoardChangeNotifier
                                      .tezosBlockChainBlockInfoList = (result[
                                          'tx'] as List)
                                      .map((e) =>
                                          TezosBlockResponseModel.fromJson(e))
                                      .toList();
                                  locator<DialogHandler>().dismissDialog();
                                  locator<AppRouter>().navigate(
                                      TransactionScreen(isTezos: true));
                                }
                              } catch (e) {
                                locator<DialogHandler>().dismissDialog();
                                locator<DialogHandler>()
                                    .showCustomTopToastDialog(
                                        message: e.toString(),
                                        responseMessageType:
                                            ResponseMessageType.failure);
                              }
                            },
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
                const CustomHorizontalDivider(),
                YMargin(16.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DashBoardSectionTitleWidget(
                        titleLeft: 'Today’s Top Movers',
                        titleRight: 'See all',
                        onSeeAllTapped: () {},
                      ),
                      YMargin(20.h),
                    ],
                  ),
                ),
                if (useDashBoardChangeNotifier.cryptoTopMovers.isNotEmpty) ...[
                  SizedBox(
                    width: 1.sw,
                    height: 150.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return DashBoardTopMoverCard(
                            imgUrl: useDashBoardChangeNotifier
                                    .cryptoTopMovers[index].icon ??
                                "",
                            cryptoAssetName: useDashBoardChangeNotifier
                                    .cryptoTopMovers[index].name ??
                                '',
                            trendPercentage:
                                '${useDashBoardChangeNotifier.cryptoTopMovers[index].change24h?.toStringAsFixed(2)}%',
                            isUpwardTrend: (useDashBoardChangeNotifier
                                            .cryptoTopMovers[index].change24h ??
                                        0) >
                                    0
                                ? true
                                : false);
                      },
                      itemCount:
                          useDashBoardChangeNotifier.cryptoTopMovers.length,
                      padding: EdgeInsets.only(left: 16.w),
                    ),
                  ),
                ] else ...[
                  SizedBox(
                    width: 1.sw,
                    height: 150.h,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      padding: EdgeInsets.only(left: 16.w),
                      children: const [
                        DashBoardTopMoverCard(
                            imgUrl: 'ic_etherium2',
                            cryptoAssetName: 'Ethereum',
                            trendPercentage: '1.76%',
                            isUpwardTrend: false),
                        DashBoardTopMoverCard(
                            imgUrl: 'ic_bitcoin',
                            cryptoAssetName: 'Bitcoin',
                            trendPercentage: '1.76%',
                            isUpwardTrend: true),
                        DashBoardTopMoverCard(
                            imgUrl: 'ic_solana',
                            cryptoAssetName: 'Solana',
                            trendPercentage: '1.76%',
                            isUpwardTrend: true),
                      ],
                    ),
                  ),
                ],
                YMargin(16.h),
                const CustomHorizontalDivider(),
                YMargin(16.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DashBoardSectionTitleWidget(
                        titleLeft: 'Trending news',
                        titleRight: 'View more',
                        onSeeAllTapped: () {},
                      ),
                      YMargin(16.5.h),
                      YMargin(16.h),
                      const CustomHorizontalDivider(),
                      YMargin(16.h),
                      const TrendingNewsCard(
                        imgUrl: 'elon_musk',
                        desc:
                            'Ethereum Co-founder opposes El-salvador Bitcoin Adoption policy',
                        fromTimeStamp: 'CoinDesk • 2h',
                      ),
                      YMargin(12.h),
                      const TrendingNewsListTile(
                        imgUrl: 'elon_musk',
                        description:
                            'Ethereum Co-founder opposes El-salvador Bitcoin Adoption policy',
                        fromTimeStamp: 'CoinDesk • 2h',
                      ),
                      const TrendingNewsListTile(
                        imgUrl: 'elon_musk',
                        description:
                            'Ethereum Co-founder opposes El-salvador Bitcoin Adoption policy',
                        fromTimeStamp: 'CoinDesk • 2h',
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
