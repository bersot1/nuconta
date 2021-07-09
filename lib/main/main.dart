import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:provider/provider.dart';

import '../ui/components/app_theme.dart';
import 'factories/pages/pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Provider.debugCheckInvalidValueType = null;

  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final routeObserver = Get.put<RouteObserver>(RouteObserver<PageRoute>());
    return GetMaterialApp(
      title: 'NuConta',
      debugShowCheckedModeBanner: false,
      theme: makeAppTheme(),
      initialRoute: '/',
      navigatorObservers: [routeObserver],
      getPages: [
        GetPage(
          name: '/',
          page: () => makeSplashPage(),
        ),
        GetPage(
          name: '/login',
          page: () => makeLoginPage(),
        ),
        GetPage(name: '/home', page: () => makeHomePageFactory())
      ],
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:graphql_flutter/graphql_flutter.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   final query = """
//   {
//   viewer {
//     id
//     name
//     balance
//     }
// }""";

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           ElevatedButton(
//             onPressed: () {
//               final HttpLink httpLink = HttpLink(
//                   'https://staging-nu-needful-things.nubank.com.br/query',
//                   defaultHeaders: {
//                     'content': 'application/json',
//                     'authorization':
//                         'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhd2Vzb21lY3VzdG9tZXJAZ21haWwuY29tIn0.cGT2KqtmT8KNIJhyww3T8fAzUsCD5_vxuHl5WbXtp8c'
//                   });

//               ValueNotifier<GraphQLClient> client = ValueNotifier(
//                 GraphQLClient(
//                     link: httpLink,
//                     cache: GraphQLCache(store: InMemoryStore())),
//               );

//               GraphQLProvider(
//                 client: client,
//                 child: Query(
//                   options: QueryOptions(document: gql(query)),
//                   builder: (QueryResult result, {fetchMore, refetch}) {
//                     if (result.hasException) {
//                       return Text('hasExepction');
//                     }

//                     if (result.isLoading) {
//                       return Center(
//                         child: CircularProgressIndicator(),
//                       );
//                     }

//                     print(result);

//                     return Text('something');
//                   },
//                 ),
//               );
//             },
//             child: Text("Auth"),
//           ),
//         ],
//       ),
//     );
//   }
// }
