import 'dart:math';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/number_symbols_data.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';

import '../../flutter_flow/flutter_flow_widgets.dart';
import '../cloud_functions/cloud_functions.dart';

const _isProd = false;

// Stripe Credentials
const _kProdStripePublishableKey = '';
const _kTestStripePublishableKey =
    'pk_test_51QCas4FRo7MOOlQdJabYEZY9Xm4WTpDKa7q6QVUM5om5pnxD513kkYyjoV8LodHXZJEqNsXpVuwj7pk4El9TxTyu00anjpegWp';
const _kAppleMerchantId = '';

String stripePublishableKey() =>
    _isProd ? _kProdStripePublishableKey : _kTestStripePublishableKey;
String merchantIdentifier() => isAndroid ? '' : _kAppleMerchantId;

Future initializeStripe() async {
  Stripe.publishableKey = stripePublishableKey();
  if (merchantIdentifier().isNotEmpty) {
    Stripe.merchantIdentifier = merchantIdentifier();
  }
  await Stripe.instance.applySettings();
}

class StripePaymentResponse {
  const StripePaymentResponse({this.paymentId, this.errorMessage});
  final String? paymentId;
  final String? errorMessage;
}

Future<StripePaymentResponse> processStripePayment(
  BuildContext context, {
  required num amount,
  required String currency,
  required String customerEmail,
  String customerName = '',
  String description = '',
  bool allowGooglePay = false,
  bool allowApplePay = false,
  ThemeMode themeStyle = ThemeMode.system,
  Color? buttonColor,
  Color? buttonTextColor,
}) async {
  try {
    const callName = _isProd ? 'initStripePayment' : 'initStripeTestPayment';
    final response = await makeCloudCall(
      callName,
      {
        'amount': amount.round(),
        'currency': currency,
        'email': customerEmail,
        'name': customerName,
        'description': description,
      },
    );
    final success = response['success'] ?? false;
    if (!success || !response.containsKey('paymentId')) {
      return StripePaymentResponse(
          errorMessage: response['error'] ?? 'Unknown error occurred');
    }

    /// For web, display a payment sheet with a credit card form.
    if (kIsWeb) {
      return showWebPaymentSheet(
        context,
        paymentId: response['paymentId'],
        paymentIntentSecret: response['paymentIntent'],
        amount: amount,
        currency: currency,
        description: description,
        buttonColor: buttonColor,
        buttonTextColor: buttonTextColor,
        themeStyle: themeStyle,
      );
    }

    /// For mobile, use the native Stripe payment sheet to pay.
    ///
    /// First, initialize payment using the Stripe payment sheet.
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: response['paymentIntent'],
        customerEphemeralKeySecret: response['ephemeralKey'],
        customerId: response['customer'],
        merchantDisplayName: 'Silah',
        googlePay: allowGooglePay
            ? PaymentSheetGooglePay(
                merchantCountryCode: 'US',
                currencyCode: currency,
                testEnv: !_isProd,
              )
            : null,
        applePay: isiOS && allowApplePay
            ? const PaymentSheetApplePay(
                merchantCountryCode: 'US',
              )
            : null,
        style: themeStyle,
        appearance: PaymentSheetAppearance(
          primaryButton: PaymentSheetPrimaryButtonAppearance(
            colors: PaymentSheetPrimaryButtonTheme(
              light: PaymentSheetPrimaryButtonThemeColors(
                background: buttonColor,
                text: buttonTextColor,
              ),
              dark: PaymentSheetPrimaryButtonThemeColors(
                background: buttonColor,
                text: buttonTextColor,
              ),
            ),
          ),
        ),
      ),
    );

    /// Then show the payment sheet and confirm payment.
    await Stripe.instance.presentPaymentSheet();

    /// Finally, return the completed payment id to for record keeping.
    return StripePaymentResponse(paymentId: response['paymentId']);
  } catch (e) {
    if (e is StripeException && e.error.code == FailureCode.Canceled) {
      return const StripePaymentResponse();
    }
    return StripePaymentResponse(errorMessage: '$e');
  }
}

