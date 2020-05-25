import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:line_icons/line_icons.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map<int, Color> color = {
      50: Color.fromRGBO(133, 205, 202, 0.1),
      100: Color.fromRGBO(133, 205, 202, 0.2),
      200: Color.fromRGBO(133, 205, 202, 0.3),
      300: Color.fromRGBO(133, 205, 202, 0.4),
      400: Color.fromRGBO(133, 205, 202, 0.5),
      500: Color.fromRGBO(133, 205, 202, 0.6),
      600: Color.fromRGBO(133, 205, 202, 0.7),
      700: Color.fromRGBO(133, 205, 202, 0.8),
      800: Color.fromRGBO(133, 205, 202, 0.9),
      900: Color.fromRGBO(133, 205, 202, 1)
    };

    return MaterialApp(
      title: 'MyStrategies',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: MaterialColor(0xFF85cdca, color)),
      home: MyHomePage(title: 'MyStrategies'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(validator: (value) {
            if (value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          }),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Processing Data')));
                }
              },
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}

RichText getLogo(double size) {
  return RichText(
      text: TextSpan(
          style: new TextStyle(
            fontSize: size,
            color: Colors.white,
          ),
          children: <TextSpan>[
        TextSpan(text: "My", style: TextStyle(fontWeight: FontWeight.bold)),
        TextSpan(text: "Health", style: TextStyle(fontWeight: FontWeight.w300))
      ]));
}

class CustomBoxShadow extends BoxShadow {
  final BlurStyle blurStyle;

  const CustomBoxShadow({
    Color color = const Color(0xFF000000),
    Offset offset = Offset.zero,
    double blurRadius = 0.0,
    this.blurStyle = BlurStyle.normal,
  }) : super(color: color, offset: offset, blurRadius: blurRadius);

  @override
  Paint toPaint() {
    final Paint result = Paint()
      ..color = color
      ..maskFilter = MaskFilter.blur(this.blurStyle, blurSigma);
    assert(() {
      if (debugDisableShadows) result.maskFilter = null;
      return true;
    }());
    return result;
  }
}

