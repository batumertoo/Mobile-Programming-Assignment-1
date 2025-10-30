// screens/infrastructure_page.dart
import 'package:flutter/material.dart';
import '../models/classroom_image.dart';
import 'enlarged_image_page.dart';

class InfrastructurePage extends StatefulWidget {
  const InfrastructurePage({Key? key}) : super(key: key);

  @override
  State<InfrastructurePage> createState() => _InfrastructurePageState();
}

class _InfrastructurePageState extends State<InfrastructurePage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  static final List<ClassroomImage> classrooms = [
    ClassroomImage(
      name: 'Main Lecture Hall',
      imageUrl: 'https://images.unsplash.com/photo-1562774053-701939374585?w=800',
      description: 'Capacity: 200 students, Equipment: Projector, Sound System',
    ),
    ClassroomImage(
      name: 'Computer Lab A',
      imageUrl: 'https://images.unsplash.com/photo-1498050108023-c5249f4df085?w=800',
      description: 'Capacity: 40 students, Equipment: 40 PCs, Projector',
    ),
    ClassroomImage(
      name: 'Computer Lab B',
      imageUrl: 'https://images.unsplash.com/photo-1517694712202-14dd9538aa97?w=800',
      description: 'Capacity: 30 students, Equipment: 30 PCs, Whiteboard',
    ),
    ClassroomImage(
      name: 'Seminar Room',
      imageUrl: 'https://images.unsplash.com/photo-1497366216548-37526070297c?w=800',
      description: 'Capacity: 50 students, Equipment: Smart Board, Video Conference',
    ),
    ClassroomImage(
      name: 'Study Area',
      imageUrl: 'https://images.unsplash.com/photo-1497366811353-6870744d04b2?w=800',
      description: 'Capacity: 25 students, Equipment: Comfortable seating, WiFi',
    ),
    ClassroomImage(
      name: 'Research Lab',
      imageUrl: 'https://images.unsplash.com/photo-1581092160562-40aa08e78837?w=800',
      description: 'Capacity: 15 students, Equipment: High-end workstations',
    ),
  ];

  List<ClassroomImage> get filteredClassrooms {
    if (_searchQuery.isEmpty) {
      return classrooms;
    }
    return classrooms.where((classroom) {
      final searchLower = _searchQuery.toLowerCase();
      return classroom.name.toLowerCase().contains(searchLower) ||
          classroom.description.toLowerCase().contains(searchLower);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final filtered = filteredClassrooms;

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
              hintText: 'Search classrooms...',
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
                  'No classrooms found',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          )
              : GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.8,
            ),
            itemCount: filtered.length,
            itemBuilder: (context, index) {
              final classroom = filtered[index];
              return GestureDetector(
                onDoubleTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EnlargedImagePage(classroom: classroom),
                    ),
                  );
                },
                child: Card(
                  elevation: 4,
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Image.network(
                          classroom.imageUrl,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Colors.grey.shade300,
                              child: const Center(
                                child: Icon(Icons.image_not_supported, size: 50),
                              ),
                            );
                          },
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes != null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              classroom.name,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Double-tap to enlarge',
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.grey.shade600,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ],
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