import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final FocusNode _focusNodeVoucher = FocusNode();
  final FocusNode _focusNodeRollNo = FocusNode();
  final FocusNode _focusNodeDated = FocusNode();
  final FocusNode _focusNodeAmount = FocusNode();
  final FocusNode _focusNodeForTheMonth = FocusNode();
  final FocusNode _focusNodeInstallment = FocusNode();
  final FocusNode _focusNodeDiscount = FocusNode();
  final FocusNode _focusNodeFine = FocusNode();
  final FocusNode _focusNodeUpdate = FocusNode();
  final FocusNode _focusNodeDelete = FocusNode();
  final FocusNode _focusNodeSearch = FocusNode();
  final FocusNode _focusNodeClear = FocusNode();

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text(widget.title),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 200,
                  child: TextField(
                    autofocus: true,
                    focusNode: _focusNodeVoucher,
                    decoration: const InputDecoration(labelText: 'Voucher Number'),
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: TextField(
                    focusNode: _focusNodeRollNo,
                    decoration: const InputDecoration(labelText: 'Roll No'),
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: TextField(
                    focusNode: _focusNodeDated,
                    decoration: const InputDecoration(labelText: 'Dated'),
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: TextField(
                    focusNode: _focusNodeAmount,
                    decoration: const InputDecoration(labelText: 'Amount'),
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: TextField(
                    focusNode: _focusNodeForTheMonth,
                    decoration: const InputDecoration(labelText: 'For Month'),
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: TextField(
                    focusNode: _focusNodeInstallment,
                    decoration: const InputDecoration(labelText: 'Installment'),
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: TextField(
                    focusNode: _focusNodeDiscount,
                    decoration: const InputDecoration(labelText: 'Discount'),
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: TextField(
                    focusNode: _focusNodeFine,
                    decoration: const InputDecoration(labelText: 'Fine'),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        focusNode: _focusNodeUpdate,
                        onPressed: () {
                          _focusNodeUpdate.skipTraversal = true;
                          _focusNodeDelete.skipTraversal = true;
                          _focusNodeSearch.skipTraversal = true;
                          _focusNodeClear.skipTraversal = true;
                        },
                        child: const Text('Save')),
                    ElevatedButton(
                        focusNode: _focusNodeUpdate,
                        onPressed: () {
                          _focusNodeUpdate.skipTraversal = false;
                          _focusNodeDelete.skipTraversal = false;
                          _focusNodeSearch.skipTraversal = false;
                          _focusNodeClear.skipTraversal = false;
                        },
                        child: const Text('Update')),
                    ElevatedButton(
                        focusNode: _focusNodeDelete,
                        onPressed: () {},
                        child: const Text('Delete')),
                    ElevatedButton(
                        focusNode: _focusNodeSearch,
                        onPressed: () {
                          _focusNodeVoucher.requestFocus();
                        },
                        child: const Text('Search')),
                    ElevatedButton(
                        focusNode: _focusNodeClear,
                        onPressed: () {},
                        child: const Text('Clear')),
                  ],
                )
              ],
            ),
          ),
        ),

    );
  }
}
