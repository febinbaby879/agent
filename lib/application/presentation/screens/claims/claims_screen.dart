import 'package:agent_dashboard/application/controller/claims.dart';
import 'package:agent_dashboard/application/presentation/utils/animations/hover_effect.dart';
import 'package:agent_dashboard/application/presentation/utils/colors.dart';
import 'package:agent_dashboard/application/presentation/utils/constants.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClaimsSection extends StatelessWidget {
  const ClaimsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ClaimsController>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kpurple400,
        title: const Text(
          'Claims',
          style: TextStyle(color: kWhite),
        ),
        centerTitle: false,
        actions: [
          Obx(() {
            if (controller.refreshing.value) {
              return Container(
                  margin: const EdgeInsets.only(right: 20),
                  height: 30,
                  width: 30,
                  child: const CircularProgressIndicator(color: kWhite));
            }
            return IconButton(
              icon: const Icon(Icons.refresh, color: kWhite),
              onPressed: () {
                controller.refreshClaims();
              },
            );
          }),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async{
          await controller.refreshClaims();
        },
        child: Column(
          children: [
            kHeight15,
            _claimsList(),
            kHeight10,
            _tabViewClaims(controller)
          ],
        ),
      ),
      floatingActionButton: HoverEffectWidget(
        child: FloatingActionButton.extended(
            backgroundColor: kpurple400,
            foregroundColor: kWhite,
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return _ClaimDialogeWidget(controller: controller);
                  });
            },
            label: const Text('Claim All')),
      ),
    );
  }

  Widget _claimsList() {
    return const FittedBox(
      fit: BoxFit.scaleDown,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            _ClaimsTileTop(
              count: '134',
              subTitle: 'Claims',
              title: 'Total Claims',
            ),
            kWidth10,
            _ClaimsTileTop(
              count: '58',
              subTitle: 'Claims',
              title: 'Pending Claims',
            ),
          ],
        ),
      ),
    );
  }

  Widget _tabViewClaims(ClaimsController controller) {
    return DefaultTabController(
        length: 3,
        child: Expanded(
          child: Column(
            children: [
              HoverEffectWidget(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: kpurple400!,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(23),
                    ),
                  ),
                  child: FadeIn(
                    animate: true,
                    child: TabBar(
                      indicatorPadding: const EdgeInsets.all(3),
                      dividerColor: Colors.transparent,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicator: BoxDecoration(
                        color: kpurple400,
                        // gradient: neonNewLinearGradient,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      // labelStyle: Theme.of(context)
                      //     .textTheme
                      //     .bodySmall
                      //     ?.copyWith(fontSize: 13.sp),
                      onTap: (index) {},
                      unselectedLabelColor: kBlack,
                      // labelStyle: Theme.of(context).textTheme.displaySmall,
                      labelColor: kWhite,
                      tabs: const [
                        Tab(
                          child: Text(
                            'Claimed',
                          ),
                        ),
                        Tab(
                          child: Text(
                            'UnClaimed',
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Pending',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              kHeight10,
              Expanded(
                child: TabBarView(
                  children: [
                    _buildListView(controller),
                    _buildListView(controller),
                    _buildListView(controller),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Widget _buildListView(ClaimsController controller) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return HoverEffectWidget(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Card(
              child: ListTile(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return _ClaimDialogeWidget(
                          controller: controller,
                          claimAll: false,
                        );
                      });
                },
                title: const Text('Student Name'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Country'),
                    Text(
                      '25000',
                      style: TextStyle(color: kpurple400),
                    )
                  ],
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 15,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _ClaimDialogeWidget extends StatelessWidget {
  const _ClaimDialogeWidget(
      {super.key, required this.controller, this.claimAll = true});

  final ClaimsController controller;
  final bool claimAll;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Apply for claim',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            kHeight20,
            const Text(
              'Apply for a claim. \nWe will initiate the payment after your claim request is approved.\nThe amount will be credited to your bank account.',
              style: TextStyle(),
            ),
            kHeight15,
            claimAll
                ? Text.rich(
                    TextSpan(
                      text: 'Total ',
                      style: const TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                          text: '58',
                          style: TextStyle(
                            fontSize: 18,
                            color: kpurple400,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const TextSpan(
                          text: ' claims pending',
                        ),
                      ],
                    ),
                  )
                : Text.rich(
                    TextSpan(
                      text: 'Student Name ',
                      style: const TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                          text: '100%',
                          style: TextStyle(
                            fontSize: 18,
                            color: kpurple400,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const TextSpan(
                          text: ' claim pending',
                        ),
                      ],
                    ),
                  ),
            kHeight15,
            Obx(
              () => ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: kpurple400, foregroundColor: kWhite),
                onPressed: () {
                  controller.applyClaim();
                },
                child: controller.applyClaimLoading.value
                    ? Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ShakeX(infinite: true, child: const Icon(Icons.send)),
                          const Text('  Submitting... ')
                        ],
                      )
                    : const Text(' Apply '),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _ClaimsTileTop extends StatelessWidget {
  const _ClaimsTileTop({
    super.key,
    required this.title,
    required this.count,
    required this.subTitle,
    this.onTap,
  });

  final String title;
  final String count;
  final String subTitle;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return HoverEffectWidget(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          decoration: BoxDecoration(
              color: kWhite,
              border: Border.all(color: kpurple400!),
              borderRadius: kRadius10,
              boxShadow: boxShadow3),
          child: Row(
            children: [
              Icon(
                Icons.attach_money_sharp,
                color: kpurple400,
                size: 35,
              ),
              Column(
                children: [
                  Text(
                    title,
                    style: const TextStyle(),
                  ),
                  Row(
                    children: [
                      Text(count, style: const TextStyle(fontSize: 30)),
                      kWidth5,
                      Text(subTitle),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
