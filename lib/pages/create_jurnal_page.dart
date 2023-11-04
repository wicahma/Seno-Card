import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' hide Text;
import 'package:seno_card/components/bases/base_comp.dart';
import 'package:seno_card/components/logic/storage_logic.dart';
import 'package:seno_card/components/micros/back_button.dart';
import 'package:seno_card/components/micros/date_chip.dart';
import 'package:seno_card/components/micros/emoji_button.dart';
import 'package:seno_card/pages/jurnal_page.dart';

class CreateJurnalPage extends StatefulWidget {
  final bool isEdit;
  final String date;
  final int mood;
  final Document? cerita;
  final String judul;
  const CreateJurnalPage(
      {super.key,
      this.date = "",
      required this.isEdit,
      this.mood = 0,
      this.cerita,
      this.judul = ""});

  @override
  State<CreateJurnalPage> createState() => _CreateJurnalPageState();
}

class _CreateJurnalPageState extends State<CreateJurnalPage> {
  DateTime _selectedDate = DateTime.now();
  int _mood = 0;
  bool _isEdit = false;
  QuillController _ceritaController = QuillController.basic();
  TextEditingController _judulController = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (!widget.isEdit) {
      getJurnal(DateTime.now());
      return;
    }
    _selectedDate = DateTime.parse(widget.date);
    getJurnal(DateTime.parse(widget.date));
  }

  Future<void> getJurnal(DateTime searchedDate) async {
    List<dynamic>? dataJurnal = jsonDecode(
        await StorageLogic().getData(key: 'jurnals', type: String) ?? "[]");
    if (dataJurnal == null) return;
    List<dynamic> selectedJurnal = dataJurnal
        .where((e) =>
            e['tanggal'].toString().split(" ")[0] ==
            searchedDate.toString().split(" ")[0])
        .toList();
    if (selectedJurnal.isEmpty) {
      setState(() {
        _isEdit = false;
        _mood = 0;
        _ceritaController = QuillController.basic();
        _judulController.text = "";
      });
      return;
    }

    setState(() {
      _isEdit = true;
      _mood = selectedJurnal[0]['mood'];
      _ceritaController = QuillController(
          document: Document.fromJson(jsonDecode(selectedJurnal[0]['cerita'])),
          selection: const TextSelection.collapsed(offset: 0));
      _judulController.text = selectedJurnal[0]['judul'];
    });
    debugPrint("data jurnal ${selectedJurnal.toString()}");
  }

  Future<void> saveJurnal() async {
    if (_mood == 0 ||
        _ceritaController.document.toPlainText().isEmpty ||
        _judulController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          dismissDirection: DismissDirection.none,
          showCloseIcon: true,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
          duration: Duration(milliseconds: 300),
          content: Text("Ada bagian yang belum diisi!")));
      return;
    }
    Map<String, dynamic> jurnal = {
      'judul': _judulController.text,
      'cerita': jsonEncode(_ceritaController.document.toDelta().toJson()),
      'mood': _mood,
      'tanggal': _selectedDate.toString()
    };
    debugPrint(jsonEncode(jurnal));
    List<dynamic> oldJurnals =
        jsonDecode(await StorageLogic().getData(key: 'jurnals') ?? "[]");

    if (_isEdit) {
      int index = oldJurnals.indexWhere((element) =>
          element['tanggal'].toString().split(" ")[0] ==
          widget.date.toString().split(" ")[0]);
      oldJurnals[index] = jurnal;
    } else {
      oldJurnals.add(jurnal);
    }

    await StorageLogic()
        .saveData(key: 'jurnals', value: jsonEncode(oldJurnals), type: String);
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        dismissDirection: DismissDirection.none,
        showCloseIcon: true,
        backgroundColor: Colors.green,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
        duration: Duration(milliseconds: 300),
        content: Text("Data berhasil disimpan!")));
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const JurnalPage()),
        (r) => false);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _isEdit
            ? await showDialog(
                context: context,
                builder: (_) => AlertDialog(
                      title: const Text('Konfirmasi'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                              'Apakah anda yakin ingin berhenti untuk mengedit jurnal?'),
                          const SizedBox(height: 15),
                          Row(
                            children: [
                              Expanded(
                                child: TextButton(
                                    style: const ButtonStyle(
                                        minimumSize: MaterialStatePropertyAll(
                                            Size(double.infinity, 50))),
                                    onPressed: () =>
                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const JurnalPage()),
                                            (r) => false),
                                    child: const Text('YA')),
                              ),
                              Expanded(
                                child: TextButton(
                                    style: const ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                Color.fromRGBO(
                                                    255, 195, 73, 1)),
                                        minimumSize: MaterialStatePropertyAll(
                                            Size(double.infinity, 50))),
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text('TIDAK')),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ))
            : Navigator.pop(context);
        return false;
      },
      child: BaseComponent(
        useAppBar: AppBar(
          elevation: 5,
          shadowColor: Colors.black.withOpacity(0.3),
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          leading: const BackBtn(),
          shape: const RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.elliptical(20, 20))),
          title: Text(
            'journal'.toUpperCase(),
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(177, 121, 184, 1)),
          ),
          centerTitle: true,
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DateChip(
                      enable: true,
                      getWeek: false,
                      date: widget.date,
                      dateResult: (date) {
                        setState(() {
                          _selectedDate = date;
                          getJurnal(date);
                        });
                        debugPrint(date.toString());
                      },
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(177, 121, 184, 1),
                      borderRadius: BorderRadius.circular(20)),
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      const Text(
                        "What's ur mood now?",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          EmojiButton(
                            mood: 1,
                            isActive: _mood == 1,
                            onSelected: (value) {
                              debugPrint(value.toString());
                              setState(() {
                                _mood = value;
                              });
                            },
                          ),
                          EmojiButton(
                            mood: 2,
                            isActive: _mood == 2,
                            onSelected: (value) {
                              debugPrint(value.toString());
                              setState(() {
                                _mood = value;
                              });
                            },
                          ),
                          EmojiButton(
                            mood: 3,
                            isActive: _mood == 3,
                            onSelected: (value) {
                              debugPrint(value.toString());
                              setState(() {
                                _mood = value;
                              });
                            },
                          ),
                          EmojiButton(
                            mood: 4,
                            isActive: _mood == 4,
                            onSelected: (value) {
                              debugPrint(value.toString());
                              setState(() {
                                _mood = value;
                              });
                            },
                          ),
                          EmojiButton(
                            mood: 5,
                            isActive: _mood == 5,
                            onSelected: (value) {
                              debugPrint(value.toString());
                              setState(() {
                                _mood = value;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SliverFillRemaining(
                  fillOverscroll: true,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextField(
                          key: const Key("title-editor"),
                          maxLines: 2,
                          controller: _judulController,
                          onTapOutside: (event) {},
                          decoration: const InputDecoration.collapsed(
                              hintText: "Apa tema hari ini?"),
                        ),
                        QuillToolbar.basic(
                          key: const Key("text-editor"),
                          showSubscript: false,
                          showSmallButton: false,
                          showDividers: false,
                          showFontSize: false,
                          showFontFamily: false,
                          showInlineCode: false,
                          showStrikeThrough: false,
                          showCodeBlock: false,
                          showIndent: false,
                          showLink: false,
                          showSearchButton: false,
                          showSuperscript: false,
                          showRedo: false,
                          showUndo: false,
                          showBackgroundColorButton: false,
                          showColorButton: false,
                          showListCheck: false,
                          showListBullets: false,
                          showListNumbers: false,
                          showClearFormat: false,
                          showHeaderStyle: false,
                          controller: _ceritaController,
                          customButtons: [
                            QuillCustomButton(
                              tooltip: "Simpan jurnal",
                              onTap: () {},
                              child: TextButton.icon(
                                  onPressed: () => saveJurnal(),
                                  style: const ButtonStyle(
                                      foregroundColor: MaterialStatePropertyAll(
                                          Colors.amber),
                                      backgroundColor: MaterialStatePropertyAll(
                                          Colors.white),
                                      iconSize: MaterialStatePropertyAll(18)),
                                  icon: const Icon(Icons.save),
                                  label: const Text(
                                    "Simpan",
                                    style: TextStyle(fontSize: 13),
                                  )),
                            )
                          ],
                        ),
                        Expanded(
                          child: Container(
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.grey, width: 1),
                            ),
                            child: QuillEditor.basic(
                              autoFocus: false,
                              expands: true,
                              controller: _ceritaController,
                              readOnly: false, // true for view only mode
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
