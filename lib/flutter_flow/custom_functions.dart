import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

double somarValores(List<FinanceiroRecord> financeiro) {
  // Add your function code here!
  double result = 0;

  for (FinanceiroRecord record in financeiro) {
    result += record.valor ?? 0;
  }

  return result;
}

double saldoEmConta(List<FinanceiroRecord> financeiro) {
  // Add your function code here!
  double entrada = 0;
  double saida = 0;

  for (FinanceiroRecord record in financeiro) {
    if (record.movimentacao == "Entrada") {
      entrada += record.valor ?? 0;
    } else {
      saida += record.valor ?? 0;
    }
  }

  return entrada - saida;
}
