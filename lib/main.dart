import 'package:flutter/material.dart';

class Product {
  const Product({this.name});
  final String name;
}

typedef void CartChangedCallback(Product product, bool inCart);

class ShoppingListItem extends StatelessWidget {
  ShoppingListItem({
     this.product,
     this.inCart,
     this.onCartChanged,
  }) : super(key: ObjectKey(product));

  final Product product;
  final bool inCart;
  final CartChangedCallback onCartChanged;

  Color _getColor(BuildContext context) {
    // The theme depends on the BuildContext because different
    // parts of the tree can have different themes.
    // The BuildContext indicates where the build is
    // taking place and therefore which theme to use.

    return inCart //
        ? Colors.black54
        : Theme.of(context).primaryColor;
  }

  TextStyle _getTextStyle(BuildContext context) {
    if (!inCart) return null;

    return TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onCartChanged(product, inCart);
      },
      leading: CircleAvatar(
        backgroundColor: _getColor(context),
        child: Text(product.name[0]),
      ),
      // title: Text(product.name, style: _getTextStyle(context)),
      title: Text(product.name),
    );
  }
}

class ConfigList extends StatefulWidget {
  ConfigList({ this.products}) : super();

  final List<Product> products;

  // The framework calls createState the first time
  // a widget appears at a given location in the tree.
  // If the parent rebuilds and uses the same type of
  // widget (with the same key), the framework re-uses
  // the State object instead of creating a new State object.

  @override
  _ConfigListState createState() => _ConfigListState();
}

class _ConfigListState extends State<ConfigList> {
  Set<Product> _shoppingCart = Set<Product>();

  void _handleCartChanged(Product product, bool inCart) {
    setState(() {
      // When a user changes what's in the cart, you need
      // to change _shoppingCart inside a setState call to
      // trigger a rebuild.
      // The framework then calls build, below,
      // which updates the visual appearance of the app.

      if (!inCart)
        _shoppingCart.add(product);
      else
        _shoppingCart.remove(product);
    });
  }

  bool switchOpenIPv6 = false;
  bool switchConfirmCertificate = true;
  bool switchFilterChinaMainLandIP = true;
  bool switchAllowAccessLAN = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping List'),
      ),
      body: Column(
    
        children: [
          Image(image: AssetImage("images/ic_launcher.png")),
          TextField(
            decoration: InputDecoration(
              hintText: "Name",
            ),
          ),
          TextField(
            decoration: InputDecoration(
              hintText: "Remote Address",
            ),
          ),
          TextField(
            decoration: InputDecoration(
              hintText: "Remote Service SNI",
            ),
          ),
          TextField(
            decoration: InputDecoration(
              hintText: "Port",
            ),
          ),
          TextField(
            decoration: InputDecoration(
              hintText: "Password",
            ),
          ),
          Row(
            children: [
              Text("开启IPv6"),
              Switch(value: switchOpenIPv6, onChanged: (value){

              }),
            ],
          ),
          Row(
            children: [
              Text("验证证书"),
              Switch(value: switchConfirmCertificate, onChanged: (value){

              }),
            ],
          ),
          Row(
            children: [
              Text("过滤大陆域名/IP"),
              Switch(value: switchFilterChinaMainLandIP, onChanged: (value){

              }),
            ],
          ),
          Row(
            children: [
              Text("允许局域网访问"),
              Switch(value: switchAllowAccessLAN, onChanged: (value){

              }),
            ],
          ),
          TextButton(onPressed: (){}, child: Text("连接"))
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    title: 'Shopping App',
    home: ConfigList(
      products: <Product>[
        Product(name: 'Eggs'),
        Product(name: 'Flour'),
        Product(name: 'Chocolate chips'),
      ],
    ),
  ));
}