import 'package:flutter/material.dart';

class StopSelectionScreen extends StatefulWidget {
  @override
  _StopSelectionScreenState createState() => _StopSelectionScreenState();
}

class _StopSelectionScreenState extends State<StopSelectionScreen> {
  // List to store stops
  List<String> stops = [];

  // TextEditingController for adding stops
  TextEditingController stopController = TextEditingController();

  // Function to add a stop
  void addStop() {
    if (stopController.text.isNotEmpty) {
      setState(() {
        stops.add(stopController.text);
      });
      stopController.clear();
    }
  }

  // Function to remove a stop
  void removeStop(int index) {
    setState(() {
      stops.removeAt(index);
    });
  }

  // Function to show bottom sheet with stops
  void showStops(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          height: 300,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your Stops',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: stops.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      key: Key(stops[index]),
                      onDismissed: (direction) {
                        removeStop(index); // Removes stop when swiped
                      },
                      background: Container(
                        color: Colors.red,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.remove_circle_outline,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      child: ListTile(
                        title: Text(stops[index]),
                        trailing: IconButton(
                          icon: Icon(
                            Icons.remove_circle_outline,
                            color: Colors.red,
                          ),
                          onPressed: () => removeStop(index),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add and View Stops'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: stopController,
              decoration: InputDecoration(
                labelText: 'Enter a stop',
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: addStop,
              child: Text('Add Stop'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => showStops(context),
              child: Text('View Stops'),
            ),
          ],
        ),
      ),
    );
  }
}
