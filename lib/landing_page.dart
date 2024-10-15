import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  // Variable to track selected card
  int? selectedCardIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top text
              SafeArea(
                child: Text(
                  "Explore the world! By Traveling",
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.06,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Row containing Search and Filter containers
              Row(
                children: [

                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.search),
                          SizedBox(width: 10),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Where did you go?',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10),

                  // Filter container with only icon
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(Icons.filter_list),
                  ),
                ],
              ),
              SizedBox(height: 30),

              // Popular location text
              Text(
                "Popular Locations",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.05,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),

              // Scrollable Row of Locations
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    buildLocationCard(
                        'India',
                        'assets/images/india.png'
                    ),
                    SizedBox(width: 10),
                    buildLocationCard(
                        'USA',
                        'assets/images/usa.png'
                    ),
                    SizedBox(width: 10),
                    buildLocationCard(
                        'Tokyo',
                        'assets/images/tokoy.png'
                    ),
                    SizedBox(width: 10),
                    buildLocationCard(
                        'London',
                        'assets/images/london.png'
                    ),
                    SizedBox(width: 10),
                    buildLocationCard(
                        'Korea',
                        'assets/images/korea.jpeg'
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),

              // Recommended text
              Text(
                "Recommended",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.05,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),

              // Recommended section
              buildRecommendedSection(),

              SizedBox(height: 10),

              // Image and description for Most Viewed
              buildMostViewedSection('assets/images/adv.png'),
              SizedBox(height: 10), // Adjust spacing
              Text(
                "Most Viewed",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.05,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              buildRecommendedSectionn(),
            ],
          ),
        ),
      ),
    );

  }

  Widget buildLocationCard(String locationName, String imagePath) {
    return Container(
      width: 120,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.grey[200],
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              imagePath,
              width: 120,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 8,
            left: 8,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              child: Text(
                locationName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRecommendedSection() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          buildRecommendedCard(
            index: 0,
            imagePath: 'assets/images/r1.jpg',
            price: "\$120/Night",
            rating: "4.0",
            location: "Carinthia Lake See Breakfast",
            roomInfo: "Private room / 4 beds",
          ),
          SizedBox(width: 10),
          buildRecommendedCard(
            index: 1,
            imagePath: 'assets/images/r2.jpg',
            price: "\$150/Night",
            rating: "4.5",
            location: "Santorini Island Resort",
            roomInfo: "Private room / 2 beds",
          ),
          SizedBox(width: 10),
          buildRecommendedCard(
            index: 2,
            imagePath: 'assets/images/r3.jpg',
            price: "\$180/Night",
            rating: "4.8",
            location: "Tokyo City Center Stay",
            roomInfo: "Private apartment / 1 bed",
          ),
          SizedBox(width: 10),
          buildRecommendedCard(
            index: 3,
            imagePath: 'assets/images/r4.jpg',
            price: "\$100/Night",
            rating: "3.9",
            location: "Cozy Cabin in the Woods",
            roomInfo: "Entire cabin / 3 beds",
          ),
        ],
      ),
    );
  }



  Widget buildRecommendedCard({
    required int index,
    required String imagePath,
    required String price,
    required String rating,
    required String location,
    required String roomInfo,
  }) {
    return Container(
      width: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  imagePath,
                  width: double.infinity,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      // Toggle selection state
                      selectedCardIndex = selectedCardIndex == index ? null : index;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.all(8),
                    child: Icon(
                      selectedCardIndex == index
                          ? Icons.favorite // Filled heart when selected
                          : Icons.favorite_border, // Outline heart when not selected
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      price,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.red, size: 16),
                        SizedBox(width: 4),
                        Text(
                          rating,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Text(
                  location,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  roomInfo,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRecommendedSectionn() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          buildRecommendeddCard(
            index: 4,
            imagePath: 'assets/images/r8.jpg',
            price: "\$120/Night",
            rating: "4.0",
            location: "Carinthia Lake See Breakfast",
            roomInfo: "Private room / 4 beds",
          ),
          SizedBox(height: 10),
          buildRecommendeddCard(
            index: 5,
            imagePath: 'assets/images/r5.jpg',
            price: "\$150/Night",
            rating: "4.5",
            location: "Santorini Island Resort",
            roomInfo: "Private room / 2 beds",
          ),
          SizedBox(height: 10),
          buildRecommendeddCard(
            index: 6,
            imagePath: 'assets/images/r6.jpg',
            price: "\$180/Night",
            rating: "4.8",
            location: "Tokyo City Center Stay",
            roomInfo: "Private apartment / 1 bed",
          ),
          SizedBox(height: 10),
          buildRecommendeddCard(
            index: 7,
            imagePath: 'assets/images/r7.jpg',
            price: "\$100/Night",
            rating: "3.9",
            location: "Cozy Cabin in the Woods",
            roomInfo: "Entire cabin / 3 beds",
          ),
        ],
      ),
    );
  }

  // Recommended card with adaptive size
  Widget buildRecommendeddCard({
    required int index,
    required String imagePath,
    required String price,
    required String rating,
    required String location,
    required String roomInfo,
  }) {
    return Container(
      width: double.infinity, // Full width of parent
      height: 250, // Adjusted height for the card
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Stack for image and favorite icon
          Expanded(
            flex: 6,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    imagePath,
                    width: double.infinity,
                    height: double.infinity, // Image height adjusts within the container
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCardIndex = selectedCardIndex == index ? null : index;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.all(8),
                      child: Icon(
                        selectedCardIndex == index
                            ? Icons.favorite // Filled heart when selected
                            : Icons.favorite_border, // Outline heart when not selected
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8),

          // Price, rating, and description section
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        price,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.red, size: 16),
                          SizedBox(width: 4),
                          Text(
                            rating,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Text(
                    location,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    roomInfo,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget buildMostViewedSection(String imagePath) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double screenHeight = MediaQuery.of(context).size.height;
        double screenWidth = MediaQuery.of(context).size.width;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                imagePath,
                width: screenWidth * 0.9, // 90% of the screen width
                height: screenHeight * 0.3, // 30% of the screen height
                fit: BoxFit.cover, // Changed to cover to maintain aspect ratio
              ),
            ),
          ],
        );
      },
    );
  }

}
