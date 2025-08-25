import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:awesome_ripple_animation/awesome_ripple_animation.dart';

class Greetings extends StatefulWidget {
  const Greetings({super.key});
  @override
  State<Greetings> createState() => _GreetingsState();
}

class _GreetingsState extends State<Greetings> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String _greeting = "Oh, Hi!";

  @override
  void initState() {
    super.initState();
    _fetchGreeting();
  }

  Future<void> _fetchGreeting() async {
    try {
      QuerySnapshot snapshot =
          await _firestore.collection('user_experience').get();
      if (snapshot.docs.isNotEmpty) {
        var data = snapshot.docs.first.data() as Map<String, dynamic>;
        setState(() {
          _greeting = data['greeting'] ?? 'Oh, Hi!';
        });
      } else {
        setState(() {
          _greeting = 'Oh, Hi!';
        });
      }
    } catch (e) {
      setState(() {
        _greeting = 'Oh, Hi!';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceVariant,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Row(
              children: [
                RippleAnimation(
                  repeat: true,
                  color: Theme.of(context).colorScheme.error,
                  minRadius: 14,
                  ripplesCount: 3,
                  size: const Size(52, 52),
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image:
                            AssetImage('assets/images/megaphones_purple.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    _greeting,
                    style: const TextStyle(fontSize: 15),
                  ),
                )
              ],
            )));
  }
}
