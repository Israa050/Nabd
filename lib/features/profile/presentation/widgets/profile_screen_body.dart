
import 'package:flutter/material.dart';
import 'package:crypto_demo/features/profile/presentation/widgets/holdings_list.dart';
import 'package:crypto_demo/features/profile/presentation/widgets/holdings_widget.dart';
import 'package:crypto_demo/features/profile/presentation/widgets/month_selector.dart';
import 'package:crypto_demo/features/profile/presentation/widgets/profile_summary_card.dart';
import 'package:crypto_demo/features/profile/presentation/widgets/recent_transactions_widget.dart';
import 'package:crypto_demo/features/profile/presentation/widgets/statistics_overview_section.dart';
import 'package:crypto_demo/features/profile/presentation/widgets/transactions_list.dart';

class ProfileScreenBody extends StatelessWidget {
  const ProfileScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 30, 17, 30),
      child: CustomScrollView(
        slivers: [
      
          SliverToBoxAdapter(child: ProfileSummaryCard(),),
      
          SliverToBoxAdapter(child: SizedBox(height: 27,)),
      
          SliverToBoxAdapter(child: MonthSelector(),),

          SliverToBoxAdapter(child: SizedBox(height: 27,)),

          SliverToBoxAdapter(child: StatisticsOverviewSection(),),

          SliverToBoxAdapter(child: SizedBox(height: 27,)),

          SliverToBoxAdapter(child: HoldingsWidget(),),

          HoldingsList(),

          SliverToBoxAdapter(child: SizedBox(height: 27,)),

          SliverToBoxAdapter(child: RecentTransactionsWidget(),),

          TransactionsList(),
        ],
      ),
    );
  }
}