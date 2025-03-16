import 'package:flutter/material.dart';
import 'package:listview_assignment/components/profileCard.dart';

class AppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  final Function(String) onSearch;

  const AppBarWidget({super.key, required this.onSearch});

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _AppBarWidgetState extends State<AppBarWidget> {
  final String profileImage =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRo03qI8I9e6YyLjjNryIjw7mJYBIyYmyh7cUfIN_rBCPwgFyrN-piafos4XNhvqrgWjOk&usqp=CAU';

  bool isSearching = false; // Track search state
  TextEditingController searchController = TextEditingController();

  void _toggleSearch() {
    setState(() {
      isSearching = !isSearching;
      if (!isSearching) {
        searchController.clear(); // Clear text when exiting search
        widget.onSearch("");
      }
    });
  }

  void _showProfileDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          width: 300,
          height: 350,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: ProfileCard(imageUrl: profileImage),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: GestureDetector(
        onTap: () => _showProfileDialog(context),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Hero(
            tag: 'profileHero',
            child: CircleAvatar(
              backgroundImage: NetworkImage(profileImage),
            ),
          ),
        ),
      ),
      title: isSearching
          ? Container(
              height: 40,
              child: TextFormField(
                controller: searchController,
                onChanged: widget.onSearch,
                decoration: InputDecoration(
                  hintText: "Search...",
                  hintStyle: TextStyle(color: Colors.grey[600]),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  prefixIcon: GestureDetector(
                    onTap: _toggleSearch, // Toggle back to normal mode
                    child: const Icon(Icons.search, color: Colors.black),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                ),
              ),
            )
          : Row(
              children: [
                Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.shade200,
                  ),
                  child: GestureDetector(
                    onTap: _toggleSearch, // Show search field
                    child: const Icon(Icons.search, color: Colors.black),
                  ),
                ),
                const Expanded(
                  child: Center(
                    child: Text(
                      'Chat',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
      actions: isSearching
          ? []
          : [
              Container(
                height: 45,
                width: 45,
                margin: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade200,
                ),
                child: IconButton(
                  icon: const Icon(Icons.person, color: Colors.black),
                  onPressed: () {},
                ),
              ),
              Container(
                height: 45,
                width: 45,
                margin: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade200,
                ),
                child: IconButton(
                  icon: const Icon(Icons.more_vert, color: Colors.black),
                  onPressed: () {},
                ),
              ),
            ],
    );
  }
}
