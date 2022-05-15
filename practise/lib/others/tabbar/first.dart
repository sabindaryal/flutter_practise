import 'package:flutter/material.dart';
import 'package:practise/others/second.dart';

class firstPage extends StatefulWidget {
  const firstPage({Key? key}) : super(key: key);

  @override
  State<firstPage> createState() => _firstPageState();
}

class _firstPageState extends State<firstPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        // appBar: AppBar(
        //   flexibleSpace: Column(
        //     mainAxisAlignment: MainAxisAlignment.end,
        //     children: const [
        //       TabBar(tabs: [
        //         Tab(
        //           icon: Icon(Icons.ac_unit_outlined),
        //         ),
        //         Tab(
        //           text: 'fadsfa',
        //         ),
        //         Tab(
        //           text: 'dfadfa',
        //         )
        //       ])
        //     ],
        //   ),
        // ),

        body: SafeArea(
          child: Column(
            children: [
              const Text('for nothing'),
              AppBar(
                flexibleSpace: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    TabBar(tabs: [
                      Tab(
                        icon: Icon(Icons.ac_unit_outlined),
                      ),
                      Tab(
                        text: 'fadsfa',
                      ),
                      Tab(
                        text: 'dfadfa',
                      )
                    ])
                  ],
                ),
              ),
              // DefaultTabController(
              //     length: 3,
              //     child: TabBar(
              //       labelColor: Color.fromARGB(255, 147, 134, 133),
              //       tabs: [
              //         Tab(
              //           icon: Icon(Icons.ac_unit_outlined),
              //         ),
              //         Tab(
              //           text: 'fadsfa',
              //         ),
              //         Tab(
              //           text: 'dfadfa',
              //         )
              //       ],
              //     )),

              const Expanded(
                child: TabBarView(
                  children: [SecondPage(), Text('data'), Text('dfa')],
                ),
              )
            ],
          ),

          //      TabBarView(
          //   children: [
          //     Icon(Icons.abc),
          //     Icon(Icons.abc_outlined),
          //     Icon(Icons.abc_sharp),
          //   ],
          // )
        ),
      ),
    );
  }
}
