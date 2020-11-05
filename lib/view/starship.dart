import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloctesting/bloc/starships_bloc.dart';

class StarshipView extends StatefulWidget {
  @override
  _StarshipViewState createState() => _StarshipViewState();
}

class _StarshipViewState extends State<StarshipView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Starships"),
      ),
      body: BlocBuilder<StarshipsBloc, StarshipsState>(
        builder: (context, state) {
          if (state is StarshipsFailure) {
            return Center(
              child: Column(
                children: [
                  Text(state.message),
                  MaterialButton(
                    child: Text("Retry"),
                    onPressed: () => context
                        .bloc<StarshipsBloc>()
                        .add(StarshipsEventFetch()),
                  )
                ],
              ),
            );
          }

          if (state is StarshipsLoaded) {
            return ListView.builder(
              key: Key("StarshipListView"),
              itemCount: state.data.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(state.data[index].name),
              ),
            );
          }

          return Center(
            child: CircularProgressIndicator(
              key: Key("StarshipCircularLoadingProgress"),
            ),
          );
        },
      ),
    );
  }

  @override
  void initState() {
    context.bloc<StarshipsBloc>().add(StarshipsEventFetch());
    super.initState();
  }
}
