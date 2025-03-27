import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/*
StatelessWidget（无状态组件）:一旦创建，组件的 属性不会改变。|| ✅ 静态 UI、图标、文本 （固定的）
StatefulWidget（有状态组件）:可以改变属性。|| ✅ 交互性 UI、动画、表单 (需要upload data， API 请求、Firebase 数据存储、用户输入）
*/

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  TextEditingController mytextctrl = TextEditingController();
  TextEditingController numactrl = TextEditingController();
  TextEditingController numbctrl = TextEditingController();
  int result = 0;

  String mydata = "";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        //header
        appBar: AppBar(
          title: const Text('My App'),
          backgroundColor: Colors.amber,
        ),

        //Wdiget Management(Layout): Column/Row
        body: Center(
          child: Column(
            //vertical
            mainAxisAlignment: MainAxisAlignment.center, 
            
            children: [
              const Text("Welcome to My App"),
              const Text("Flutter is awesome"),

              const Row(
                //horizontal
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [Text("Hello"), Text("World"), Text("Flutter")],
              ),

              SizedBox(width: 300, child: TextField(controller: mytextctrl)),

              const SizedBox(height: 20),

              ElevatedButton(  //默认带有背景色和阴影
                onPressed: () {
                  mydata = mytextctrl.text;
                  print(mydata);
                  //在 Flutter 中，setState() 的作用是通知 Flutter 框架重建 UI，
                  //以反映数据的最新变化。它只能在 StatefulWidget 中使用。
                  setState(() {}); 
                },
                child: const Text("CLICK ME"),
              ),

              Text(mydata),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(width: 100, child: TextField(controller: numactrl)),
                  SizedBox(width: 100, child: TextField(controller: numbctrl)),
                  ElevatedButton(
                    onPressed: calculateMe,
                    child: const Text("+"),
                  ),
                  Text(result.toString()),
                  Container(height: 100, color: Colors.red),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void calculateMe() {
    int num1 = int.parse(numactrl.text);
    int num2 = int.parse(numbctrl.text);
    result = num1 + num2;
    setState(() {});
  }
}
