import '../../../data/usecases/usecases.dart';

import '../../../domain/usecases/usecases.dart';

IHttpLink makeHttpLinkFactory() {
  return GraphQLLink(
      url: 'https://staging-nu-needful-things.nubank.com.br/query',
      defaultHeaders: makeDefaultHeaders());
}

Map<String, String> makeDefaultHeaders() {
  return {
    'content': 'application/json',
    'authorization':
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhd2Vzb21lY3VzdG9tZXJAZ21haWwuY29tIn0.cGT2KqtmT8KNIJhyww3T8fAzUsCD5_vxuHl5WbXtp8c'
  };
}
