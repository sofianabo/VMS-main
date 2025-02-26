// // ignore_for_file: camel_case_types

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../A-EX/API/getOneProducts.dart';
// import '../../A-EX/Model/ProductsModel.dart';
// import '../../A-EX/controller.dart/getAllProductsController.dart';


// class customSearch extends SearchDelegate {
//   // final pc = Get.put(OneProductController());
// //  getAllProductsController pro = Get.find();
//   String q = '';
//   late List<ProductsModel> filter;
//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     return [
//       IconButton(
//         icon: const Icon(Icons.close),
//         onPressed: () {
//           query = "";
//         },
//       )
//     ];
//   }

//   @override
//   Widget? buildLeading(BuildContext context) {
//     return IconButton(
//       icon: const Icon(Icons.arrow_back),
//       onPressed: () {
//         close(context, null);
//       },
//     );
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     return ListView.builder(
//       itemCount: filter.length,
//       itemBuilder: (context, index) {
//         if (filter[index].title == query) {
//           return Hero(
//             tag: '${filter[index].image}',
//             child: InkWell(
//               onTap: () async {
//               //  i = filter[index].id! - 1;
//               //  await getoneProductsAPI().getoneProducts(filter[index].id!);
//              //   await Get.to(() => productInfo());
//               },
//               child: Wrap(
//                 children: [
//                   Container(
//                     height: 100,
//                     width: 100,
//                     child: Image.network('${filter[index].image}'),
//                   ),
//                   Text('${filter[index].title}'),
//                 ],
//               ),
//             ),
//           );
//           // ignore: unrelated_type_equality_checks
//         } else if (query != q) {
//           return Hero(
//             tag: '${filter[index].image}',
//             child: InkWell(
//               onTap: () async {
//               //  i = filter[index].id! - 1;
//               //  await getoneProductsAPI().getoneProducts(filter[index].id!);

//               //  await Get.to(() => productInfo());
//               },
//               child: Wrap(
//                 children: [
//                   Container(
//                     height: 100,
//                     width: 100,
//                     child: Image.network('${filter[index].image}'),
//                   ),
//                   Text('${filter[index].title}'),
//                 ],
//               ),
//             ),
//           );
//         } else {
//           return Text("");
//         }
//       },
//     );
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     if (query == '') {
//       filter = pro.productsList;
//       return const Padding(
//         padding: EdgeInsets.all(8.0),
//         child: Center(child: CircularProgressIndicator()),
//       );
//     } else {
//       filter = pro.productsList
//           .where((element) => element.title!.contains(query))
//           .toList();

//       return ListView.builder(
//         itemCount: filter.length,
//         itemBuilder: (context, index) {
//           return InkWell(
//             onTap: () {
//               query = filter[index].title!;
//               q = query;
//               showResults(context);
//             },
//             child: ListTile(
//               title: Text("${filter[index].title}"),
//             ),
//           );
//         },
//       );
//     }
//   }
// }
