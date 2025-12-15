import 'package:flutter/material.dart';
import 'package:scube/config/font_constant.dart';
import 'package:scube/core/const/color_utils.dart';
import 'package:scube/feature/scm_data_details/presentation/widget/multi_layer_circle.dart';
import 'package:scube/global/scm_appBar.dart';


class ScmDataDetailsView extends StatefulWidget {
  const ScmDataDetailsView({super.key});

  @override
  State<ScmDataDetailsView> createState() => _ScmDataDetailsViewState();
}

class _ScmDataDetailsViewState extends State<ScmDataDetailsView> with SingleTickerProviderStateMixin {
  late TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController?.addListener(() {
      setState(() {}); // rebuild to update icon color
    });
  }


  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

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
        // Main container with rounded top and top border
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
                  _dataViewTab(),
                  _revenueViewTab(),
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

  Widget _dataViewTab() {
    return Center(child: Text('Data View', style: TextStyle(fontSize: 28)));
  }

  Widget _revenueViewTab() {
    return Center(child: Text('Revenue View', style: TextStyle(fontSize: 28)));
  }


}
