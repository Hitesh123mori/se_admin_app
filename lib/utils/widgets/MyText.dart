import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

String MyText(
    final context, AsyncSnapshot<Map<String, dynamic>> snap, String key
    ) {
  if (snap.hasData) {
    try {
      return snap.data?[key];
    } catch (e) {
      return "$e";
    }
  } else if (snap.hasError) {
    return "Error";
  } else {
    return "Loading...";
  }
}
