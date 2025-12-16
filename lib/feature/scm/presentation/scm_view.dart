import 'package:flutter/material.dart';
import 'package:scube/config/font_constant.dart';
import 'package:scube/core/const/color_utils.dart';
import 'package:scube/feature/scm/presentation/widget/bottom_action_card.dart';
import 'package:scube/feature/scm/presentation/widget/data_item_card.dart';
import 'package:scube/global/scm_appBar.dart';
import 'package:scube/route/app_pages.dart';


class SCMView extends StatefulWidget {
  const SCMView({super.key});

  @override
  State<SCMView> createState() => _SCMViewState();
}

class _SCMViewState extends State<SCMView> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  final ScrollController _scrollController = ScrollController();
  bool showSource = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  final List<Map<String, dynamic>> dataItems = [
    {
      'title': 'Data View',
      'active': true,
      'image': 'assets/icons/solar.png',
      'color': Colors.blue,
      'param1': 'PV',
      'data1': 55505.63,
      'data2': 58805.63,
    },
    {
      'title': 'Data Type 2',
      'active': true,
      'image': 'assets/icons/battery.png',
      'color': Colors.orange,
      'param1': 'Battery',
      'data1': 45210.20,
      'data2': 47890.10,
    },
    {
      'title': 'Data Type 3',
      'active': false,
      'image': 'assets/icons/power.png',
      'color': Colors.blue,
      'param1': 'Grid',
      'data1': 12000.00,
      'data2': 13500.50,
    },
    {
      'title': 'Data Type 4',
      'active': true,
      'image': 'assets/icons/solar.png',
      'color': Colors.orange,
      'param1': 'Load',
      'data1': 32000.75,
      'data2': 35000.40,
    },
    {
      'title': 'Data Type 5',
      'active': false,
      'image': 'assets/icons/power.png',
      'color': Colors.purple,
      'param1': 'Inverter',
      'data1': 21000.30,
      'data2': 22500.90,
    },
    {
      'title': 'Data Type 6',
      'active': true,
      'image': 'assets/icons/battery.png',
      'color': Colors.teal,
      'param1': 'Consumption',
      'data1': 60000.00,
      'data2': 64500.80,
    },
  ];

  final List<Map<String, dynamic>> bottomActions = [
    {
      'title': 'Analysis Pro',
      'icon': 'assets/icons/chart.png',
    },
    {
      'title': 'G. Generator',
      'icon': 'assets/icons/generator.png',
    },
    {
      'title': 'Plant Summery',
      'icon': 'assets/icons/charge.png',
    },
    {
      'title': 'Natural Gas',
      'icon': 'assets/icons/fire.png',
    },
    {
      'title': 'D. Generator',
      'icon': 'assets/icons/generator.png',
    },
    {
      'title': 'Water Process',
      'icon': 'assets/icons/faucet.png',
    },
    {
      'title': 'G. Generator',
      'icon': 'assets/icons/generator.png',
    },
    {
      'title': 'Plant Summery',
      'icon': 'assets/icons/charge.png',
    },
    {
      'title': 'Natural Gas',
      'icon': 'assets/icons/fire.png',
    },
    {
      'title': 'D. Generator',
      'icon': 'assets/icons/generator.png',
    },
    {
      'title': 'Water Process',
      'icon': 'assets/icons/faucet.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFD9E4F1),
      appBar: CustomAppBar(),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: _body()
      ),
    );
  }



  Widget _body() {
    return Column(
      children: [
        Expanded(
          flex: 7,
          child: DefaultTabController(
            length: 3,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(16)),
                border: Border.all(color: Colors.grey.shade400, width: 1),
              ),
              child: Column(
                children: [
                  // Top TabBar
                  TabBar(
                    controller: _tabController,
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.grey,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorPadding: EdgeInsetsGeometry.zero,
                    indicator: BoxDecoration(
                      color: ColorUtils.baseColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                    ),
                    tabs: const [
                      Tab(text: 'Summary'),
                      Tab(text: 'SLD'),
                      Tab(text: 'Data'),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                        children: [
                          _summaryTabView(),
                          _sldTabView(),
                          _dataTabView(),
                        ]
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.015),
        Expanded(
          flex: 2,
          child: GridView.builder(
            physics: const ScrollPhysics(),
            itemCount: bottomActions.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // 2 items per row
              crossAxisSpacing: 10,
              mainAxisSpacing: 8,
              childAspectRatio:4, // adjust for button height
            ),
            itemBuilder: (context, index) {
              final item = bottomActions[index];
              return BottomActionCard(
                title: item['title'],
                imagePath: item['icon'],
                onTap: (){
                  Navigator.pushNamed(context, RouteNames.noDataView);
                },
              );
            },
          ),
        )
        // Bottom Buttons
      ],
    );
  }

  Widget _summaryTabView() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
      child: Column(
        children: [

          Text(
            'Electricity',
            style: TextStyle(fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black54),
          ),
          Divider(
            color: ColorUtils.greyCustom,
            thickness: 1,
          ),

          SizedBox(
            height: MediaQuery
                .of(context)
                .size
                .height * 0.175,
            width: MediaQuery
                .of(context)
                .size
                .width * 0.175,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Transform.scale(
                  scale: 3,
                  child: CircularProgressIndicator(
                    value: 1,
                    strokeWidth: 5,
                    color: Color(0XFF398FC9),
                    backgroundColor: Colors.blue.shade100,
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text('Total Power', style: TextStyle(fontSize: 12)),
                    Text('5.53 kw',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                  ],
                ),
              ],
            ),
          ),

          Container(
            decoration: BoxDecoration(
              color: Color(0XFFD9E4F1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () => setState(() => showSource = true),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 6, horizontal: 45),
                    decoration: BoxDecoration(
                      color: showSource ? Colors.blue : Colors.transparent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'Source',
                      style: TextStyle(
                          color: showSource ? Colors.white : Colors.black54,
                          fontWeight: FontWeight.w500,
                          fontSize: TextSize.font16(context)),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => setState(() => showSource = false),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 6, horizontal: 45),
                    decoration: BoxDecoration(
                      color: !showSource ? Colors.blue : Colors.transparent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'Load',
                      style: TextStyle(
                          color: !showSource ? Colors.white : Colors.black54,
                          fontWeight: FontWeight.w500,
                          fontSize: TextSize.font16(context)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: ColorUtils.greyCustom,
            thickness: 2,
          ),

          Expanded(
            child: ScrollbarTheme(
              data: ScrollbarThemeData(
                thumbColor: MaterialStateProperty.all(ColorUtils.baseColor),
                thickness: MaterialStateProperty.all(5),
                radius: const Radius.circular(3),
                minThumbLength: 20,
                crossAxisMargin: -10,
                mainAxisMargin: 5,
                thumbVisibility: MaterialStateProperty.all(true),
              ),
              child: Scrollbar(
                controller: _scrollController,
                thumbVisibility: true,
                child: ListView.builder(
                  controller: _scrollController,
                  padding: const EdgeInsets.only(bottom: 20),
                  itemCount: dataItems.length,
                  itemBuilder: (context, index) {
                    return DataItemCard(item: dataItems[index]);
                  },
                ),
              ),
            ),
          )


        ],
      ),
    );
  }

  Widget _sldTabView() {
    return Center(child: Text('SLD', style: TextStyle(fontSize: 28)));
  }

  Widget _dataTabView() {
    return Center(child: Text('Data', style: TextStyle(fontSize: 28)));
  }
}
