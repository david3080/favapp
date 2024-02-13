## クラス図

``` mermaid
classDiagram
    HomePage -- ItemTile: Uses
    HomePage : +HomePage()
    HomePage : +build(BuildContext context)

    ItemTile -- ListTile: Uses
    ItemTile -- Favorites: Uses
    ItemTile : +ItemTile({Key? key, required this.item})
    ItemTile : -Item item
    ItemTile : +build(BuildContext context)

    FavoritesPage -- FavoriteItemTile: Uses
    FavoritesPage : +FavoritesPage()
    FavoritesPage : +build(BuildContext context)

    FavoriteItemTile -- ListTile: Uses
    FavoriteItemTile -- Favorites: Uses
    FavoriteItemTile : +FavoriteItemTile({Key? key, required this.item})
    FavoriteItemTile : -Item item
    FavoriteItemTile : +build(BuildContext context)

    Favorites --|> ChangeNotifier: Inherits
    Favorites : +Favorites()
    Favorites : -List<Item> _favoriteItems
    Favorites : +List<Item> get favoriteItems
    Favorites : +void add(Item item)
    Favorites : +void remove(Item item)
```