import 'package:app_noti/services/news_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgest/lista_widget.dart';

class Tap1Screen extends StatefulWidget {
  const Tap1Screen({Key? key}) : super(key: key);

  @override
  State<Tap1Screen> createState() => _Tap1ScreenState();
}

class _Tap1ScreenState extends State<Tap1Screen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final headLines = Provider.of<NewService>(context).headLines;
    return Scaffold(
      body: headLines.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListaWidget(headLines),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
