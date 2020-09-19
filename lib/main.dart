import 'package:bloc_demo_1/counter_bloc.dart';
import 'package:bloc_demo_1/counter_event.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final _bloc = CounterBloc();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: StreamBuilder(
          stream: _bloc.counter,
          initialData: 0,
          builder: (BuildContext context,AsyncSnapshot snapshot ){
            return Text("${snapshot.data}",style: TextStyle(color:Theme.of(context).primaryColor,fontSize:72),);
          },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: (){
              _bloc.counterEventSink.add(IncrementEvent());
            },
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          SizedBox(width:10),
          FloatingActionButton(
        onPressed: (){
           _bloc.counterEventSink.add(DecrementEvent());
        },
        tooltip: 'Increment',
        child: Icon(Icons.remove),
      ),
        ],
      ),
    );
  }
}
