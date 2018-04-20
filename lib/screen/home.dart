import 'package:flutter/material.dart';
import 'package:my_store/model/product_category.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<ProductCategory> _getProductCategories() {

    var productCategoryTypes = <CategoryEnum>[
      CategoryEnum.MOBILE_PHONES,
      CategoryEnum.DESKTOPS,
      CategoryEnum.HOUSE,
      CategoryEnum.MISC,
      CategoryEnum.NOTEBOOKS,
    ];

    var categories = <ProductCategory>[];

    productCategoryTypes.asMap().forEach((i,val) {
      var w = (200 + i);
      categories.add(new ProductCategory(
        val, val.toString(),
        "https://picsum.photos/" + (2*w).toString() + "/" + w.toString() + "?blur",
      ));
    });

    return categories;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      drawer: new _AppDrawer(),
      body: new GridView.count(
        crossAxisCount: 1,
        childAspectRatio: 2.0,
        padding: EdgeInsets.zero,
        mainAxisSpacing: 0.0,
        crossAxisSpacing: 0.0,
        children: _getProductCategories().map((c) {
          return new Stack(
            children: <Widget>[
              new Positioned.fill(
                child: new Material(
                  color: Colors.transparent,
                  child: new InkWell(
                    splashColor: Colors.lightBlueAccent,
                  ),
                ),
              ),
              new Positioned.fill(
                child: new GridTile(
                  child: new Stack(
                    children: <Widget>[
                      new Image.network(c.getPictureUrl()),
                      new Center(
                        child: new Text(
                          c.getName(),
                          style: Theme.of(context).accentTextTheme.subhead,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }).toList(),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {},
        tooltip: 'Search',
        child: new Icon(Icons.search),
      ),
    );
  }
}

class _AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: new ListView(
        children: <Widget>[
          new DrawerHeader(
            child: new Container(
              padding: new EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 20.0,
              ),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      new CircleAvatar(
                        backgroundImage: new NetworkImage(
                            "https://static1.squarespace.com/static/528252b7e4b00150d03a4848/59a2354eebbd1a0623e0cefe/59a2359f6a49631dd5192339/1503802789674/RickAndMorty_RickHappy1500.png?format=300w"),
                        maxRadius: 40.0,
                      ),
                      new Text(
                        "Rick Sanchez",
                        style: new TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                  new Row(
                    children: <Widget>[],
                  ),
                ],
              ),
            ),
            decoration: new BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
          ),
          ListTile(
            leading: new Icon(Icons.store),
            title: new Text(
              "Store",
              style: Theme.of(context).textTheme.subhead,
            ),
            subtitle: new Text("Find group buying deals you may like!"),
            onTap: () {},
          ),
          ListTile(
            leading: new Icon(Icons.info),
            title: new Text(
              "My Profile",
              style: Theme.of(context).textTheme.subhead,
            ),
            subtitle: new Text("Billing info, general settings and more."),
            onTap: () {},
          ),
          ListTile(
            leading: new Icon(Icons.shopping_cart),
            title: new Text(
              "Shopping Cart",
              style: Theme.of(context).textTheme.subhead,
            ),
            subtitle: new Text("Shows the list of chosen products!"),
            onTap: () {},
          ),
          ListTile(
            leading: new Icon(Icons.thumb_up),
            title: new Text(
              "Recommendations",
              style: Theme.of(context).textTheme.subhead,
            ),
            subtitle: new Text("Products you may like!"),
            onTap: () {},
          ),
          ListTile(
            leading: new Icon(Icons.help),
            title: new Text(
              "Help",
              style: Theme.of(context).textTheme.subhead,
            ),
            subtitle: new Text("We may aid you :)"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
