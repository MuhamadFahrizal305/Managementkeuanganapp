import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:management_keuangan/db/database_instance.dart';
import 'package:management_keuangan/models/transaksi_model.dart';

class UpdateScreen extends StatefulWidget {
  final TransaksiModel transaksiModel;
  const UpdateScreen({Key? key, required this.transaksiModel})
      : super (key: key);
  
  @override
  State<UpdateScreen> createState() => _UpdataScreenState();
}

class _UpdataScreenState extends State<UpdateScreen> {
  DatabaseInstance databaseInstance = DatabaseInstance();
  TextEditingController nameController = TextEditingController();
  TextEditingController totalController = TextEditingController();
  int _value = 1;

  void initState(){
    databaseInstance.database();
    nameController.text = widget.transaksiModel.name!;
    totalController.text = widget.transaksiModel.total!.toString();
    _value = widget.transaksiModel.type!;

    super.initState();
  }

 //nilai sementara
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white,),
          onPressed: (){
            Navigator.pop(context); //kembali ke halaman sebelumnya
        },),
        title: Text(
          "Update",
          style: TextStyle(color: Colors.white,
          fontWeight: FontWeight.bold
          ),
          ),
          ),
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column( 
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text("Nama"),
          TextField(
            controller: nameController,
          ),
          SizedBox( height: 30,),
          Text("Tipe Transaksi"),
          ListTile(
            title: Text("Pemasukan"),
            leading:
            Radio(groupValue: _value, value: 1, onChanged: (value){
              setState(() {
                _value = int.parse(value.toString());
              });
            }),
            ),
          ListTile(
            title: Text("Pengeluaran"),
            leading:
            Radio(groupValue: _value, value: 2, onChanged: (value){
              setState(() {
                _value = int.parse(value.toString());
              });
            }),
            ),
          SizedBox( height: 30,),
          Text("Total"),
          TextField(
            controller: totalController,
          ),
          SizedBox( height: 30,),
          ElevatedButton(
               onPressed: () async{
                 await databaseInstance.update(widget.transaksiModel.id!,{
                  'name': nameController.text,
                  'type': _value,
                  'total': totalController.text,
                 // 'created_At': DateTime.now().toString(),
                  'update_At': DateTime.now().toString(),
                 }) ;
                 Navigator.pop(context);

               },
               
              child: Text("Update"))
        ],),
      )),
    );
  }
}