enum ItemType { vegetable, fruit }

class Item {
  final String name;
  final ItemType type;
  final String description;
  final String imagePath;

  String get typeName {
    return type == ItemType.fruit ? '果物' : '野菜';
  }

  Item(
      {required this.name,
      required this.type,
      required this.description,
      required this.imagePath});
}

final List<Item> items = [
  Item(
      name: 'リンゴ',
      type: ItemType.fruit,
      description: '赤または緑の丸くて甘い果物。',
      imagePath: 'assets/images/apple.png'),
  Item(
      name: 'キュウリ',
      type: ItemType.vegetable,
      description: '長くて緑のサクサクした野菜。',
      imagePath: 'assets/images/cucumber.png'),
  Item(
      name: 'アボカド',
      type: ItemType.fruit,
      description: 'クリーミーな果肉を持つ栄養価の高い果物。',
      imagePath: 'assets/images/avocado.png'),
  Item(
      name: 'ナス',
      type: ItemType.vegetable,
      description: '紫色の滑らかな皮を持つ野菜。',
      imagePath: 'assets/images/eggplant.png'),
  Item(
      name: 'バナナ',
      type: ItemType.fruit,
      description: '黄色くて曲がった形の甘い果物。',
      imagePath: 'assets/images/banana.png'),
  Item(
      name: 'ブロッコリー',
      type: ItemType.vegetable,
      description: '緑色の花蕾を食べる野菜。',
      imagePath: 'assets/images/broccoli.png'),
  Item(
      name: 'キャベツ',
      type: ItemType.vegetable,
      description: '葉が密集している緑色の野菜。',
      imagePath: 'assets/images/cabbage.png'),
  Item(
      name: 'ニンジン',
      type: ItemType.vegetable,
      description: 'オレンジ色で甘みのある根菜。',
      imagePath: 'assets/images/carrot.png'),
  Item(
      name: 'サクランボ',
      type: ItemType.fruit,
      description: '小さくて赤い甘酸っぱい果物。',
      imagePath: 'assets/images/cherry.png'),
  Item(
      name: 'トウモロコシ',
      type: ItemType.vegetable,
      description: '黄色い粒を食べる野菜。',
      imagePath: 'assets/images/corn.png'),
  Item(
      name: 'キウイ',
      type: ItemType.fruit,
      description: '茶色い皮と鮮やかな緑色の果肉を持つ果物。',
      imagePath: 'assets/images/kiwi.png'),
  Item(
      name: 'レモン',
      type: ItemType.fruit,
      description: '酸っぱい黄色い果物。',
      imagePath: 'assets/images/lemon.png'),
  Item(
      name: 'レタス',
      type: ItemType.vegetable,
      description: 'サラダに使われる葉野菜。',
      imagePath: 'assets/images/lettuce.png'),
  Item(
      name: 'マンゴー',
      type: ItemType.fruit,
      description: 'トロピカルな甘い果物。',
      imagePath: 'assets/images/mango.png'),
  Item(
      name: 'メロン',
      type: ItemType.fruit,
      description: '大きくて甘い果物。',
      imagePath: 'assets/images/melon.png'),
  Item(
      name: 'タマネギ',
      type: ItemType.vegetable,
      description: '鋭い味が特徴の球形の野菜。',
      imagePath: 'assets/images/onion.png'),
  Item(
      name: 'オレンジ',
      type: ItemType.fruit,
      description: 'ビタミンCが豊富な甘酸っぱい果物。',
      imagePath: 'assets/images/orange.png'),
  Item(
      name: 'モモ',
      type: ItemType.fruit,
      description: 'ピンクの柔らかい果肉を持つ果物。',
      imagePath: 'assets/images/peach.png'),
  Item(
      name: '梨',
      type: ItemType.fruit,
      description: '水分が多くて甘い果物。',
      imagePath: 'assets/images/pear.png'),
  Item(
      name: 'トマト',
      type: ItemType.fruit,
      description: '赤くてジューシーな、野菜と間違えやすい果物。',
      imagePath: 'assets/images/tomato.png'),
];