class _MyHomePageState extends State<MyHomePage> {
  String selected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        endDrawer: Drawer(
            child: Column(
          children: <Widget>[
            Container(
                height: 140,
                child: DrawerHeader(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(children: <Widget>[getLogo(55)])
                      ]),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(133, 205, 202, 1),
                  ),
                )),
            Expanded(
                child: ListView(
              children: <Widget>[],
            )),
            Container(
                child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Container(
                        child: Column(
                      children: <Widget>[
                        Divider(),
                        ListTile(
                          title: Row(
                            children: <Widget>[
                              Icon(Icons.vpn_key),
                              Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Text("Change password"),
                              )
                            ],
                          ),
                          onTap: () {},
                        ),
                        ListTile(
                          title: Row(
                            children: <Widget>[
                              Icon(Icons.person_outline),
                              Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Text("Logout"),
                              )
                            ],
                          ),
                          onTap: () {},
                        ),
                      ],
                    ))))
          ],
        )),
        appBar: AppBar(
//            centerTitle: true,
            automaticallyImplyLeading: false,
            elevation: 2,
            iconTheme: new IconThemeData(color: Colors.white),
            title: getLogo(40)),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
              Card(
                elevation: 5,
                margin: EdgeInsets.only(top: 0),
                color: Color.fromRGBO(133, 205, 202, 1),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(top: 10)),
                    Text("How are you?",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 30,
                            color: Colors.white)),
                    Padding(padding: EdgeInsets.only(bottom: 20)),
                    SizedBox(
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Container(
                                margin: new EdgeInsets.all(10.0),
                                decoration: new BoxDecoration(
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      new CustomBoxShadow(
                                          color: Color.fromRGBO(0, 0, 0, 0.2),
                                          blurRadius: 20.0,
                                          blurStyle: BlurStyle.outer)
                                    ] /*,borderRadius: BorderRadius.circular(5)*/
                                    ),
                                child: IconButton(
                                  icon: Icon(
                                    LineIcons.frown_o,
                                    color: Colors.white,
                                  ),
                                  padding: EdgeInsets.zero,
                                  iconSize: 120,
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: new Text("That's sad"),
                                            content: new Text("That's sad."),
                                            actions: <Widget>[
                                              new FlatButton(
                                                child: new Text(
                                                  "Close",
                                                  style: TextStyle(
                                                      color: Color.fromRGBO(
                                                          133, 205, 202, 1)),
                                                ),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                            ],
                                          );
                                        });
                                  },
                                )),
                            Container(
                                margin: new EdgeInsets.all(10.0),
                                decoration: new BoxDecoration(
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      new CustomBoxShadow(
                                          color: Color.fromRGBO(0, 0, 0, 0.2),
                                          blurRadius: 20.0,
                                          blurStyle: BlurStyle.outer)
                                    ] /*,borderRadius: BorderRadius.circular(5)*/
                                    ),
                                child: IconButton(
                                  icon: Icon(
                                    LineIcons.smile_o,
                                    color: Colors.white,
                                  ),
                                  padding: EdgeInsets.zero,
                                  iconSize: 120,
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: new Text("That's great!"),
                                            content: new Text("That's great!"),
                                            actions: <Widget>[
                                              new FlatButton(
                                                child: Text(
                                                  "Close",
                                                  style: TextStyle(
                                                      color: Color.fromRGBO(
                                                          133, 205, 202, 1)),
                                                ),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                            ],
                                          );
                                        });
                                  },
                                ))
                          ],
                        )),
                    Padding(padding: EdgeInsets.only(bottom: 20)),
                  ],
                ),
              ),
              Expanded(
                  child: Card(
                      elevation: 5,
                      margin: EdgeInsets.only(top: 20),
                      color: Color.fromRGBO(133, 205, 202, 1),
                      child: SizedBox(
                          child: Padding(
                              padding: EdgeInsets.all(20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  new Container(
                                    color: Colors.white,
                                    width: double.infinity,
                                    padding: EdgeInsets.zero,
                                    margin: EdgeInsets.only(bottom: 20),
                                    child: DropdownButtonHideUnderline(
                                        child: ButtonTheme(
                                      child: new DropdownButton<String>(
                                        value: selected,
                                        items: <String>[
                                          'Strategy One',
                                          'Strategy Two'
                                        ].map((String value) {
                                          return new DropdownMenuItem<String>(
                                            value: value,
                                            child: new Text(value),
                                          );
                                        }).toList(),
                                        hint: Text(
                                          "Choose strategy",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        onChanged: (String value) {
                                          setState(() {
                                            selected = value;
                                          });
                                        },
                                      ),
                                      alignedDropdown: true,
                                    )),
                                  ),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          "Favourites",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.left,
                                        ),
                                        IconButton(
                                          iconSize: 30,
                                          alignment: Alignment.centerRight,
                                          icon: Icon(
                                            Icons.add_circle_outline,
                                            color: Colors.white,
                                          ),
                                          onPressed: () {},
                                        )
                                      ]),
                                  Expanded(
                                      child: ListView.separated(
                                    separatorBuilder: (context, index) =>
                                        Divider(
                                      color: Colors.black,
                                      thickness: 1,
                                      height: 1,
//                                  endIndent: 10,
//                                  indent: 10,
                                    ),
                                    itemCount: 7,
                                    itemBuilder: (context, index) => Padding(
                                      padding: EdgeInsets.zero,
                                      child: Card(
                                        child: SizedBox(
                                            height: 30,
                                            width: double.maxFinite,
                                            child: Padding(
                                                padding:
                                                    EdgeInsets.only(left: 10),
                                                child: Align(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: <Widget>[
                                                      Text(
                                                        "Strategy $index",
                                                        style: TextStyle(
                                                            fontSize: 18),
                                                      ),
                                                      Icon(Icons.star)
                                                    ],
                                                  ),
                                                  alignment: Alignment.center,
                                                ))),
                                        margin: EdgeInsets.zero,
                                        elevation: 0,
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(0)),
                                      ),
                                    ),
                                  )),
                                ],
                              )))))
            ])));
  }
}
