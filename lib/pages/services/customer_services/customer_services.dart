import 'package:flutter/material.dart';
import 'package:postalhub_tracker/pages/services/customer_services/faqs/main_faqs_page.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomerServices extends StatelessWidget {
  const CustomerServices({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Help & Support Center'),
        ),
        body: Align(
            alignment: Alignment.topCenter,
            child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 750,
                ),
                child: SingleChildScrollView(
                    child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                  ),
                  Padding(
                      padding:
                          const EdgeInsets.only(left: 15, bottom: 3, right: 15),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(5),
                          bottomRight: Radius.circular(5),
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                        child: Material(
                          color: Theme.of(context).colorScheme.surfaceVariant,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const MainFaqsPage()));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(0),
                              child: ListTile(
                                title: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                  child: const Text('Knowledge Base'),
                                ),
                                subtitle: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 10),
                                    child: const Text(
                                        'Look at the frequently asked questions to find answers to common queries in the knowledge base.')),
                                leading: Container(
                                  height: 45,
                                  width: 45,
                                  decoration: BoxDecoration(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Icon(
                                    Icons.question_answer_rounded,
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                    size: 30,
                                  ),
                                ),
                                trailing:
                                    const Icon(Icons.chevron_right_rounded),
                              ),
                            ),
                          ),
                        ),
                      )),
                  Padding(
                      padding:
                          const EdgeInsets.only(left: 15, bottom: 3, right: 15),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                        child: Material(
                          color: Theme.of(context).colorScheme.surfaceVariant,
                          child: InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Coming Soon'),
                                    content: Text(
                                        'This feature is not available yet.'),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(),
                                        child: Text('OK'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(0),
                              child: ListTile(
                                title: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                  child: const Text('Ticket Support [PLANNED]'),
                                ),
                                subtitle: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 10),
                                    child: const Text(
                                        'Create a case using ticketing system.')),
                                leading: Container(
                                  height: 45,
                                  width: 45,
                                  decoration: BoxDecoration(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Icon(
                                    Icons.confirmation_num_rounded,
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                    size: 30,
                                  ),
                                ),
                                trailing:
                                    const Icon(Icons.chevron_right_rounded),
                              ),
                            ),
                          ),
                        ),
                      )),
                  Padding(
                      padding:
                          const EdgeInsets.only(left: 15, bottom: 3, right: 15),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5),
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25),
                        ),
                        child: Material(
                          color: Theme.of(context).colorScheme.surfaceVariant,
                          child: InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Coming Soon'),
                                    content: Text(
                                        'This feature is not available yet.'),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(),
                                        child: Text('OK'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(0),
                              child: ListTile(
                                title: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                  child: const Text('Parcel Mate [PLANNED]'),
                                ),
                                subtitle: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 10),
                                    child: const Text(
                                        'Ask any queries to our AI agent, Parcel Mate. Operate 24/7, anytime, anywhere.')),
                                leading: Container(
                                  height: 45,
                                  width: 45,
                                  decoration: BoxDecoration(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Icon(
                                    Icons.support_agent_rounded,
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                    size: 30,
                                  ),
                                ),
                                trailing:
                                    const Icon(Icons.chevron_right_rounded),
                              ),
                            ),
                          ),
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                  ),
                  Padding(
                      padding:
                          const EdgeInsets.only(left: 15, bottom: 3, right: 15),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(5),
                          bottomRight: Radius.circular(5),
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                        child: Material(
                          color: Theme.of(context).colorScheme.surfaceVariant,
                          child: InkWell(
                            onTap: () {
                              launchUrl(Uri.parse(
                                  'mailto:postalhub.resources@gmail.com'));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(0),
                              child: ListTile(
                                leading: const Icon(Icons.email_outlined),
                                title: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                  child: const Text('Email (Operating Issue)'),
                                ),
                                subtitle: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 10),
                                    child: const Text(
                                        'postalhub.resources@gmail.com')),
                                trailing: const Icon(Icons.call_made_rounded),
                              ),
                            ),
                          ),
                        ),
                      )),
                  Padding(
                      padding:
                          const EdgeInsets.only(left: 15, bottom: 3, right: 15),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                        child: Material(
                          color: Theme.of(context).colorScheme.surfaceVariant,
                          child: InkWell(
                            onTap: () {
                              launchUrl(Uri.parse('tel:+601156765004'));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(0),
                              child: ListTile(
                                leading: const Icon(Icons.phone_outlined),
                                title: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                  child:
                                      const Text('Hotline (Operating Issue)'),
                                ),
                                subtitle: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 10),
                                    child: const Text(
                                        '+601156765004 (Call/WhatsApp)')),
                                trailing: const Icon(Icons.call_made_rounded),
                              ),
                            ),
                          ),
                        ),
                      )),
                  Padding(
                      padding:
                          const EdgeInsets.only(left: 15, bottom: 3, right: 15),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25),
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5),
                        ),
                        child: Material(
                          color: Theme.of(context).colorScheme.surfaceVariant,
                          child: InkWell(
                            onTap: () {
                              launchUrl(Uri.parse('mailto:support@qimlab.my'));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(0),
                              child: ListTile(
                                leading: const Icon(Icons.email_outlined),
                                title: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                  child: const Text('Email (Technical Issue)'),
                                ),
                                subtitle: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 10),
                                    child: const Text('support@qimlab.my')),
                                trailing: const Icon(Icons.call_made_rounded),
                              ),
                            ),
                          ),
                        ),
                      )),
                ])))));
  }
}
