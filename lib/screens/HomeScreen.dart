import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'DetailGajiScreen.dart';
import 'ListGajiScreen.dart';

String rp(int amount){
    FlutterMoneyFormatter fmf = new FlutterMoneyFormatter(
      amount: amount.toDouble(),
      settings: MoneyFormatterSettings(
          symbol: 'Rp',
          thousandSeparator: '.',
          decimalSeparator: ',',
          symbolAndNumberSeparator: ' ',
          fractionDigits: 2,
          compactFormatType: CompactFormatType.short
      )
    );

    return fmf.output.symbolOnLeft.toString();
  }

class ScreenArguments {
  final data;

  ScreenArguments(this.data);
}

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';
  HomeScreen({Key key, this.data}) : super(key: key);

  final data;
  // List<String> bulan = ["Januari", "Februari", "Maret", "April", "Mei", "Juni", "Juli", "Agustus", "September", "Oktober", "November", "Desember"];   
  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;
    var karyawan = args.data['data'];
    var listGaji = args.data['listGaji'];
    var jabatan = args.data['data']['jabatan'];
    final theme = Theme.of(context).copyWith(dividerColor: Colors.transparent);

    List<Widget> daftarGajiEnamBulan(List<dynamic> data){
      data.reversed;
      List<Widget> menuList = new List();
        for(int i = 0; i < 6 ; i++ ){
          menuList.add(ListDataButton(title: bulan(data[i]['bulan'].toString()) + ", " + data[i]['tahun'].toString(), data: ">>>", isDark: i % 2 == 0 ? true : false, arguments:  DetailGajiScreenArguments( listGaji[i], jabatan ), route: DetailGajiScreen.routeName ));
        }
        if(data.length > 6 ){
          menuList.add(ListDataButton(data: ">>>", title: "Lainnya", isDark: true, arguments:  ListGajiScreenArguments( listGaji, jabatan ), route: ListGajiScreen.routeName ));
        }
        return menuList;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Aplikasi Gaji Karyawan", style: TextStyle(fontFamily: "Open Sans", fontWeight: FontWeight.w700)),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Container(
              color: Colors.grey[100],
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(karyawan['nama_karyawan'], style: TextStyle(fontFamily: "Open Sans",fontSize: 25, fontWeight: FontWeight.w400),),
                    Padding(
                      padding: const EdgeInsets.only(top:2.0, bottom: 4.0),
                      child: Divider(color: Colors.grey, height: 1, thickness: 1,),
                    ),
                    Text(jabatan['nama_jabatan'], style: TextStyle(fontFamily: "Open Sans",fontSize: 15, fontWeight: FontWeight.w400),),
                  ],
                ),
              ),
            ),
          ),
          Theme(
            data: theme,
            child: ExpansionTile(
              title: Text("Biodata", style: TextStyle(fontFamily: "Open Sans")),
              children: <Widget>[
                ListData(data: karyawan['nama_karyawan'], title: "Nama", isDark: true),
                ListData(data: jabatan['nama_jabatan'], title: "Jabatan", isDark: false),
                ListData(data: karyawan['no_hp'], title: "No HP", isDark: true),
                ListData(data: karyawan['tmp_lahir'], title: "Tempat Lahir", isDark: false),
                ListData(data: karyawan['tgl_lahir'], title: "Tanggal Lahir", isDark: true),
                ListData(data: karyawan['jk'] == 1 ? "Laki - laki" : "Perempuan", title: "Jenis Kelamin", isDark: false),
                ListData(data: karyawan['status_nikah'] == 1 ? "Menikah" : "Belum Menikah", title: "Status", isDark: true),
                ListData(data: karyawan['jml_anak'].toString(), title: "Jumlah Anak", isDark: false),
                ListData(data: karyawan['alamat'], title: "Alamat", isDark: true),
                SizedBox(height: 10,),
              ],
            ),
          ),
          Theme(
            data: theme,
            child: ExpansionTile(
              title: Text("Informasi Jabatan", style: TextStyle(fontFamily: "Open Sans")),
              children: <Widget>[
                ListData(data: jabatanAkronim(jabatan['nama_jabatan']), title: "Jabatan", isDark: true),
                ListData(dataInt: jabatan['gaji_pokok'], title: "Gaji Pokok", isDark: false),
                ListData(dataInt: jabatan['upah_lembur'], title: "Upah Lembur", isDark: true),
                SizedBox(height: 10,),
              ],
            ),
          ),
          Theme(
            data: theme,
            child: ExpansionTile(
              title: Text("Daftar Gaji", style: TextStyle(fontFamily: "Open Sans")),
              children: daftarGajiEnamBulan(listGaji),
            ),
          ),
          SizedBox(height: 30,)
        ],
      ),
    );
  }
}

class ListData extends StatelessWidget {
  const ListData({Key key, this.title, this.dataInt, this.data, this.isDark}) : super(key: key);
  final String title; 
  final int dataInt;
  final bool isDark;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 0.5,
            color: Colors.grey[100],
          ),
          color: isDark ? Colors.grey[100] : Colors.grey[50],
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(flex: 2, child: Text(title, style: TextStyle(fontFamily: "Open Sans",),)),
                  Flexible(flex: 3, child: Text(data == null ? rp(dataInt) : data, textAlign: TextAlign.right, style: TextStyle(fontFamily: "Open Sans",))),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ListDataButton extends StatelessWidget {
  const ListDataButton({Key key, this.title, this.dataInt, this.data, this.isDark, this.arguments, this.route}) : super(key: key);
  final String title; 
  final int dataInt;
  final bool isDark;
  final String data;
  final route;
  final arguments;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 0.5,
            color: Colors.grey[100],
          ),
          color: isDark ? Colors.grey[100] : Colors.grey[50],
        ),
        child: FlatButton(
          onPressed:(){ 
            if(arguments != null && route != null){
              Navigator.pushNamed(
                context, 
                route,
                arguments: arguments
              );
            }
            else{
              print("hai");
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Flexible(flex: 3, child: Text(title, style: TextStyle(fontFamily: "Open Sans",),)),
                    Flexible(flex: 4, child: Text(data == null ? rp(dataInt) : data, textAlign: TextAlign.right, style: TextStyle(fontFamily: "Open Sans",))),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String jabatanAkronim(String a) {
  switch (a) {
    case "CEO":
      return "CEO (Chief Executive Officer)";
      break;
    case "CTO":
      return "CTO (Chief Technology Officer)";
      break;
    case "CFO":
      return "CFO (Chief Financial Officer)";
      break;
    case "CMO":
      return "CMO (Chief Marketing Officer)";
      break;
    case "COO":
      return "COO (Chief Operating Officer)";
      break;
    default:
      return a;
  }
}

String bulan(String a) {
  switch (a) {
    case "1":
      return "Januari";
      break;
    case "2":
      return "Februari";
      break;
    case "3":
      return "Maret";
      break;
    case "4":
      return "April";
      break;
    case "5":
      return "Mei";
      break;
    case "6":
      return "Juni";
      break;
    case "7":
      return "Juli";
      break;
    case "8":
      return "Agustus";
      break;
    case "9":
      return "September";
      break;
    case "10":
      return "Oktober";
      break;
    case "11":
      return "November";
      break;
    case "12":
      return "Desember";
      break;
    default:
      return a;
  }
}