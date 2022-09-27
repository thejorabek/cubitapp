import 'package:cubitapp/users_cubit/users_cubit.dart';
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
    return BlocProvider(
      create: (context) => UsersCubit(),
      lazy: false,
      child: myScaffold(),
    );
  }

  Scaffold myScaffold() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Page'),
        centerTitle: true,
      ),
      body: BlocConsumer<UsersCubit, UsersState>(
        listener: (context, state) {
          if (state is UsersError) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                backgroundColor: Colors.red,
                content: Text('Error while initilalizing...')));
          } else if (state is UsersComplete) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                backgroundColor: Colors.green,
                content: Text('User successfully comleted...')));
          }
        },
        builder: (context, state) {
          if (state is UsersInitial) {
            return Center(
              child: Column(
                children: [
                  const Text('Initial...'),
                  ElevatedButton(
                      onPressed: () {
                        context.read<UsersCubit>().getUsers();
                      },
                      child: const Icon(Icons.refresh))
                ],
              ),
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
