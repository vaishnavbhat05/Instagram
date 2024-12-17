import 'package:flutter/material.dart';

class ExploreGrid extends StatelessWidget {
  const ExploreGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: 20,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              color: Colors.deepPurple[100],
            ),
          );
        });
  }
}
// import 'package:flutter/material.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
//
// class ExploreGrid extends StatelessWidget {
//   const ExploreGrid({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Staggered Grid Example"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: StaggeredGrid.count(
//           crossAxisCount: 4, // Number of columns
//           mainAxisSpacing: 4, // Spacing between rows
//           crossAxisSpacing: 4, // Spacing between columns
//           children: const [
//             StaggeredGridTile.count(
//               crossAxisCellCount: 2,
//               mainAxisCellCount: 2,
//               child: Tile(index: 0),
//             ),
//             StaggeredGridTile.count(
//               crossAxisCellCount: 2,
//               mainAxisCellCount: 1,
//               child: Tile(index: 1),
//             ),
//             StaggeredGridTile.count(
//               crossAxisCellCount: 1,
//               mainAxisCellCount: 1,
//               child: Tile(index: 2),
//             ),
//             StaggeredGridTile.count(
//               crossAxisCellCount: 1,
//               mainAxisCellCount: 1,
//               child: Tile(index: 3),
//             ),
//             StaggeredGridTile.count(
//               crossAxisCellCount: 4,
//               mainAxisCellCount: 2,
//               child: Tile(index: 4),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class Tile extends StatelessWidget {
//   final int index;
//
//   const Tile({super.key, required this.index});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.deepPurple[100 + (index * 100) % 900], // Dynamic colors
//       child: Center(
//         child: Text(
//           'Tile $index',
//           style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//         ),
//       ),
//     );
//   }
// }

