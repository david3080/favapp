# 1-1.Dart言語の基礎文法
libフォルダにある"study.dart"にコードを書きながらDart言語の基礎を学んでいきます。タイトルにある文言をCursorのチャットに入力して指示することで答えになるコードを出力してくれます。

## 実行方法
Cursorでターミナルを開いて、下記のコマンドを打つことでDartファイルを実行することができます。

```bash
$ dart lib/study.dart
```

## 言語学習の対象
本研修はオブジェクト指向プログラミングの経験があることを前提としているため、基本的な文法や概念については説明を省略しています。本演習は下記リンク先の公式ドキュメントを参考にしています。

- [Dart言語のチートシート](https://dart.dev/codelabs/dart-cheatsheet)
- [コレクション型](https://dart.dev/codelabs/iterables)
- [ジェネリクス](https://dart.dev/language/generics)
- [ヌル安全](https://dart.dev/codelabs/null-safety)

## 1. 文字列補完の学習

### 1-1. 数値計算結果の文字列補完
【学習内容】${}という文字列補完で計算結果を表現する方法を学びます。

【Chat入力例】
```
"2+3"の計算結果を"2+3の結果はXXです。"という文字列で文字列補完してprintしてください。
```

【コード例】
```dart
void main() {
  print('2 + 3の計算結果は${2 + 3}です。');
}
```
【出力例】
```
2 + 3の計算結果は5です。
```

### 1-2. 変数と文字列の文字列補完
【学習内容】変数と文字列を${}を使って文字列補完する方法を学びます。

【Chat入力例】
```
自分の名前「（自分の名前を入れてください）」を文字列name変数に代入して、"私の名前はxxです。"という文字列で文字列補完してprintしてください。
```
【コード例】
```dart
void main() {
  String name = '（自分の名前）';
  print('私の名前は${name}です。');
}
```
【出力例】
```
2 + 3の計算結果は5です。
```

## 2. コレクションの学習
Dartで定義できるコレクション型（同じ型やクラスの要素をまとめてあつかう集合型）には以下の4種類があります。

| 種類  | 説明 |
|:-----|:----|
| List型  | インデックスで要素にアクセスするコレクション(例：list[0], list[1],...) |
| Map型  | キー・バリュー型のコレクション（例：map["first"], map["second"],...） |
| Set型  | 要素の重複を許さないコレクション |
| Queue型 | 先入先出し型のコレクション |

本研修ではListを使うのでその使い方を説明します。

### 2-1. レストランクラスの作成
【学習内容】特定の属性を持つクラスの設計と使い方を学びます(同時に列挙型も学びます)。

【Chat入力例】
```
レストランを表すID、名前、タイプ（和食、洋食、中華、フレンチ、ファストフード）の属性を持つクラスを実装し、適当な値を入れたレストラン・インスタンスを作成してprintしてください。タイプには列挙型を使ってください。
```
【コード例】
```dart
enum RestaurantType { Japanese, Western, Chinese, French, FastFood }

class Restaurant {
  int id;
  String name;
  RestaurantType type;

  Restaurant(this.id, this.name, this.type);

  @override
  String toString() {
    return 'ID: $id, 名前: $name, タイプ: ${type.toString().split('.').last}';
  }
}

void main() {
  var restaurant = Restaurant(1, 'レストラン名', RestaurantType.Japanese);
  print(restaurant);
}
```
【出力例】
```
ID: 1, 名前: レストラン名, タイプ: Japanese
```

### 2-2. レストランリストの作成
【学習内容】ジェネリクスで配置するクラスを特定しながらリストを作成する方法を学びます(同時にforEachと=>を使って関数を実行する方法も学びます)。

【Chat入力例】
```
@study.dart 定義されたレストランクラスを使って適当な値を入れたレストラン・インスタンスを5つ作成しながらadd関数を使ってListに追加してください。Listに含まれるクラスの型はジェネリクスで指定してください。
```
【コード例】
```dart
enum RestaurantType { Japanese, Western, Chinese, French, FastFood }

class Restaurant {
  int id;
  String name;
  RestaurantType type;

  Restaurant(this.id, this.name, this.type);

  @override
  String toString() {
    return 'ID: $id, 名前: $name, タイプ: ${type.toString().split('.').last}';
  }
}

void main() {
  List<Restaurant> restaurants = [];
  restaurants.add(Restaurant(1, 'レストラン1', RestaurantType.Japanese));
  restaurants.add(Restaurant(2, 'レストラン2', RestaurantType.Western));
  restaurants.add(Restaurant(3, 'レストラン3', RestaurantType.Chinese));
  restaurants.add(Restaurant(4, 'レストラン4', RestaurantType.French));
  restaurants.add(Restaurant(5, 'レストラン5', RestaurantType.FastFood));

  restaurants.forEach((restaurant) => print(restaurant));
}
```
【出力例】
```
ID: 1, 名前: レストラン1, タイプ: Japanese
ID: 2, 名前: レストラン2, タイプ: Western
ID: 3, 名前: レストラン3, タイプ: Chinese
ID: 4, 名前: レストラン4, タイプ: French
ID: 5, 名前: レストラン5, タイプ: FastFood
```

## 3. ヌル値の学習
【学習内容】ヌル値を許す変数には変数の型定義のあとに"?"をつけ、値を参照する際はヌルポインター例外が発生しないように"?"をつける方法を学びます。

【Chat入力例】
```
@study.dart のRestaurantクラスの変数typeはヌルを許容するようにしてください。またレストラン5のtypeはヌルにしてください。
```

```dart
enum RestaurantType { Japanese, Western, Chinese, French, FastFood }

class Restaurant {
  int id;
  String name;
  RestaurantType? type;

  Restaurant(this.id, this.name, this.type);

  @override
  String toString() {
    return 'ID: $id, 名前: $name, タイプ: ${type?.toString().split('.').last}';
  }
}

void main() {
  List<Restaurant> restaurants = [];
  restaurants.add(Restaurant(1, 'レストラン1', RestaurantType.Japanese));
  restaurants.add(Restaurant(2, 'レストラン2', RestaurantType.Western));
  restaurants.add(Restaurant(3, 'レストラン3', RestaurantType.Chinese));
  restaurants.add(Restaurant(4, 'レストラン4', RestaurantType.French));
  restaurants.add(Restaurant(5, 'レストラン5', null));

  restaurants.forEach((restaurant) => print(restaurant));
}
```
【出力例】
```
ID: 1, 名前: レストラン1, タイプ: Japanese
ID: 2, 名前: レストラン2, タイプ: Western
ID: 3, 名前: レストラン3, タイプ: Chinese
ID: 4, 名前: レストラン4, タイプ: French
ID: 5, 名前: レストラン5, タイプ: null
```
【学習のヒント】"RestaurantType"の"?"を外すと「return 'ID: $id, 名前: $name, タイプ: ${type?.toString().split('.').last}';」と「restaurants.add(Restaurant(5, 'レストラン5', null));」の行がエラーになります。


## 4. getterの学習
【学習内容】getterを使って変数の値を取得する方法を学びます。

【Chat入力例】
```
@study.dart のRestaurantクラスの変数typeのenum値に従い適切な日本語文字列を返すgetterを追加し、それを使ってprintするよう修正してください。
```

```dart
enum RestaurantType { Japanese, Western, Chinese, French, FastFood }

class Restaurant {
  int id;
  String name;
  RestaurantType? type;

  Restaurant(this.id, this.name, this.type);

  String get typeInJapanese {
    switch (type) {
      case RestaurantType.Japanese:
        return '和食';
      case RestaurantType.Western:
        return '洋食';
      case RestaurantType.Chinese:
        return '中華';
      case RestaurantType.French:
        return 'フレンチ';
      case RestaurantType.FastFood:
        return 'ファストフード';
      default:
        return '未定義';
    }
  }

  @override
  String toString() {
    return 'ID: $id, 名前: $name, タイプ: ${typeInJapanese}';
  }
}

void main() {
  List<Restaurant> restaurants = [];
  restaurants.add(Restaurant(1, 'レストラン1', RestaurantType.Japanese));
  restaurants.add(Restaurant(2, 'レストラン2', RestaurantType.Western));
  restaurants.add(Restaurant(3, 'レストラン3', RestaurantType.Chinese));
  restaurants.add(Restaurant(4, 'レストラン4', RestaurantType.French));
  restaurants.add(Restaurant(5, 'レストラン5', null));

  restaurants.forEach((restaurant) => print(restaurant));
}
```
【出力例】
```
ID: 1, 名前: レストラン1, タイプ: 和食
ID: 2, 名前: レストラン2, タイプ: 洋食
ID: 3, 名前: レストラン3, タイプ: 中華
ID: 4, 名前: レストラン4, タイプ: フレンチ
ID: 5, 名前: レストラン5, タイプ: 未定義
```
