import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class LocationsAll extends StatefulWidget {
  const LocationsAll({super.key});
  @override
  State<LocationsAll> createState() => _LocationsAllState();
}

class _LocationsAllState extends State<LocationsAll> {
  late Future<List<Map<String, dynamic>>> _branchesFuture;

  @override
  void initState() {
    super.initState();
    _branchesFuture = _fetchBranches();
  }

  Future<List<Map<String, dynamic>>> _fetchBranches() async {
    try {
      final querySnapshot =
          await FirebaseFirestore.instance.collection('branchManagement').get();
      return querySnapshot.docs.map((doc) => doc.data()).toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _branchesFuture,
        builder: (BuildContext context,
            AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final branches = snapshot.data;

          if (branches == null || branches.isEmpty) {
            return const Center(child: Text('No branches found.'));
          }

          return Align(
            alignment: Alignment.topCenter,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: branches.length,
                itemBuilder: (context, index) {
                  final data = branches[index];

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ListTile(
                        title: Text(data['campusName'] ?? 'N/A'),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                'Operating time: ${data['openTime'] ?? 'N/A'} to ${data['closingTime'] ?? 'N/A'}'),
                            Row(
                              children: [
                                const Text("Status: "),
                                data['openStatus'] == true
                                    ? Text(
                                        "OPEN",
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                        ),
                                      )
                                    : Text(
                                        "CLOSE",
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .error,
                                        ),
                                      ),
                              ],
                            ),
                          ],
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            // Add your functionality here
                          },
                          icon: const Icon(Icons.pin_drop_rounded),
                        ),
                      ),
                      const Padding(
                          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                          child: Divider())
                    ],
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
