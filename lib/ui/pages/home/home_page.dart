import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';

import '../../../ui/components/components.dart';
import '../../../ui/helpers/constants.dart';
import '../../../ui/mixins/mixins.dart';
import '../../../ui/pages/home/components/components.dart';
import '../../../ui/ui.dart';

import '../../../data/models/models.dart';

class HomePage extends StatefulWidget {
  final IHomePresenter presenter;

  HomePage({required this.presenter});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ViewerModel viewer;

  @override
  Widget build(BuildContext context) {
    final MediaQueryTools mediaQuery = MediaQueryTools.of(context);

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Builder(
        builder: (context) {
          return GraphQLProvider(
            client: widget.presenter.client(),
            child: Query(
              options: QueryOptions(document: gql(query)),
              builder: (QueryResult result, {fetchMore, refetch}) {
                if (result.hasException) {
                  return Center(child: Text('hasExepction'));
                }

                if (result.isLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                viewer = ViewerModel.fromJson(result.data?["viewer"]);

                print(viewer.balance);

                return HomeContent(
                  mediaQuery: mediaQuery,
                  viewer: viewer,
                  presenter: widget.presenter,
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class HomeContent extends StatefulWidget {
  HomeContent({
    required this.mediaQuery,
    required this.viewer,
    required this.presenter,
  });

  final MediaQueryTools mediaQuery;
  final ViewerModel viewer;
  final IHomePresenter presenter;

  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> with NavigationManager {
  _saveBallance() async {
    await widget.presenter.saveBalance(widget.viewer.balance.toDouble());
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        handleNavigation(widget.presenter.navigateToStream, clear: true);
        _saveBallance();

        widget.presenter.mainErrorStream?.listen((error) {
          showErrorMessage(context, error!);
        });

        widget.presenter.isSuccessBuyStream?.listen((isSuccessBuy) {
          if (isSuccessBuy != null && isSuccessBuy == false) {
            showErrorMessage(context, "Saldo insuficiente.");
          }
        });

        return SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: widget.mediaQuery.height(30),
              horizontal: widget.mediaQuery.width(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Provider(
                  create: (context) => widget.presenter,
                  child: Header(
                    mediaQuery: widget.mediaQuery,
                    nameUser: "Olá ${widget.viewer.name}",
                  ),
                ),
                SizedBox(height: widget.mediaQuery.height(20)),
                Provider(
                  create: (context) => widget.presenter,
                  child: CardBalance(
                    mediaQuery: widget.mediaQuery,
                  ),
                ),
                TitleOffer(mediaQuery: widget.mediaQuery),
                Provider(
                  create: (context) => widget.presenter,
                  child: ListOferts(
                    mediaQuery: widget.mediaQuery,
                    offers: widget.viewer.offers,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
