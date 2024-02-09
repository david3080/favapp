import 'package:flutter/material.dart';
import 'items.dart';

// アイテム番号をリスト保持するクラス
class Favorites extends ChangeNotifier {
  // お気に入りアイテムの番号を保持するリスト
  final List<Item> _favoriteItems = [];

  // お気に入りアイテムのリストを取得するメソッド
  List<Item> get favoriteItems => _favoriteItems;

  // アイテムをお気に入りに追加するメソッド
  void add(Item item) {
    if (!_favoriteItems.contains(item)) {
      _favoriteItems.add(item);
      notifyListeners(); // リスナーに変更を通知
    }
  }

  // アイテムをお気に入りから削除するメソッド
  void remove(Item item) {
    if (_favoriteItems.contains(item)) {
      _favoriteItems.remove(item);
      notifyListeners(); // リスナーに変更を通知
    }
  }
}
