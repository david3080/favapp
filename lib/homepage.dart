import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'favorites.dart';
import 'favoritespage.dart';
import 'items.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('好みの選択'),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite, color: Colors.red),
            onPressed: () {
              Navigator.pushNamed(context, FavoritesPage.routeName);
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ItemTile(item: items[index]);
        },
      ),
    );
  }
}

class ItemTile extends StatelessWidget {
  final Item item; // Itemクラスのインスタンスを受け取る

  const ItemTile({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var favoritesList = Provider.of<Favorites>(context);
    bool isFavorite = favoritesList.favoriteItems
        .contains(item); // itemオブジェクトがお気に入りリストに含まれているか確認

    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(item.imagePath), // アイテムの画像を表示
      ),
      title: Text("${item.name}（${item.typeName}）"), // アイテム名を表示
      subtitle: Text(item.description), // アイテムの説明を表示
      trailing: IconButton(
        icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
        onPressed: () {
          if (isFavorite) {
            favoritesList.remove(item); // お気に入りからアイテムを削除
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('好みリストから削除'),
                duration: Duration(seconds: 1),
              ),
            );
          } else {
            favoritesList.add(item); // お気に入りにアイテムを追加
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('好みリストに追加'),
                duration: Duration(seconds: 1),
              ),
            );
          }
        },
      ),
    );
  }
}
