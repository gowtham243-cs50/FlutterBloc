import 'package:co/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeDart extends StatefulWidget {
  const HomeDart({super.key});

  @override
  State<HomeDart> createState() => _HomeDartState();
}

class _HomeDartState extends State<HomeDart> {
  @override
  Widget build(BuildContext context) {
    final counterBloc = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("FLutter femo"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder<CounterBloc, int>( // Receives state directly
              builder: (context, counter) {
                return Text(
                  '$counter',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton:  Row(
        children: [
          FloatingActionButton(
         onPressed: () {
          counterBloc.add(CounterIncremented());
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
          ),
          FloatingActionButton(
         onPressed: () {
          counterBloc.add(CounterDecremented  ());
        },
        tooltip: 'Decrement',
        child: const Icon(Icons.minimize),
          )
        ],
      )
    );
  }
}