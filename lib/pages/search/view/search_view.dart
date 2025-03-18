import 'package:bir_bir/pages/search/widgets/search_header.dart';
import '../../../../assets/app_colors.dart';
import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SearchHeader(
                bgColor: AppColors.white,
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColors.white,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    RecommendationCard(
                      widget: Container(
                        color: Theme.of(context).colorScheme.secondary,
                        child: const Icon(
                          color: AppColors.grey,
                          Icons.refresh,
                          size: 20,
                        ),
                      ),
                      onTap: () {},
                    ),
                    RecommendationCard(
                      widget: Container(
                        color: Theme.of(context).colorScheme.secondary,
                        child: const Icon(
                          color: AppColors.grey,
                          Icons.refresh,
                          size: 20,
                        ),
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              const Text(
                'Популаярно',
                style: TextStyle(color: AppColors.grey, fontSize: 18),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColors.white,
                ),
                child: Column(
                  children: [
                    RecommendationCard(
                      widget: Image.network(
                        'https://olcha.uz/image/700x700/products/2022-06-22/detskie-bodi-15928-15931-9-mesyatsev-goluboy-60924-0.jpeg',
                        height: 30,
                      ),
                      onTap: () {},
                    ),
                    RecommendationCard(
                      widget: Image.network(
                        'https://olcha.uz/image/700x700/products/2022-06-22/detskie-bodi-15928-15931-9-mesyatsev-goluboy-60924-0.jpeg',
                        height: 30,
                      ),
                      onTap: () {},
                    ),
                    RecommendationCard(
                      widget: Image.network(
                        'https://olcha.uz/image/700x700/products/2022-06-22/detskie-bodi-15928-15931-9-mesyatsev-goluboy-60924-0.jpeg',
                        height: 30,
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// class SearchContainer extends StatefulWidget {
//   const SearchContainer({super.key});

//   @override
//   State<SearchContainer> createState() => _SearchContainerState();
// }

// class _SearchContainerState extends State<SearchContainer> {
//   TextEditingController _controller = TextEditingController();
//   String textValue = '';
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         const Padding(
//           padding: EdgeInsets.all(5),
//           child: Icon(
//             Icons.search,
//             color: Colors.grey,
//           ),
//         ),
//         Expanded(
//           child: TextField(
//             controller: _controller,
//             onChanged: (value) {
//               setState(() {
//                 textValue = value;
//               });
//             },
//             decoration: const InputDecoration(
//               hintText: 'кросовки Nike',
//               border: InputBorder.none,
//               hintStyle: TextStyle(color: Colors.grey),
//             ),
//           ),
//         )
//       ],
//     );
//   }
// }

class RecommendationCard extends StatelessWidget {
  const RecommendationCard({
    super.key,
    required this.widget,
    this.mainTitle = 'Main',
    this.subTitle = 'Sub Title',
    required this.onTap,
  });

  final Widget widget;
  final String mainTitle;
  final String subTitle;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(15),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: SizedBox(
                  height: 35,
                  width: 35,
                  child: widget,
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    mainTitle,
                    style: const TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    subTitle,
                    style: const TextStyle(fontSize: 13, color: Colors.grey),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
