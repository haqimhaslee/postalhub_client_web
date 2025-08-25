import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:postalhub_tracker/src/wip_page/not_avail_web.dart';
import 'package:postalhub_tracker/src/wip_page/work_in_progress.dart';

class CasePlatformIdentifier extends StatelessWidget {
  const CasePlatformIdentifier({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: kIsWeb ? NotAvailWeb() : WorkInProgressBody(),
    );
  }
}
