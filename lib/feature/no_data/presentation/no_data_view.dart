import 'package:flutter/material.dart';
import 'package:scube/config/font_constant.dart';
import 'package:scube/core/const/color_utils.dart';
import 'package:scube/global/scm_appBar.dart';


class NoDataView extends StatefulWidget {
  const NoDataView({super.key});

  @override
  State<NoDataView> createState() => _NoDataViewState();
}

class _NoDataViewState extends State<NoDataView>  {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFD9E4F1),
      appBar: CustomAppBar(),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: _body()
        ),
      ),
    );
  }

  Widget _body() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(16)),
        border: Border.all(color: Colors.grey.shade400, width: 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/no_data.png',
            width: MediaQuery.of(context).size.width * 0.6,
            fit: BoxFit.contain,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Text(
            'No data is here,',
            style: TextStyle(
              color: ColorUtils.black87,
              fontSize: TextSize.font16(context),
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            'please wait.',
            style: TextStyle(
              color: ColorUtils.black87,
              fontSize: TextSize.font16(context),
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

}
