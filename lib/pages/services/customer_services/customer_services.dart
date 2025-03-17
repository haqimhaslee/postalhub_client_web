import 'package:flutter/material.dart';
import 'package:postalhub_tracker/pages/services/customer_services/case_all.dart';
import 'package:postalhub_tracker/pages/services/customer_services/case_pending.dart';
import 'package:postalhub_tracker/pages/services/customer_services/case_solved.dart';

class CustomerServices extends StatelessWidget {
  const CustomerServices({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          label: const Text('Create case'),
          icon: const Icon(Icons.add),
        ),
        appBar: AppBar(
          title: const Text('Customer Service'),
          bottom: TabBar(
            dividerHeight: 0,
            splashBorderRadius: BorderRadius.circular(15),
            isScrollable: false,
            tabs: const [
              Tab(
                text: 'All',
              ),
              Tab(
                text: 'Active',
              ),
              Tab(
                text: 'Solved',
              ),
            ],
          ),
        ),
        body: const ClipRRect(
          child: TabBarView(
            children: [
              CaseAll(),
              CasePending(),
              CaseSolved(),
            ],
          ),
        ),
      ),
    );
  }
}
