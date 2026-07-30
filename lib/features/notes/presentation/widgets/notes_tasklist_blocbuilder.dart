import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_flutter/features/notes/presentation/cubit/notes_cubit.dart';
import 'package:practice_flutter/features/notes/presentation/cubit/notes_state.dart';

class NotesTasklistBlocbuilder extends StatelessWidget{
  const NotesTasklistBlocbuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder <NotesCubit,NotesState>(
      builder: (context, state) {
        if(state is NotesStateLoading){
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        if(state is NotesStateError){
          return Text(state.message);
        }

        if(state is NotesStateLoaded){
          return ListView.builder(
            itemCount: state.tasks.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  state.tasks[index].taskName,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                subtitle: Text(
                  state.tasks[index].taskDescription,
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),

                leading: state.tasks[index].isCompleted == true ? IconButton(
                  icon: Icon(
                    Icons.check_box_outlined,
                    color: Colors.green,
                  ),
                  onPressed: () {
                    context.read<NotesCubit>().completed(index);
                  },
                ) : IconButton(
                  icon: Icon(
                    Icons.check_box_outline_blank_rounded,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    context.read<NotesCubit>().completed(index);
                  },
                ),

                trailing: IconButton(
                  onPressed: () {
                    context.read<NotesCubit>().deletetask(index);
                  },
                  icon: Icon(
                    Icons.delete,
                    color: Colors.pink,
                  ),
                ),
              );
            },
          );
        }

        return SizedBox();
      },
    );
  }
}