// screens/enlarged_image_page.dart
import 'package:flutter/material.dart';
import '../models/classroom_image.dart';

class EnlargedImagePage extends StatelessWidget {
  final ClassroomImage classroom;

  const EnlargedImagePage({Key? key, required this.classroom}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(classroom.name),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: InteractiveViewer(
              minScale: 0.5,
              maxScale: 4.0,
              child: Center(
                child: Image.network(
                  classroom.imageUrl,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(
                      child: Icon(
                        Icons.image_not_supported,
                        size: 100,
                        color: Colors.white,
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
                        color: Colors.white,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Container(
            color: Colors.black87,
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  classroom.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  classroom.description,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Pinch to zoom • Drag to pan',
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: 12,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}