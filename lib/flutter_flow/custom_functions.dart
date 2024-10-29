import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

String? concatenateStrings(
  String? str1,
  String? str2,
  String? str3,
  String? str4,
  String? str5,
) {
  return '${str1 ?? ''} ${str2 ?? ''} ${str3 ?? ''} ${str4 ?? ''} ${str5 ?? ''}'
      .trim();
}

String? newCustomFunction(DateTime? datePicked2) {
  if (datePicked2 == null) {
    return null; // Handle null case if no date is picked
  }

  // Get the current time
  DateTime currentTime = DateTime.now();

  // Compare dates (without time)
  bool isSameDate = datePicked2.year == currentTime.year &&
      datePicked2.month == currentTime.month &&
      datePicked2.day == currentTime.day;

  // If not the same date, return false
  if (!isSameDate) {
    return 'false';
  }

  // Now compare the time part only
  DateTime pickedTime = DateTime(
    currentTime.year,
    currentTime.month,
    currentTime.day,
    datePicked2.hour,
    datePicked2.minute,
    datePicked2.second,
  );

  // Compare times and return true if the picked time is earlier, false otherwise
  return pickedTime.isBefore(currentTime) ? 'true' : 'false';
}
