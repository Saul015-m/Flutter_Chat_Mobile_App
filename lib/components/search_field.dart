import 'package:flutter/material.dart';

class SearchField extends StatefulWidget {
  final ValueChanged<String>? onChanged;

  const SearchField({
    super.key,
    this.onChanged,
  });

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final TextEditingController _searchController = TextEditingController();
  bool _showClearIcon = false;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onTextChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    setState(() {
      _showClearIcon = _searchController.text.isNotEmpty;
    });
    widget.onChanged?.call(_searchController.text);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _searchController,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        hintText: 'Search...',
        prefixIcon: const Padding(
          padding: EdgeInsets.only(left: 20, right: 10),
          child: Icon(Icons.search),
        ),
        filled: true,
        fillColor: const Color.fromRGBO(235, 224, 255, 1.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 70, 50, 93),
            width: 2.0,
          ),
        ),
        suffixIcon: _showClearIcon
            ? IconButton(
                icon: const Icon(
                  Icons.cancel_sharp,
                  size: 18,
                ),
                onPressed: () {
                  _searchController.clear();
                },
              )
            : null,
      ),
    );
  }
}
