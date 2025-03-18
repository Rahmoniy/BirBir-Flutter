import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchHeader extends StatelessWidget {
  const SearchHeader({super.key, required this.bgColor});

  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // IconButton(
        //     onPressed: () {}, icon: const Icon(Icons.arrow_back)),
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: () {
              GoRouter.of(context).pop();
            },
            child: const Icon(Icons.arrow_back),
          ),
        ),
        Expanded(
          child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 2,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: bgColor,
              ),
              child: const SearchContainer()),
        )
      ],
    );
  }
}

class SearchContainer extends StatefulWidget {
  const SearchContainer({super.key});

  @override
  State<SearchContainer> createState() => _SearchContainerState();
}

class _SearchContainerState extends State<SearchContainer> {
  final TextEditingController _controller = TextEditingController();
  String textValue = '';
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Padding(
          padding: EdgeInsets.all(5),
          child: Icon(
            Icons.search,
            color: Colors.grey,
          ),
        ),
        Expanded(
          child: TextField(
            controller: _controller,
            onChanged: (value) {
              setState(() {
                textValue = value;
              });
            },
            decoration: const InputDecoration(
              hintText: 'кросовки Nike',
              border: InputBorder.none,
              hintStyle: TextStyle(color: Colors.grey),
            ),
          ),
        )
      ],
    );
  }
}
