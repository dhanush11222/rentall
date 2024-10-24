
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  // Controller for the search bar
  TextEditingController searchController = TextEditingController();
  List<bool> isFavoriteList = [false, false, false, false,];
  // Original list of locations
  List<Map<String, String>> locations = [
    {'name': 'India', 'image': 'https://images.pexels.com/photos/1007431/pexels-photo-1007431.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'},
    {'name': 'USA', 'image': 'https://images.pexels.com/photos/2240293/pexels-photo-2240293.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'},
    {'name': 'Tokyo', 'image': 'https://images.pexels.com/photos/161251/senso-ji-temple-japan-kyoto-landmark-161251.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'},
    {'name': 'London', 'image': 'https://images.pexels.com/photos/1427578/pexels-photo-1427578.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'},
    {'name': 'Korea', 'image': 'https://images.pexels.com/photos/29013548/pexels-photo-29013548/free-photo-of-traditional-guard-at-gyeongbokgung-palace-seoul.jpeg'},
  ];

  // Filtered list of locations
  List<Map<String, String>> filteredLocations = [];

  @override
  void initState() {
    super.initState();
    // Initially, display all locations
    filteredLocations = locations;
  }
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }



  void filterLocations(String query) {
    List<Map<String, String>> tempList = [];
    if (query.isNotEmpty) {
      tempList = locations
          .where((location) => location['name']!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    } else {
      tempList = locations;
    }

    print("Query: $query");  // Check what is being searched
    print("Filtered Locations: ${tempList.length}");  // Check filtered locations

    setState(() {
      filteredLocations = tempList;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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

              // Row containing Search and Filter
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
                              controller: searchController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Where did you go?',
                              ),
                              onChanged: (value) {
                                filterLocations(value);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  // Filter icon
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

              // Popular locations title
              Text(
                "Popular Locations",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.05,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),

              // Scrollable row of filtered locations
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: filteredLocations.map((location) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: buildLocationCard(location['name']!, location['image']!),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 30),

              // Recommended section title
              Text(
                "Recommended",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.05,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              buildRecommendedSection(),
              SizedBox(height: 20),
              Text(
                "MostViewed",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.05,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              buildMostViewedSection(),
            ],
          ),
        ),
      ),
    );
  }

  // Method to build location card
  Widget buildLocationCard(String locationName, String imageUrl) {
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
            child: Image.network(
              imageUrl,
              width: 120,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),

          SizedBox(height: 8),
          Positioned(
            bottom: 8,
            left: 25,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
              color: Colors.black54,
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

  // Method to build the recommended section
  Widget buildRecommendedSection() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          buildRecommendedCard(
            index: 0,
            imagePath: 'https://images.pexels.com/photos/2467558/pexels-photo-2467558.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
            price: "\$120/Night",
            rating: "4.0",
            location: "Carinthia Lake See",
            roomInfo: "Private room / 4 beds",
          ),

          buildRecommendedCard(
            index: 1,
            imagePath: 'https://images.pexels.com/photos/1268855/pexels-photo-1268855.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
            price: "\$150/Night",
            rating: "4.5",
            location: "Santorini Island Resort",
            roomInfo: "Private room / 2 beds",
          ),

          buildRecommendedCard(
            index: 2,
            imagePath: 'https://images.pexels.com/photos/258154/pexels-photo-258154.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
            price: "\$180/Night",
            rating: "4.8",
            location: "Tokyo City Center Stay",
            roomInfo: "Private apartment / 1 bed",
          ),

          buildRecommendedCard(
            index: 3,
            imagePath: 'https://images.pexels.com/photos/3225531/pexels-photo-3225531.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
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
      width: 230,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  imagePath,
                  width: 200,
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
                      isFavoriteList[index] = !isFavoriteList[index]; // Toggle favorite state
                    });
                  },
                  child: CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.favorite,
                      color: isFavoriteList[index] ? Colors.red : Colors.grey,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Text(
                location,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 10),
              Icon(Icons.star, color: Colors.yellow, size: 16),
              SizedBox(width: 4),
              Text(rating),
            ],
          ),
          SizedBox(height: 4),
          Text(
            roomInfo,
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(height: 4),
          Text(
            price,
            style: TextStyle(
              color: Colors.green,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMostViewedSection() {
    return SingleChildScrollView(
      child: Column(
        children: [
          buildMostViewedCard(
            index: 0,
            imagePath: 'https://images.pexels.com/photos/2467558/pexels-photo-2467558.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
            price: "\$120/Night",
            rating: "4.0",
            location: "the Burj Al Arab",
            roomInfo: "Private room / 4 beds",
          ),
          SizedBox(width: 10),
          buildMostViewedCard(
            index: 1,
            imagePath: 'https://images.pexels.com/photos/1268855/pexels-photo-1268855.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
            price: "\$150/Night",
            rating: "4.5",
            location: "Baskin-Robbins",
            roomInfo: "Private room / 2 beds",
          ),
          SizedBox(width: 10),
          buildMostViewedCard(
            index: 2,
            imagePath: 'https://images.pexels.com/photos/258154/pexels-photo-258154.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
            price: "\$180/Night",
            rating: "4.8",
            location: "Dairy Queen",
            roomInfo: "Private apartment / 1 bed",
          ),
          SizedBox(width: 10),
          buildMostViewedCard(
            index: 3,
            imagePath: 'https://images.pexels.com/photos/3225531/pexels-photo-3225531.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
            price: "\$100/Night",
            rating: "3.9",
            location: "Texas Roadhouse",
            roomInfo: "Entire cabin / 3 beds",
          ),
        ],
      ),
    );
  }






  Widget buildMostViewedCard({
    required int index,
    required String imagePath,
    required String price,
    required String rating,
    required String location,
    required String roomInfo,
  }) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = MediaQuery.of(context).size.width;
        double screenHeight = MediaQuery.of(context).size.height;

        return Container(
          width: screenWidth * 0.9, // 90% of screen width
          height: screenHeight * 0.3, // 30% of screen height
          decoration: BoxDecoration(
            color: Colors.white, // Placeholder color
            borderRadius: BorderRadius.circular(15),
          ),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      imagePath,
                      width: screenWidth * 0.9, // Full width of container
                      height: screenHeight * 0.18, // Reduce height a little
                      fit: BoxFit.cover,
                    ),

                  ),

                  SizedBox(height: 8),
                  Expanded( // Make the text and content dynamic
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  location,
                                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                ),
                              ),
                              Icon(Icons.star, color: Colors.red, size: 16),
                              SizedBox(width: 4),
                              Text(rating),
                            ],
                          ),
                          SizedBox(height: 4),
                          Text(
                            roomInfo,
                            style: TextStyle(color: Colors.grey),
                          ),
                          SizedBox(height: 4),
                          Text(
                            price,
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 8,
                right: 8,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isFavoriteList[index] = !isFavoriteList[index]; // Toggle favorite state
                    });
                  },
                  child: CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.favorite,
                      color: isFavoriteList[index] ? Colors.red : Colors.grey,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }




}

