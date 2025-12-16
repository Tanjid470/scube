import 'package:flutter/material.dart';
import 'package:scube/config/font_constant.dart';
import 'package:scube/core/const/color_utils.dart';
import 'package:scube/feature/scm_data_details/presentation/widget/multi_layer_circle.dart';
import 'package:scube/feature/scm_data_details/presentation/widget/revenue_sub_card.dart';
import 'package:scube/feature/scm_data_details/presentation/widget/semi_circle_progress_widget.dart';
import 'package:scube/feature/scm_data_details/presentation/widget/today_data_card.dart';
import 'package:scube/global/k_field.dart';
import 'package:scube/global/scm_appBar.dart';


class ScmDataDetailsView extends StatefulWidget {
  const ScmDataDetailsView({super.key});

  @override
  State<ScmDataDetailsView> createState() => _ScmDataDetailsViewState();
}

class _ScmDataDetailsViewState extends State<ScmDataDetailsView> with TickerProviderStateMixin {

  late TabController? _tabController;
  TabController? _subTabController;
  bool isOpen = false;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _subTabController = TabController(length: 2, vsync: this);
    _tabController?.addListener(() {
      setState(() {});
    });
    _subTabController?.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController?.dispose();
    _subTabController?.dispose();
    super.dispose();
  }

  final List<Map<String, dynamic>> dataList = [
    {
      "name": "Data A",
      "value": 2798.50,
      "percentage": 29.53,
      "cost": 35689,
      "color": Colors.red,
    },
    {
      "name": "Data B",
      "value": 72598.50,
      "percentage": 35.39,
      "cost": 5259689,
      "color": Colors.green,
    },
    {
      "name": "Data C",
      "value": 6598.36,
      "percentage": 83.90,
      "cost": 5698756,
      "color": Colors.orange,
    },
    {
      "name": "Data D",
      "value": 6598.26,
      "percentage": 36.59,
      "cost": 356987,
      "color": Colors.purple,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFD9E4F1),
      appBar: CustomAppBar(),
      body: DefaultTabController(
        length: 2,
        child: _body(),
      ),
    );
  }

  Widget _body() {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.06), // leave space for TabBar
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              border: Border(
                top: BorderSide(
                  color: ColorUtils.greyCustom,
                  width: 1.0,
                ),
              ),
            ),
            child: TabBarView(
              controller: _tabController,
                children: [
                  _dataViewTabView(),
                  _revenueViewTabView(),
                ]
            )
          ),
        ),
        _parentsTab()

      ],
    );
  }

  Widget _parentsTab(){
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.03,
      left: 20,
      right: 20,
      child: Container(
        padding: const EdgeInsets.all(2), // padding inside the capsule
        decoration: BoxDecoration(
            color: Colors.white, // background for unselected
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
                color: Colors.grey.shade400,
                width: 1.0)
        ),
        child: TabBar(
          controller: _tabController,
          labelColor: Colors.blue,
          unselectedLabelColor: Colors.grey.shade600,
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorColor: Colors.white,
          dividerColor: Colors.transparent,
          indicatorPadding: EdgeInsets.zero,
          indicator: BoxDecoration(
            color: Colors.white, // selected tab background
            borderRadius: BorderRadius.circular(16),
          ),
          tabs: [
            Tab(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ColoredCircle(color: _tabController?.index == 0 ? Colors.blue : Colors.grey),
                  const SizedBox(width: 6),
                  Text('Data View',
                      style: TextStyle(
                        color: _tabController?.index == 0 ? Colors.blue : Colors.grey,
                        fontSize: TextSize.font18(context),
                        fontWeight: _tabController?.index == 0 ? FontWeight.w700 : FontWeight.w400,
                      )
                  ),
                ],
              ),
            ),
            Tab(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ColoredCircle(color:  _tabController?.index == 1 ? Colors.blue : Colors.grey),
                  const SizedBox(width: 6),
                  Text('Revenue View',
                      style: TextStyle(
                        color: _tabController?.index == 1 ? Colors.blue : Colors.grey,
                        fontSize: TextSize.font18(context),
                        fontWeight: _tabController?.index == 1 ? FontWeight.w700 : FontWeight.w400,
                      )
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _dataViewTabView() {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          SizedBox(height: 60),
          SemiCircleProgress(
            value: 0.55,
            size: 140,
            unit: 'kWh/Sqft',
          ),
          TabBar(
            controller: _subTabController,
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.grey.shade600,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: Colors.white,
            dividerColor: Colors.transparent,
            indicatorPadding: EdgeInsets.zero,
            indicator: BoxDecoration(
              color: Colors.white, // selected tab background
              borderRadius: BorderRadius.circular(16),
            ),
            tabs: [
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ColoredCircle(color: _subTabController?.index == 0 ? Colors.blue : Colors.grey,size: 12),
                    const SizedBox(width: 6),
                    Text('Today Data',
                        style: TextStyle(
                          color: _subTabController?.index == 0 ? Colors.blue : Colors.grey,
                          fontSize: TextSize.font16(context),
                          fontWeight: _subTabController?.index == 0 ? FontWeight.w700 : FontWeight.w400,
                        )
                    ),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ColoredCircle(color:  _subTabController?.index == 1 ? Colors.blue : Colors.grey,size: 12),
                    const SizedBox(width: 6),
                    Text('Custom Date Data',
                        style: TextStyle(
                          color: _subTabController?.index == 1 ? Colors.blue : Colors.grey,
                          fontSize: TextSize.font16(context),
                          fontWeight: _subTabController?.index == 1 ? FontWeight.w700 : FontWeight.w400,
                        )
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _subTabController,
              children: [
                _todayDataTabView(),
                _customDateDataTabView(),
              ]
            )
          ),
        ],
      ),
    );
  }

  Widget _todayDataTabView() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(10)
              ),
              border: Border.all(color: ColorUtils.greyColor,strokeAlign: 1)
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Energy Chart',
                        style: TextStyle(fontWeight: FontWeight.bold,
                            fontSize: TextSize.font18(context),
                            color: Colors.black87),
                      ), Text(
                        '5.53 kw',
                        style: TextStyle(fontWeight: FontWeight.bold,
                            fontSize: TextSize.font28(context),
                            color: Colors.black87),
                      ),
                    ],
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: dataList.length,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    return TodayDataCard(item: dataList[index]);
                  },
                ),

          ]
            ),
          ),
        ],
      ),
    );
  }

  Widget _customDateDataTabView() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              spacing: 5,
              children: [
                Expanded(
                  child: KField(
                    hideHeadline: true,
                    hintText: 'From Date',
                    errorText: '',
                    onTap: null,
                    noPrefix: true,
                    datePicker: true,
                    readOnly: true,
                    suffix: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Icon(Icons.calendar_today_outlined,color: ColorUtils.black54),
                    ),
                  ),
                ),
                Expanded(
                  child: KField(
                    hideHeadline: true,
                    hintText: 'To Date',
                    errorText: '',
                    onTap: null,
                    noPrefix: true,
                    datePicker: true,
                    readOnly: true,
                    suffix: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Icon(Icons.calendar_today_outlined,color: ColorUtils.black54),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 11),
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.1),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10)
                    ),
                    border:Border.all(color: ColorUtils.baseColor)
                  ),
                  child: Icon(Icons.search_outlined,color: ColorUtils.baseColor),
                )
              ],
            ),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 5),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                      Radius.circular(10)
                  ),
                  border: Border.all(color: ColorUtils.greyColor,strokeAlign: 1)
              ),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Energy Chart',
                            style: TextStyle(fontWeight: FontWeight.bold,
                                fontSize: TextSize.font18(context),
                                color: Colors.black87),
                          ), Text(
                            '20.05 kw',
                            style: TextStyle(fontWeight: FontWeight.bold,
                                fontSize: TextSize.font28(context),
                                color: Colors.black87),
                          ),
                        ],
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: dataList.length,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        return TodayDataCard(item: dataList[index]);
                      },
                    ),
        
                  ]
              ),
            ),
            SizedBox(height: 15),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 5),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                      Radius.circular(10)
                  ),
                  border: Border.all(color: ColorUtils.greyColor,strokeAlign: 1)
              ),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Energy Chart',
                            style: TextStyle(fontWeight: FontWeight.bold,
                                fontSize: TextSize.font18(context),
                                color: Colors.black87),
                          ), Text(
                            '5.53 kw',
                            style: TextStyle(fontWeight: FontWeight.bold,
                                fontSize: TextSize.font28(context),
                                color: Colors.black87),
                          ),
                        ],
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: dataList.length,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        return TodayDataCard(item: dataList[index]);
                      },
                    ),
        
                  ]
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _revenueViewTabView() {
    return Column(
      children: [
        SizedBox(height: 60),
        SemiCircleProgress(
          value: 0.88,
          isValue: false,
          title: '8897455',
          size: 140,
          unit: 'tk',
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            decoration: BoxDecoration(
              border: Border.all(color: ColorUtils.greyCustom),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Theme(
              data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                collapsedBackgroundColor: Colors.white,
                collapsedIconColor: Colors.blue,
                onExpansionChanged: (v) {
                  setState(() => isOpen = v);
                },
                trailing: CircleAvatar(
                  radius: 12,
                  backgroundColor: Colors.blue,
                  child: Transform.rotate(
                    angle: isOpen ? 0 : 3.1416, // 0 = down, 180° = up
                    child: Transform.rotate(
                      angle: 1.5708, // 90° to make icon vertical
                      child: const Icon(
                        Icons.double_arrow_sharp,
                        size: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                title: Row(
                  children: [
                    Icon(Icons.bar_chart, size: 20),
                    SizedBox(width: 8),
                    Text('Data & Cost Info',style: TextStyle(fontWeight: FontWeight.w400,fontSize: TextSize.font16(context))),
                  ],
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      children: dataList
                          .asMap()
                          .entries
                          .map((entry) {
                        final index = entry.key;
                        final item = entry.value;
                        return RevenueSubCard(item: item, index: index+1);
                      })
                          .toList(),

                    ),
                  ),
                ],

              ),
            ),
          ),
        )


      ],
    );
  }


}
