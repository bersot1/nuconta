import 'package:graphql_flutter/graphql_flutter.dart';

import '../../domain/usecases/usecases.dart';

class GraphQLLink implements IHttpLink {
  final String url;
  final Map<String, String> defaultHeaders;

  GraphQLLink({required this.url, required this.defaultHeaders});

  HttpLink getLink() {
    return HttpLink(url, defaultHeaders: defaultHeaders);
  }
}
