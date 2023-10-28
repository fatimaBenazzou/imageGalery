import 'package:flutter/material.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Galerie d\'images'),
      ),
      body: 
      GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
        ),
        itemCount: 5, // Remplacez ceci par le nombre d'images que vous avez
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              _showImagePopup(context, index);
            },
            child: Image.asset(
              'images/image$index.jpg',
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }

 void _showImagePopup(BuildContext context, int index) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      int currentImageIndex = index;

      void goToNextImage() {
        if (currentImageIndex < 4) {
          Navigator.of(context).pop();
          _showImagePopup(context, currentImageIndex + 1);
        }
      }

      void goToPreviousImage() {
        if (currentImageIndex > 0) {
          Navigator.of(context).pop();
          _showImagePopup(context, currentImageIndex - 1);
        }
      }

      return Dialog(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              Expanded(
                child: Image.asset(
                  'images/image$currentImageIndex.jpg',
                  fit: BoxFit.contain,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: goToPreviousImage,
                  ),
                  IconButton(
                    icon: const Icon(Icons.arrow_forward),
                    onPressed: goToNextImage,
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}

}
