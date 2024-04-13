import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/provider/list_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    bool selectedOption = false;
    return Scaffold(
      appBar: AppBar(
        title: const Text('To do'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Consumer<ListProvider>(
              builder: (context, listProvider, child) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: listProvider.todonames.length,
                  itemBuilder: (context, index) {
                    final todoName = listProvider.todonames[index];
                    final todoTime = listProvider.todotimes[index];
                    return Card(
                      child: ListTile(
                        leading: Radio(
                          value: 'value 1',
                          groupValue: selectedOption,
                          onChanged: (value) {
                            listProvider.markAsCompleted(index);
                          },
                        ),
                        title: Text(todoName),
                        subtitle: Text(todoTime),
                      ),
                    );
                  },
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 150,
                    height: 50,
                    color: const Color.fromARGB(255, 185, 176, 196),
                    child: const Stack(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Text('Completed'),
                        ),
                        Positioned(
                          right: 0,
                          child: IconButton(
                            icon: Icon(
                              Icons.keyboard_arrow_down_sharp,
                            ),
                            onPressed: null,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Consumer<ListProvider>(
                builder: (context, listProvider, child) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: listProvider.completedTasks.length ~/
                        2, // Since each task has name and time
                    itemBuilder: (context, index) {
                      final nameIndex = index * 2;
                      final timeIndex = nameIndex + 1;
                      return Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Card(
                          child: ListTile(
                            title: Text(
                                listProvider.completedTasks[nameIndex]), // Name
                            subtitle: Text(
                                listProvider.completedTasks[timeIndex]), // Time
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     showDialog(
      //       context: context,
      //       builder: (BuildContext context) {
      //         TextEditingController controller = TextEditingController();
      //         return AlertDialog(
      //           title: const Text("Add To-Do"),
      //           content: SingleChildScrollView(
      //             child: Column(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 TextFormField(
      //                   controller: controller,
      //                   decoration: const InputDecoration(
      //                     hintText: 'Enter task name',
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           ),
      //           actions: [
      //             Row(
      //               children: [
      //                 TextButton(
      //                   onPressed: () {
      //                     Navigator.of(context).pop();
      //                   },
      //                   child: const Text("Close"),
      //                 ),
      //                 TextButton(
      //                   onPressed: () {
      //                     String taskName = controller.text;
      //                     if (taskName.isNotEmpty) {
      //                       Provider.of<ListProvider>(context, listen: false)
      //                           .addToDo(taskName);
      //                       Navigator.of(context).pop();
      //                     }
      //                   },
      //                   child: const Text("Add"),
      //                 ),
      //               ],
      //             ),
      //           ],
      //         );
      //       },
      //     );
      //   },
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
