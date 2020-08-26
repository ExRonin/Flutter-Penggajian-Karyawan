import 'package:flutter/material.dart';
import 'package:penggajian/screens/DetailGajiScreen.dart';
import './HomeScreen.dart';

class ListGajiScreenArguments {
  final listGaji;
  final jabatan;

  ListGajiScreenArguments(this.listGaji, this.jabatan);
}

class ListGajiScreen extends StatefulWidget {
  ListGajiScreen({Key key}) : super(key: key);
  static const routeName = '/gaji';
  @override
  _ListGajiScreenState createState() => _ListGajiScreenState();
}

class _ListGajiScreenState extends State<ListGajiScreen> {
  List<dynamic> data; 
  bool isReverse = false;

  ScrollController controller;
  List<String> items = new List.generate(100, (index) => 'Hello $index');

  @override
  void initState() {
    super.initState();
    controller = new ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    controller.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ListGajiScreenArguments args = ModalRoute.of(context).settings.arguments;
    data = args.listGaji;
    return Scaffold(
      appBar: AppBar(
        title: Text("Daftar Gaji"),
        actions: <Widget>[
          FlatButton.icon(
            icon: isReverse ? Icon(Icons.arrow_drop_up) : Icon(Icons.arrow_drop_down),
            textColor: Colors.white,
            label: Text("Sort ") ,
            onPressed: (){
            setState(() {
                isReverse= !isReverse;
              });
            },
          ),
        ],
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: ListView.builder(
          controller: controller,
          shrinkWrap: true,
          padding: const EdgeInsets.all(8),
          itemCount: args.listGaji.length,
          reverse: isReverse,
          itemBuilder: (BuildContext context, int index) {
            return ListDataButton(title: bulan(data[index]['bulan'].toString()) + ", " + data[index]['tahun'].toString(), data: ">>>", isDark: index % 2 == 0 ? true : false, arguments:  DetailGajiScreenArguments( data[index], args.jabatan ), route: DetailGajiScreen.routeName);
          }
        ),
      ),
    );
  }

  void _scrollListener() {
    print(controller.position.extentAfter);
    if (controller.position.extentAfter < 500) {
      setState(() {
        items.addAll(new List.generate(42, (index) => 'Inserted $index'));
      });
    }
  }
}
