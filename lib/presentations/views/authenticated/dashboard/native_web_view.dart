import 'package:auto_route/auto_route.dart';
import 'package:busha_mobile_test/handlers/_export_.dart';
import 'package:busha_mobile_test/presentations/custom_designs/__export__.dart';
import 'package:busha_mobile_test/presentations/routes/__export__.dart';
import 'package:busha_mobile_test/presentations/styles/_export_.dart';
import 'package:busha_mobile_test/utils/_export_.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webview_flutter/webview_flutter.dart';

@RoutePage(name: "NativeWebview")
class NativeWebview extends StatefulWidget {
  final String initialUrl;

  const NativeWebview({Key? key, required this.initialUrl}) : super(key: key);

  @override
  _NativeWebviewState createState() => _NativeWebviewState();
}

class _NativeWebviewState extends State<NativeWebview> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appColorExtension = Theme.of(context).extension<AppColorExtension>()!;

    WebViewController controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(appColorExtension.whiteColor)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (started) {
            if (!locator<DialogHandler>().isDialogVisible()) {
              locator<DialogHandler>().showGlobalProgressIndicator();
            }
          },
          onPageFinished: (finishLoading) {
            if (locator<DialogHandler>().isDialogVisible()) {
              locator<DialogHandler>().dismissDialog();
            }
          },
          onProgress: (value) {
            if (value < 100) {
              if (!locator<DialogHandler>().isDialogVisible()) {
                locator<DialogHandler>().showGlobalProgressIndicator();
              }
            } else {
              if (locator<DialogHandler>().isDialogVisible()) {
                locator<DialogHandler>().dismissDialog();
              }
            }
          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(
        Uri.parse(widget.initialUrl),
      );
    return BaseScaffold(
      includeHorizontalPadding: false,
      onWillPop: () {
        locator<AppRouter>().back();
      },
      builder: (size, icontext) {
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 8.0.h,
                horizontal: 8.0.w,
              ),
              child: InkWell(
                onTap: () {
                  locator<AppRouter>().back();
                },
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(14.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: appColorExtension.whiteColor.withOpacity(0.95),
                      ),
                      child: const Icon(
                        Icons.arrow_back_outlined,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                height: size.height,
                width: size.width,
                child: WebViewWidget(
                  controller: controller,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
