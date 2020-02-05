import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'bottom_bar.dart';

class DetailGaji extends StatefulWidget {
  List list;
  int index;
  DetailGaji({this.index, this.list});
  @override
  _DetailGajiState createState() => _DetailGajiState();
}

class _DetailGajiState extends State<DetailGaji> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Gaji"),
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        child: Card(
          elevation: 2,
          child: Container(
            margin: EdgeInsets.only(top: 16),
            child: DataTable(
              columns: [
                DataColumn(
                  label: Text(
                    "Data Gajian",
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ],
              rows: [
                DataRow(
                  cells: [
                    DataCell(
                      Text(
                        "Nama Karyawan : ${widget.list[widget.index]['nama']}",
                        style: TextStyle(height: 1.5),
                      ),
                    ),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(
                      Text(
                        "Kode Jabatan : ${widget.list[widget.index]['kode_jabatan']}",
                      ),
                    ),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(
                      Text(
                        "Bulan Gajian : ${widget.list[widget.index]['bulan']}",
                      ),
                    ),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(
                      Text(
                        "Tahun Gajian : ${widget.list[widget.index]['tahun']}",
                      ),
                    ),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(
                      Text(
                        "Total Jam Lembur : ${widget.list[widget.index]['jml_lembur']} Jam",
                      ),
                    ),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(
                      Text(
                        "Total Tunjangan : Rp.${widget.list[widget.index]['total_tunjangan']}",
                      ),
                    ),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(
                      Text(
                        "Pajak : Rp.${widget.list[widget.index]['pajak']}",
                      ),
                    ),
                  ],
                ),
                DataRow(
                  cells: [
                    DataCell(
                      Text(
                        "Gaji Bersih : Rp.${widget.list[widget.index]['gaji_bersih']}",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
