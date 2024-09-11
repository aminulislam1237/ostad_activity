import 'package:flutter/material.dart';

class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  final TextEditingController _glassNoTEController =TextEditingController(
    text: '1'
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('water tracker'),
        centerTitle: true,
      )
          ,body: Column(
        children: [
          const Text('12',style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600
          ),),
          const Text('glasses',style: TextStyle(
            fontSize: 16,
          ),),
          const SizedBox(height: 16,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 50,
                child: TextField(
                  controller: _glassNoTEController,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                ),
              ),
              TextButton(onPressed: () {}, child: const Text('Add')),
            ],
          )
          ,const SizedBox(height:24),
          Expanded(child: ListView.separated(
              itemBuilder:(context, index) {
                return ListTile(
                  title: Text('Time'),
                  subtitle: Text('Date'),
                  leading: Text('1'),
                  trailing: IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
                );
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
              itemCount: 3))
        ],
    ),
    );
  }
}
