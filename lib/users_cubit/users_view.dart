import 'package:cubitapp/users_cubit/users_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersView extends StatefulWidget {
  const UsersView({super.key});

  @override
  State<UsersView> createState() => _UsersViewState();
}

class _UsersViewState extends State<UsersView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('user Page'),
        centerTitle: true,
      ),
      body: BlocConsumer(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is UsersInitial) {
            return Center(
              child: Text('Initial...'),
            );
          } else if (state is UsersLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is UsersComplete) {
            return ListView.builder(
                itemCount: state.response.length,
                itemBuilder: (context, index) {
                  return Text(state.response[index]);
                });
          } else {
            return Center(
              child: Text((state as UsersError).errMessage),
            );
          }
        },
      ),
    );
  }
}