Future<StripePaymentResponse> showWebPaymentSheet(
  BuildContext context, {
  required String paymentId,
  required String paymentIntentSecret,
  required num amount,
  required String currency,
  required String description,
  Color? buttonColor,
  Color? buttonTextColor,
  ThemeMode? themeStyle,
}) async {
  final isDarkMode = themeStyle == null
      ? Theme.of(context).brightness == Brightness.dark
      : themeStyle == ThemeMode.dark;
  buttonColor = buttonColor ?? FlutterFlowTheme.of(context).primary;
  final screenWidth = MediaQuery.sizeOf(context).width;

  buildPaymentSheet(BuildContext context, double width) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Material(
              color: Colors.transparent,
              child: Container(
                width: width,
                padding: const EdgeInsets.fromLTRB(24.0, 14.0, 24.0, 24.0),
                color: isDarkMode ? const Color(0xFF101213) : Colors.white,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Payment Information',
                                style: GoogleFonts.outfit(
                                  color: isDarkMode
                                      ? Colors.white
                                      : const Color(0xFF101213),
                                  fontSize: 28,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () => Navigator.pop(context),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Icon(
                                  Icons.close_rounded,
                                  size: 22,
                                  color: isDarkMode
                                      ? const Color(0xFF95A1AC)
                                      : const Color(0xFF57636C),
                                ),
                              ),
                            ),
                          ],
                        ),
                        if (description.isNotEmpty) ...[
                          const SizedBox(height: 8.0),
                          Text(
                            description,
                            style: GoogleFonts.outfit(
                              color: isDarkMode
                                  ? const Color(0xFF95A1AC)
                                  : const Color(0xFF57636C),
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    CardField(
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: buttonColor!,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: isDarkMode
                                ? const Color(0xFF22282F)
                                : const Color(0xFFE0E3E7),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        fillColor: const Color(0xFFF1F4F8),
                        filled: isDarkMode,
                      ),
                      style: GoogleFonts.outfit(
                        color: isDarkMode ? Colors.white : const Color(0xFF101213),
                        fontSize: 14,
                      ),
                      // enablePostalCode: true,
                    ),
                    const SizedBox(height: 20.0),
                    FFButtonWidget(
                      onPressed: () async {
                        try {
                          final response = await Stripe.instance.confirmPayment(
                            paymentIntentClientSecret: paymentIntentSecret,
                            data: const PaymentMethodParams.card(
                              paymentMethodData: PaymentMethodData(),
                            ),
                            options: const PaymentMethodOptions(),
                          );
                          if (response.status ==
                              PaymentIntentsStatus.Succeeded) {
                            Navigator.pop(
                              context,
                              StripePaymentResponse(paymentId: paymentId),
                            );
                          }
                        } catch (e) {
                          if (e is StripeException &&
                              e.error.code == FailureCode.Canceled) {
                            Navigator.pop(
                              context,
                              const StripePaymentResponse(),
                            );
                          }
                          Navigator.pop(
                            context,
                            StripePaymentResponse(errorMessage: '$e'),
                          );
                        }
                      },
                      text:
                          'Pay ${_displayAmount(currency, amount.toDouble())}',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 44,
                        color: buttonColor,
                        textStyle: GoogleFonts.outfit(
                          color: buttonTextColor ?? Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                        elevation: 2,
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );

  final response = await showDialog<StripePaymentResponse>(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: Colors.transparent,
      contentPadding: EdgeInsets.zero,
      content: buildPaymentSheet(context, min(420, screenWidth - 16)),
    ),
  );
  // Return the payment response, or an empty response if the user canceled.
  return response ?? const StripePaymentResponse();
}

String _displayAmount(String currency, double amount) {
  final digitFractions = currencyFractionDigits[currency.toUpperCase()] ?? 2;
  amount /= pow(10, digitFractions);
  return NumberFormat.simpleCurrency(name: currency).format(amount);
}
