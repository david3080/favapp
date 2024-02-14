## 研修1. クラス図とシーケンス図を作成

### クラス図の作成
```
@main.dart @items.dart @homepage.dart @favoritespage.dart @favorites.dart の各コードを読んで、HomePage, ItemTile, FavoritesPage, FavoriteItemTile, Favorites, ListTile, ChangeNotifierを対象にクラス図をマーメイド形式で作成してください。
```

### シーケンス図の作成
```
@CLASS.md のクラス図をベースにして、これらのインスタンスを呼び出す @main.dart を"App"とし、"HomePage"でアイテムをリストして"Favorites"に選んで"FavoritesPage"で"Favorites"をリストして削除するシーケンス図をマーメイド形式で作成してください。
```

### シーケンス図の修正
```
アプリはページを操作しリスト表示を依頼するとページがアイテムタイルやお気に入りといったリストからデータを取得してアプリに表示を返すのではないですか？またホームページからお気に入りページに遷移する場合もアプリからホームページにお気に入りページに遷移することを指示し、アプリの画面遷移機能を経由してお気に入りページが表示されると理解していますがいかがでしょうか？
```

## 研修2. 要件から実装

```
@REQ2.md の要件を読んで、Flutterによる実装につながるオブジェクト図にまとめていく作業をしたいです。手伝ってもらえますか。
```

```
いいですね。Itemクラスには @items.dart をつかうことができませんか？
```

```
@favorites.dart をつかうことができませんか？
```

```
ホーム画面（HomeScreen）クラスから作成しましょう。
```

```
HomePageでお好みリストに追加したり削除したりする際にスナックバーを表示して「お好みがリストに追加されました」「お好みがリストから削除されました」と表示するようにしてください
```

```
FavoritesScreenではお好みリストが表示され、削除だけできるようになっています。HomePageのAppBarのお好みアイコンをクリックするとFavoritesPage.routeNameに従って画面が遷移し、FavoritesPageのAppBarの戻るボタンでHomePageに戻れるようになっています。
```
