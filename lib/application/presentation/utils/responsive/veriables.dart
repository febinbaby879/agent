import 'package:flutter/material.dart';

double responsiveFontSizeForTitle(BoxConstraints constraints) {
  if (constraints.maxWidth > 1200) {
    return 18;
  } else if (constraints.maxWidth > 800) {
    return 16;
  } else if (constraints.maxWidth > 400) {
    return 14;
  } else {
    return 14;
  }
}

double getResponsiveFontSizeForDesCrip(BoxConstraints constraints) {
  if (constraints.maxWidth > 1200) {
    return 18;
  } else if (constraints.maxWidth > 800) {
    return 17;
  } else if (constraints.maxWidth > 400) {
    return 14;
  } else {
    return 12;
  }
}
