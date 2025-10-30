// screens/people_page.dart
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/instructor.dart';

class PeoplePage extends StatefulWidget {
  const PeoplePage({Key? key}) : super(key: key);

  @override
  State<PeoplePage> createState() => _PeoplePageState();
}

class _PeoplePageState extends State<PeoplePage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  static final List<Instructor> instructors = [
    Instructor(
      name: 'Yiğithan Kuraner',
      title: 'Professor',
      phone: '+90354567845',
      email: 'okuraner1907@university.edu',
      office: 'Room 301',
      imageUrl: 'https://static.wikia.nocookie.net/lolesports_gamepedia_en/images/c/c5/BJK_Panky_2019_Split_1.png/revision/latest?cb=20190116170712',
    ),
    Instructor(
      name: 'Anthony Soprano',
      title: 'Garbage Management Professor',
      phone: '+90794567887',
      email: 'gabagoollover@university.edu',
      office: 'Room 302',
      imageUrl: 'https://static.wikia.nocookie.net/sopranos/images/8/8c/Tony_Soprano_Season_1.png/revision/latest/scale-to-width/360?cb=20231023222532',
    ),
    Instructor(
      name: 'Eddard Stark',
      title: 'Associate Professor',
      phone: '+90554567821',
      email: 'wolfofthenorth@university.edu',
      office: 'Room 303',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/tr/5/52/Ned_Stark-Sean_Bean.jpg',
    ),
    Instructor(
      name: 'Vincent Aboubakar',
      title: 'Assistant Professor',
      phone: '+90354567857',
      email: 'yamyam.golcu1903@university.edu',
      office: 'Room 304',
      imageUrl: 'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcSOuofA1EB30LF4qhabdjYUFCqSbtwVfk5twiMjhogpOxSm0OV4ugSz1V9KSwIQXO1QkVEAMKn9pPxyihG9Mt67c4nXn8ioEuYnTFwDuw',
    ),
    Instructor(
      name: 'Taylor Swift',
      title: 'Lecturer',
      phone: '+90674567825',
      email: 'ophelia@university.edu',
      office: 'Room 305',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/tr/d/d5/Tayloralbum.jpg',
    ),
    Instructor(
      name: 'Aykut Kocaman',
      title: 'Botanic Professor',
      phone: '+90852467878',
      email: 'esaskaybetmek@university.edu',
      office: 'Room 306',
      imageUrl: 'https://images.bursadabugun.com/haber/2013/07/16/258057-aykut-kocaman-3-yilda-coktu-51e5add9f221f.jpg',
    ),
    Instructor(
      name: 'Şenol Güneş',
      title: 'Philosophy Professor',
      phone: '+90554567585',
      email: 'trabzonlukartal@university.edu',
      office: 'Room 307',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTF6pvtjUe-QGximGwPyNoaialiSxgrfaEQEA&s',
    ),
    Instructor(
      name: 'Pakize İvedik',
      title: 'Asisstant Professor',
      phone: '+90484567573',
      email: 'recepivedik1dahaiyi@university.edu',
      office: 'Room 308',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxUpjfObYCLS2ZwAWgNAYwjELBm_tHgtX7Vw&s',
    ),
  ];

  List<Instructor> get filteredInstructors {
    if (_searchQuery.isEmpty) {
      return instructors;
    }
    return instructors.where((instructor) {
      final searchLower = _searchQuery.toLowerCase();
      return instructor.name.toLowerCase().contains(searchLower) ||
          instructor.title.toLowerCase().contains(searchLower) ||
          instructor.email.toLowerCase().contains(searchLower) ||
          instructor.office.toLowerCase().contains(searchLower);
    }).toList();
  }

  Future<void> _makePhoneCall(BuildContext context, Instructor instructor) async {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text('Call ${instructor.name}?'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Name: ${instructor.name}'),
              Text('Title: ${instructor.title}'),
              Text('Phone: ${instructor.phone}'),
              Text('Email: ${instructor.email}'),
              Text('Office: ${instructor.office}'),
              const SizedBox(height: 10),
              const Text('Do you want to call this instructor?'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: const Text('No'),
            ),
            ElevatedButton(
              onPressed: () async {
                Navigator.of(dialogContext).pop();
                final Uri phoneUri = Uri(scheme: 'tel', path: instructor.phone);

                try {
                  bool launched = await launchUrl(
                    phoneUri,
                    mode: LaunchMode.externalApplication,
                  );

                  if (!launched) {
                    // Try alternative method
                    launched = await launchUrl(phoneUri);
                  }

                  if (!launched && context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text(
                          'Phone dialer not available on emulator. '
                              'This will work on a real device.',
                        ),
                        backgroundColor: Colors.orange,
                        duration: const Duration(seconds: 4),
                        action: SnackBarAction(
                          label: 'Copy Number',
                          textColor: Colors.white,
                          onPressed: () {
                            // You could implement clipboard copy here if needed
                          },
                        ),
                      ),
                    );
                  }
                } catch (e) {
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Phone dialer not available: ${instructor.phone}\n'
                              'This feature works on real Android devices.',
                        ),
                        backgroundColor: Colors.orange,
                        duration: const Duration(seconds: 4),
                      ),
                    );
                  }
                }
              },
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final filtered = filteredInstructors;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            controller: _searchController,
            onChanged: (value) {
              setState(() {
                _searchQuery = value;
              });
            },
            decoration: InputDecoration(
              hintText: 'Search instructors...',
              prefixIcon: const Icon(Icons.search),
              suffixIcon: _searchQuery.isNotEmpty
                  ? IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  setState(() {
                    _searchController.clear();
                    _searchQuery = '';
                  });
                },
              )
                  : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              filled: true,
              fillColor: Colors.grey.shade100,
            ),
          ),
        ),
        Expanded(
          child: filtered.isEmpty
              ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.search_off, size: 64, color: Colors.grey.shade400),
                const SizedBox(height: 16),
                Text(
                  'No instructors found',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          )
              : ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: filtered.length,
            itemBuilder: (context, index) {
              final instructor = filtered[index];
              return Card(
                elevation: 4,
                margin: const EdgeInsets.only(bottom: 16),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.blue.shade200,
                            backgroundImage: NetworkImage(instructor.imageUrl),
                            onBackgroundImageError: (exception, stackTrace) {
                              // If image fails to load, will show the fallback
                            },
                            child: instructor.imageUrl.isEmpty
                                ? Text(
                              instructor.name.split(' ').map((e) => e[0]).join(),
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                                : null,
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  instructor.name,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  instructor.title,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Icon(Icons.phone, size: 16, color: Colors.grey.shade600),
                          const SizedBox(width: 8),
                          Text(instructor.phone),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(Icons.email, size: 16, color: Colors.grey.shade600),
                          const SizedBox(width: 8),
                          Expanded(child: Text(instructor.email)),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(Icons.room, size: 16, color: Colors.grey.shade600),
                          const SizedBox(width: 8),
                          Text(instructor.office),
                        ],
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: () => _makePhoneCall(context, instructor),
                          icon: const Icon(Icons.call),
                          label: const Text('Call'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            foregroundColor: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}