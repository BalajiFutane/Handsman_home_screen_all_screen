

import 'package:flutter/material.dart';
import 'package:homescreen_client_balaji/Screen/HomeScreen/Components/base_scaffold_widget.dart';
import 'package:homescreen_client_balaji/colour/colors.dart';
import 'package:nb_utils/nb_utils.dart';

class HelpDeskDetailScreen extends StatefulWidget {
  const HelpDeskDetailScreen({Key? key}) : super(key: key);

  @override
  State<HelpDeskDetailScreen> createState() => _HelpDeskDetailScreenState();
}

class _HelpDeskDetailScreenState extends State<HelpDeskDetailScreen> {
  final TextEditingController _replyController = TextEditingController();
  bool _showReplyForm = false;
  bool _isClosed = false;

  // Dummy data
  final List<Map<String, dynamic>> _activities = [
    {
      'id': 1,
      'user': 'Support Team',
      'avatar': '👩‍💼',
      'message': "Thank you for contacting us. We're looking into your issue.",
      'time': '2 hours ago',
      'attachments': [],
    },
    {
      'id': 2,
      'user': 'You',
      'avatar': '👤',
      'message': "I can't access my account after the update.",
      'time': '1 hour ago',
      'attachments': [],
    },
  ];

  @override
  void dispose() {
    _replyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(

      appBarTitle: "Help Desk Ticket",
      appnavcolor: primaryColor,

      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Ticket header
            const Text('#12345', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue)),
            const SizedBox(height: 8),
            Text('Created: ${DateTime.now().subtract(const Duration(hours: 3)).toString()}',
                style: secondaryTextStyle()),
            const SizedBox(height: 16),
            const Text('Account Access Issues', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text("I'm unable to login to my account after the latest app update.",
                style: TextStyle(fontSize: 14)),
            const SizedBox(height: 24),

            // Activity feed
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    ..._activities.map((activity) => _buildActivityItem(activity)),

                    // Reply form
                    if (_showReplyForm) ...[
                      const SizedBox(height: 16),
                      TextField(
                        controller: _replyController,
                        maxLines: 4,
                        decoration: InputDecoration(
                          hintText: 'Type your reply...',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () => setState(() => _showReplyForm = false),
                            child: const Text('Cancel'),
                          ),
                          const SizedBox(width: 16),
                          ElevatedButton(
                            onPressed: () {
                              // Just for demo - would add to activities in real app
                              setState(() {
                                _showReplyForm = false;
                                _replyController.clear();
                              });
                            },
                            child: const Text('Send'),
                          ),
                        ],
                      ),
                    ],

                    // Action buttons
                    if (!_isClosed) ...[
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: const Text('Close Ticket?'),
                                    content: const Text('Are you sure you want to close this ticket?'),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: const Text('No'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          setState(() => _isClosed = true);
                                          Navigator.pop(context);
                                        },
                                        child: const Text('Yes'),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              child: const Text('Mark as Closed'),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () => setState(() => _showReplyForm = true),
                              child: const Text('Reply'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
            ),

            // Help text
            if (!_isClosed)
              const Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text(
                  '* You can close this ticket once your issue is resolved',
                  style: TextStyle(fontStyle: FontStyle.italic, fontSize: 12),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildActivityItem(Map<String, dynamic> activity) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(child: Text(activity['avatar'])),
          title: Row(
            children: [
              Text(activity['user'], style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(width: 8),
              Text(activity['time'], style: secondaryTextStyle()),
            ],
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 4),
              Text(activity['message']),
              if (activity['attachments'].isNotEmpty) ...[
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  children: (activity['attachments'] as List).map((url) {
                    return Image.network(url, width: 80, height: 80, fit: BoxFit.cover);
                  }).toList(),
                ),
              ],
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }
}