import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'favorites.dart';
import 'items.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  static String routeName = '/favorites';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('お気に入り'),
      ),
      body: Consumer<Favorites>(
        builder: (context, favorites, child) {
          return ListView.builder(
            itemCount: favorites.favoriteItems.length,
            itemBuilder: (context, index) {
              final item = favorites.favoriteItems[index]; // Itemオブジェクトを取得
              return FavoriteItemTile(
                item: item,
              ); // FavoriteItemTileにItemオブジェクトを渡す
            },
          );
        },
      ),
    );
  }
}

class FavoriteItemTile extends StatelessWidget {
  final Item item; // Item型に変更

  const FavoriteItemTile({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(item.imagePath), // アイテムの画像を表示
      ),
      title: Text(item.name), // アイテム名を表示
      trailing: IconButton(
        icon: const Icon(Icons.close),
        onPressed: () {
          Provider.of<Favorites>(context, listen: false)
              .remove(item); // Itemオブジェクトを使用して削除
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('削除されました…'),
              duration: Duration(seconds: 1),
            ),
          );
        },
      ),
    );
  }
}
