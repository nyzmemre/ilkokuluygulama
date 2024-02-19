import 'package:flutter/material.dart';

@immutable
class ReadLists{
  const ReadLists._();

  static const List<String> text1 = ["Benim", "Enes", "adında", "kardeşim", "var.", "Benim", "Esra", "adında", "annem", "var.", "Benim", "adım", "Eymen.", "Ben", "hızlı", "okumak", "için", "bunu", "okudum.", "Bunu", "bana", "babam", "yazdı.",];
  static const List<String> text2 = ["Bu","metin","ikinci", "metin", "olarak", "tanımlandı.", "Sen", "bu", "metinleri", "hızlı", "okumak", "istersen", "oku"];
  static const List<String> text3 = ["Üçüncü","metin","geldi", "şimdi.", "Başlayalım", "dedi", "hoca", "bu", "metinleri", "hızlı", "okumak", "istersen", "oku"];

  static const List<List<String>> allList=[text1,text2,text3];
}