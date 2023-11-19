import 'package:flutter/material.dart';

class SeeReviews extends StatelessWidget {
  const SeeReviews({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop Reviews', style: TextStyle(fontSize: 24)),
        centerTitle: true,
        backgroundColor: const Color(0xFF0E5C46),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '4.5/5',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  '589 reviews',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildStarRow(5, 491, 15.0),
            _buildStarRow(4, 40, 15.0),
            _buildStarRow(3, 32, 15.0),
            _buildStarRow(2, 19, 15.0),
            _buildStarRow(1, 7, 15.0),
            const SizedBox(height: 16),
            _buildReviewItem('assets/profile.jpg','John Doe', '2023-03-18', 5, 'Nice shop! The best so far.'),
            const Divider(height: 2,color: Colors.black),
            _buildReviewItem('assets/iconPic.jpg','Jane Smith', '2023-03-25', 5,
                'They really handle my clothes with care!'),
              const Divider(height: 2,color: Colors.black),
            _buildReviewItem('assets/profile2.jpg','Michelle Dee', '2023-05-17', 5, 'Great service!'),
            const Divider(height: 2,color: Colors.black),
            _buildReviewItem('assets/iconPic.jpg','Jennica Cole', '2023-08-07', 4, 'Great service!'),
            const Divider(height: 2,color: Colors.black),
            _buildReviewItem('assets/profile3.jpg','Daniel Ford', '2023-10-10', 4, 'Great service!'),
            const Divider(height: 2,color: Colors.black),
            _buildReviewItem('assets/iconPic.jpg','Janna Isidro', '2023-11-30', 3, 'Did not fold my clothes right.'),
            const Divider(height: 2,color: Colors.black),
            _buildReviewItem('assets/iconPic.jpg','Liza Cruz', '2023-12-12', 2, 'Okay lang'),
          ],
        ),
      ),
    );
  }

  Widget _buildStarRow(int rate, int progress, double starSize) {
    return Row(
      children: [
        Text(
          '$rate stars',
          style: const TextStyle(fontSize: 16),
        ),
        Row(
          children: List.generate(
            rate,
            (index) => Icon(
              Icons.star,
              color: Colors.amber,
              size: starSize,
            ),
          ),
        ),
        Expanded(
          child: LinearProgressIndicator(
            value: progress / 100,
          ),
        ),
        const SizedBox(width: 8), 
        Text(
          '$progress',
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  Widget _buildReviewItem(String image, String name, String date, int rate, String review) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(image),
              backgroundColor: Colors.grey,
              radius: 20,
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  date,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
            const Spacer(),
            Row(
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 16,
                ),
                const SizedBox(width: 4),
                Text(
                  '$rate stars',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                review,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
