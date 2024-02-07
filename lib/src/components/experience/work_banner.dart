import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import '../../blocks/settings/settings_cubit.dart';
import '../../extensions/context.dart';
import '../../models/work_model.dart';

class WorkBanner extends StatelessWidget {
  const WorkBanner({
    super.key,
    required this.work,
  });

  final WorkModel work;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          formatName(context),
          style: context.textTheme.titleMedium,
        ),
        Text(
          work.position,
          style: context.textTheme.bodyMedium,
        ),
        Text(
          formatWorkPeriod(
            context,
            context.watch<SettingsCubit>().state.locale,
          ),
          style: context.textTheme.labelSmall,
        ),
        Text(
          formatLocation(context),
          style: context.textTheme.labelSmall,
        ),
      ],
    );
  }

  String formatWorkPeriod(BuildContext context, Locale locale) {
    initializeDateFormatting(locale.languageCode);
    final DateFormat formatter = DateFormat.yMMM();
    final start = work.startDate;
    final end = work.endDate ?? DateTime.now();
    String startLabel = formatter.format(start);
    String endLabel = work.endDate == null
        ? context.strings.datePeriodPresent
        : formatter.format(end);
    int months = end.month - start.month + 12 * (end.year - start.year);
    String yearsLabel = context.strings.datePeriodYears(months ~/ 12);
    String monthsLabel = context.strings.datePeriodMonths(months %= 12);
    String durationLabel = '$yearsLabel $monthsLabel'.trim();
    return '$startLabel - $endLabel · $durationLabel';
  }

  String formatLocation(BuildContext context) {
    final type = work.locationType;
    return type == null ? work.location : '${work.location} · ${type}';
  }

  String formatName(BuildContext context) {
    final type = work.type;
    return type == null ? work.name : '${work.name} · ${type}';
  }
}
