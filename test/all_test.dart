import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:favapp/favorites.dart';
import 'package:favapp/items.dart';
import 'package:favapp/main.dart' as app;
import 'package:favapp/homepage.dart';
import 'package:favapp/favoritespage.dart';

void main() {
  group('要件1.アイテムとアイテムリストの管理', () {
    late Item vegeItem;
    late Item fruitItem;

    setUp(() {
      vegeItem = Item(
          name: 'テスト野菜',
          type: ItemType.vegetable,
          description: 'テスト用の野菜です。',
          imagePath: 'assets/images/vegetable.png');
      fruitItem = Item(
          name: 'テスト果物',
          type: ItemType.fruit,
          description: 'テスト用の果物です。',
          imagePath: 'assets/images/fruit.png');
    });
    group('1-1.Itemクラスのテスト', () {
      test('1-1-1.野菜アイテムのプロパティが正しく設定されているか', () {
        expect(vegeItem.name, 'テスト野菜');
        expect(vegeItem.type, ItemType.vegetable);
        expect(vegeItem.description, 'テスト用の野菜です。');
        expect(vegeItem.imagePath, 'assets/images/vegetable.png');
      });

      test('1-1-2.果物アイテムのプロパティが正しく設定されているか', () {
        expect(fruitItem.name, 'テスト果物');
        expect(fruitItem.type, ItemType.fruit);
        expect(fruitItem.description, 'テスト用の果物です。');
        expect(fruitItem.imagePath, 'assets/images/fruit.png');
      });
    });
    group('1-2.アイテムリストのテスト', () {
      test('1-2-1.アイテムが正しく定義されているか', () {
        final item = items.first; // 例としてリストの最初のアイテム「りんご」をテスト
        expect(item.name, isNotNull);
        expect(item.type, anyOf([ItemType.vegetable, ItemType.fruit]));
        expect(item.description, isNotNull);
        expect(item.imagePath, startsWith('assets/images/'));
      });

      test('1-2-2.アイテムリストが期待されるアイテムを含んでいるか', () {
        final expectedItems = ['リンゴ', 'キュウリ', 'アボカド']; // 期待されるアイテム名の一部
        final actualItemNames = items.map((item) => item.name).toList();
        for (var itemName in expectedItems) {
          expect(actualItemNames, contains(itemName));
        }
      });
    });
  });
  group('要件2.お好みリストの管理', () {
    late Item vegeItem;
    late Item fruitItem;
    late Favorites favorites;

    setUp(() {
      vegeItem = Item(
          name: 'テスト野菜',
          type: ItemType.vegetable,
          description: 'テスト用の野菜です。',
          imagePath: 'assets/images/vegetable.png');
      fruitItem = Item(
          name: 'テスト果物',
          type: ItemType.fruit,
          description: 'テスト用の果物です。',
          imagePath: 'assets/images/fruit.png');
      favorites = Favorites();
    });
    group('2-1.Favoritesクラスのテスト', () {
      test('2-1-1.アイテムをお気に入りに追加する', () {
        expect(favorites.favoriteItems, isEmpty); // 初期状態は空であることを確認

        favorites.add(vegeItem); // アイテムを追加
        expect(
            favorites.favoriteItems, contains(vegeItem)); // アイテムが追加されていることを確認
        expect(favorites.favoriteItems.length, 1); // アイテム数が1であることを確認
      });

      test('2-1-2.アイテムをお気に入りから削除する', () {
        favorites.add(vegeItem); // テストの準備としてアイテムを追加

        expect(
            favorites.favoriteItems, contains(vegeItem)); // アイテムが追加されていることを確認

        favorites.remove(vegeItem); // アイテムを削除
        expect(favorites.favoriteItems,
            isNot(contains(vegeItem))); // アイテムが削除されていることを確認
        expect(favorites.favoriteItems, isEmpty); // お気に入りリストが空であることを確認
      });

      test('2-1-3.同じアイテムを複数回追加してもリストには一度だけ表示される', () {
        favorites.add(vegeItem); // アイテムを追加
        favorites.add(vegeItem); // 同じアイテムを再度追加

        expect(favorites.favoriteItems.length, 1); // アイテムがリストに一度だけ追加されていることを確認
      });

      test('2-1-4.異なるタイプのアイテムが正しく管理されているか', () {
        favorites.add(vegeItem); // 野菜アイテムを追加
        favorites.add(fruitItem); // 果物アイテムを追加

        expect(favorites.favoriteItems,
            containsAll([vegeItem, fruitItem])); // 両方のアイテムが含まれていることを確認
        expect(favorites.favoriteItems.length, 2); // アイテム数が2であることを確認
      });
    });
  });

  group('要件3. 画面構成とナビゲーション', () {
    testWidgets('3-1. ホーム画面からお気に入り画面に遷移し戻って来れることを確認', (
      WidgetTester tester,
    ) async {
      app.main(); // MyAppを実行
      await tester.pumpAndSettle(); // アニメーションが終了するまで待つ

      // 初期状態でホーム画面が表示されることを確認
      expect(find.text('好みの選択'), findsOneWidget); // AppBarのタイトルで確認

      // AppBarのactionsにあるIcons.favoriteのIconButtonをクリック
      await tester.tap(find.byIcon(Icons.favorite));
      await tester.pumpAndSettle(); // 画面遷移のアニメーションが終了するまで待つ

      // FavoritesPageに移動したことを確認
      expect(find.byType(FavoritesPage), findsOneWidget);

      // FavoritesPageのAppBarに表示される戻るボタンをクリック
      await tester.tap(find.byTooltip('Back'));
      await tester.pumpAndSettle(); // 画面遷移のアニメーションが終了するまで待つ

      // ホーム画面に戻って来れることを確認
      expect(find.text('好みの選択'), findsOneWidget); // AppBarのタイトルで確認
    });
  });
  group('要件4. ホーム画面の機能', () {
    group('4-1. ホーム画面の構造のテスト', () {
      testWidgets('4-1-1. AppBarのタイトルが「好みの選択」であることを確認', (
        WidgetTester tester,
      ) async {
        await tester.pumpWidget(createHomePage());
        expect(find.text('好みの選択'), findsOneWidget);
      });
      testWidgets('4-1-2. AppBarにIcons.favoriteのTextButtonがあることを確認', (
        WidgetTester tester,
      ) async {
        await tester.pumpWidget(createHomePage());
        expect(find.widgetWithIcon(IconButton, Icons.favorite), findsOneWidget);
      });
      testWidgets('4-1-3. ホーム画面でアイテムが表示される', (WidgetTester tester) async {
        await tester.pumpWidget(createHomePage());
        expect(find.text('キュウリ（野菜）'), findsOneWidget);
        expect(find.text('リンゴ（果物）'), findsOneWidget);
      });
      testWidgets('4-1-4. ListViewでListTileがitems分リストされていることを確認', (
        tester,
      ) async {
        await tester.pumpWidget(createHomePage());
        await tester.fling(
          find.byType(ListView),
          const Offset(0, -200),
          3000,
        );
        await tester.pumpAndSettle();
        expect(find.text('トマト（果物）'), findsOneWidget);
      });
    });
    group('4-2. ホーム画面の操作のテスト', () {
      testWidgets('4-2-1. ホーム画面でアイテムをお気に入りに追加・削除できる',
          (WidgetTester tester) async {
        await tester.pumpWidget(createHomePage());
        final favoritesList = Provider.of<Favorites>(
            tester.element(find.byType(HomePage)),
            listen: false);

        // 'リンゴ'アイテムのListTileのIcons.favorite_borderを探してタップ
        await tester
            .tap(find.widgetWithIcon(IconButton, Icons.favorite_border).first);
        await tester.pumpAndSettle(); // アニメーションが終了するまで待つ

        // favoritesList.favoriteItemsの中に
        // 名前が「リンゴ」であるアイテムが含まれていることを確認
        expect(
          favoritesList.favoriteItems.any(
            (item) => item.name == 'リンゴ',
          ),
          isTrue,
        );

        // お気に入りから削除するために、お気に入りアイコンを再度タップ
        await tester.tap(find.descendant(
          of: find.widgetWithText(ListTile, 'リンゴ（果物）'),
          matching: find.byIcon(Icons.favorite),
        ));
        await tester.pumpAndSettle(); // アニメーションが終了するまで待つ

        // favoritesList.favoriteItemsの中に
        // 名前が「リンゴ」であるアイテムが含まれていないことを確認
        expect(
            favoritesList.favoriteItems.any(
              (item) => item.name == 'リンゴ',
            ),
            isFalse);
      });
    });
  });
  group('要件5. お気に入り画面の機能', () {
    late Favorites favorites;

    setUp(() {
      favorites = Favorites();
      // items.dartからいくつかのアイテムをお気に入りに追加
      favorites.add(items[0]); // リンゴを追加
      favorites.add(items[1]); // キュウリを追加
      favorites.add(items[2]); // アボカドを追加
    });
    group('5-1. お気に入り画面の構造のテスト', () {
      testWidgets('5-1-1. AppBarのタイトルが「お気に入り」であることを確認', (
        WidgetTester tester,
      ) async {
        await tester.pumpWidget(createFavoritesPage(favorites: favorites));
        expect(find.text('お気に入り'), findsOneWidget);
      });

      testWidgets('5-1-2. お気に入りリストにアイテムが表示される', (WidgetTester tester) async {
        await tester.pumpWidget(createFavoritesPage(favorites: favorites));
        // 追加したアイテムが表示されているか確認
        expect(find.text(items[0].name), findsOneWidget); // リンゴ
        expect(find.text(items[1].name), findsOneWidget); // キュウリ
        expect(find.text(items[2].name), findsOneWidget); // アボカド
      });
    });
    group('5-2. お気に入り画面の操作のテスト', () {
      testWidgets('5-2-1. お気に入りからアイテムを削除できる', (WidgetTester tester) async {
        await tester.pumpWidget(createFavoritesPage(favorites: favorites));
        // 追加したアイテムが表示されているか確認
        expect(find.text(items[0].name), findsOneWidget); // リンゴ
        expect(find.text(items[1].name), findsOneWidget); // キュウリ
        expect(find.text(items[2].name), findsOneWidget); // アボカド

        // リンゴのアイテムの削除ボタンをタップ
        await tester.tap(find.byIcon(Icons.close).at(0));
        await tester.pumpAndSettle(); // アニメーションが終了するまで待つ

        // リンゴがリストから削除されていることを確認
        expect(find.text(items[0].name), findsNothing);
        // キュウリとアボカドはまだ存在することを確認
        expect(find.text(items[1].name), findsOneWidget); // キュウリ
        expect(find.text(items[2].name), findsOneWidget); // アボカド
      });
    });
  });
}

Widget createHomePage() {
  return ChangeNotifierProvider<Favorites>(
    create: (context) => Favorites(),
    child: const MaterialApp(
      home: HomePage(),
    ),
  );
}

Widget createFavoritesPage({Favorites? favorites}) {
  return ChangeNotifierProvider<Favorites>(
    create: (context) => favorites ?? Favorites(),
    child: const MaterialApp(
      home: FavoritesPage(),
    ),
  );
}
