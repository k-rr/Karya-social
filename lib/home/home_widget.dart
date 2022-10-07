import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_expanded_image_view.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:page_transition/page_transition.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  PageController? pageViewController;
  PagingController<DocumentSnapshot?, UserPostsRecord>? _pagingController;
  Query? _pagingQuery;
  List<StreamSubscription?> _streamSubscriptions = [];

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    _streamSubscriptions.forEach((s) => s?.cancel());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: true,
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: double.infinity,
                height: 500,
                child: PageView(
                  controller: pageViewController ??=
                      PageController(initialPage: 0),
                  scrollDirection: Axis.horizontal,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 2,
                                    height:
                                        MediaQuery.of(context).size.height * 7,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFFEFEFE),
                                    ),
                                    child: Stack(
                                      children: [
                                        SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(5, 5, 5, 5),
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: 50,
                                                  decoration: BoxDecoration(),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -0.95, 0.1),
                                                        child:
                                                            AuthUserStreamWidget(
                                                          child: Text(
                                                            'Wellcome, ${currentUserDisplayName}',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Handlee',
                                                                  color: Color(
                                                                      0x860990CF),
                                                                  fontSize: 22,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w800,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.2, 0.7),
                                                        child:
                                                            FlutterFlowIconButton(
                                                          borderColor: Colors
                                                              .transparent,
                                                          borderRadius: 30,
                                                          borderWidth: 1,
                                                          buttonSize: 60,
                                                          icon: Icon(
                                                            Icons.chat,
                                                            color: Colors.black,
                                                            size: 30,
                                                          ),
                                                          onPressed: () {
                                                            print(
                                                                'IconButton pressed ...');
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(5, 5, 5, 5),
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: 85,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFEEEEEE),
                                                  ),
                                                  child: ListView(
                                                    padding: EdgeInsets.zero,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -0.35, 0),
                                                        child: Container(
                                                          width: 100,
                                                          height: 100,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xFFEEEEEE),
                                                            shape: BoxShape
                                                                .rectangle,
                                                          ),
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -0.3, 0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          -0.15,
                                                                          -0.45),
                                                                  child:
                                                                      AuthUserStreamWidget(
                                                                    child: StreamBuilder<
                                                                        List<
                                                                            UserPostsRecord>>(
                                                                      stream:
                                                                          queryUserPostsRecord(
                                                                        queryBuilder: (userPostsRecord) => userPostsRecord.where(
                                                                            'user_img',
                                                                            isEqualTo:
                                                                                currentUserReference),
                                                                        singleRecord:
                                                                            true,
                                                                      ),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
                                                                              width: 50,
                                                                              height: 50,
                                                                              child: CircularProgressIndicator(
                                                                                color: FlutterFlowTheme.of(context).primaryColor,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }
                                                                        List<UserPostsRecord>
                                                                            circleImageUserPostsRecordList =
                                                                            snapshot.data!;
                                                                        final circleImageUserPostsRecord = circleImageUserPostsRecordList.isNotEmpty
                                                                            ? circleImageUserPostsRecordList.first
                                                                            : null;
                                                                        return InkWell(
                                                                          onTap:
                                                                              () async {
                                                                            context.pushNamed('ProfilePage');
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                100,
                                                                            height:
                                                                                100,
                                                                            clipBehavior:
                                                                                Clip.antiAlias,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              shape: BoxShape.circle,
                                                                            ),
                                                                            child:
                                                                                Image.network(
                                                                              currentUserPhoto,
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        width: 100,
                                                        height: 100,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFFEEEEEE),
                                                          shape: BoxShape
                                                              .rectangle,
                                                        ),
                                                        child: Container(
                                                          width: 100,
                                                          height: 100,
                                                          clipBehavior:
                                                              Clip.antiAlias,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: Image.network(
                                                            'https://data.whicdn.com/images/277852662/original.jpg',
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        width: 100,
                                                        height: 100,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFFEEEEEE),
                                                          shape: BoxShape
                                                              .rectangle,
                                                        ),
                                                        child: Container(
                                                          width: 120,
                                                          height: 120,
                                                          clipBehavior:
                                                              Clip.antiAlias,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: Image.network(
                                                            'https://i.redd.it/39sunkhvpw341.jpg',
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        width: 100,
                                                        height: 100,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFFEEEEEE),
                                                          shape: BoxShape
                                                              .rectangle,
                                                        ),
                                                        child: Container(
                                                          width: 120,
                                                          height: 120,
                                                          clipBehavior:
                                                              Clip.antiAlias,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: Image.network(
                                                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-GJlQYDNChvIzt5friPce3IYIofEoWfAMCw&usqp=CAU',
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        width: 100,
                                                        height: 100,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFFEEEEEE),
                                                          shape: BoxShape
                                                              .rectangle,
                                                        ),
                                                        child: Container(
                                                          width: 120,
                                                          height: 120,
                                                          clipBehavior:
                                                              Clip.antiAlias,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: Image.network(
                                                            'https://i.pinimg.com/474x/c9/59/74/c95974cecfc101ca950ef1942f46222b.jpg',
                                                            fit: BoxFit.contain,
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        width: 100,
                                                        height: 100,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFFEEEEEE),
                                                          shape: BoxShape
                                                              .rectangle,
                                                        ),
                                                        child: Container(
                                                          width: 120,
                                                          height: 120,
                                                          clipBehavior:
                                                              Clip.antiAlias,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: Image.network(
                                                            'https://i.pinimg.com/474x/0e/5d/7c/0e5d7c7a38c3fd88dc5fb1f96b0d3118.jpg',
                                                            fit: BoxFit.contain,
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        width: 100,
                                                        height: 100,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFFEEEEEE),
                                                          shape: BoxShape
                                                              .rectangle,
                                                        ),
                                                        child: Container(
                                                          width: 120,
                                                          height: 120,
                                                          clipBehavior:
                                                              Clip.antiAlias,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: Image.network(
                                                            'https://cdn-0.generatormix.com/images/model/adriana-lima.jpg',
                                                            fit: BoxFit.contain,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  StreamBuilder<
                                                      List<UserRecord>>(
                                                    stream: queryUserRecord(
                                                      singleRecord: true,
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 50,
                                                            height: 50,
                                                            child:
                                                                CircularProgressIndicator(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryColor,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<UserRecord>
                                                          circleImageUserRecordList =
                                                          snapshot.data!;
                                                      final circleImageUserRecord =
                                                          circleImageUserRecordList
                                                                  .isNotEmpty
                                                              ? circleImageUserRecordList
                                                                  .first
                                                              : null;
                                                      return Container(
                                                        width: 60,
                                                        height: 60,
                                                        clipBehavior:
                                                            Clip.antiAlias,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: Image.network(
                                                          'https://picsum.photos/seed/233/600',
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                  AuthUserStreamWidget(
                                                    child: Text(
                                                      currentUserDisplayName,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        PagedListView<
                                            DocumentSnapshot<Object?>?,
                                            UserPostsRecord>(
                                          pagingController: () {
                                            final Query<Object?> Function(
                                                    Query<Object?>)
                                                queryBuilder =
                                                (userPostsRecord) =>
                                                    userPostsRecord;
                                            if (_pagingController != null) {
                                              final query = queryBuilder(
                                                  UserPostsRecord.collection());
                                              if (query != _pagingQuery) {
                                                // The query has changed
                                                _pagingQuery = query;
                                                _streamSubscriptions.forEach(
                                                    (s) => s?.cancel());
                                                _streamSubscriptions.clear();
                                                _pagingController!.refresh();
                                              }
                                              return _pagingController!;
                                            }

                                            _pagingController =
                                                PagingController(
                                                    firstPageKey: null);
                                            _pagingQuery = queryBuilder(
                                                UserPostsRecord.collection());
                                            _pagingController!
                                                .addPageRequestListener(
                                                    (nextPageMarker) {
                                              queryUserPostsRecordPage(
                                                queryBuilder:
                                                    (userPostsRecord) =>
                                                        userPostsRecord,
                                                nextPageMarker: nextPageMarker,
                                                pageSize: 25,
                                                isStream: true,
                                              ).then((page) {
                                                _pagingController!.appendPage(
                                                  page.data,
                                                  page.nextPageMarker,
                                                );
                                                final streamSubscription = page
                                                    .dataStream
                                                    ?.listen((data) {
                                                  final itemIndexes =
                                                      _pagingController!
                                                          .itemList!
                                                          .asMap()
                                                          .map((k, v) =>
                                                              MapEntry(
                                                                  v.reference
                                                                      .id,
                                                                  k));
                                                  data.forEach((item) {
                                                    final index = itemIndexes[
                                                        item.reference.id];
                                                    final items =
                                                        _pagingController!
                                                            .itemList!;
                                                    if (index != null) {
                                                      items.replaceRange(index,
                                                          index + 1, [item]);
                                                      _pagingController!
                                                          .itemList = {
                                                        for (var item in items)
                                                          item.reference: item
                                                      }.values.toList();
                                                    }
                                                  });
                                                  setState(() {});
                                                });
                                                _streamSubscriptions
                                                    .add(streamSubscription);
                                              });
                                            });
                                            return _pagingController!;
                                          }(),
                                          padding: EdgeInsets.zero,
                                          scrollDirection: Axis.vertical,
                                          builderDelegate:
                                              PagedChildBuilderDelegate<
                                                  UserPostsRecord>(
                                            // Customize what your widget looks like when it's loading the first page.
                                            firstPageProgressIndicatorBuilder:
                                                (_) => Center(
                                              child: SizedBox(
                                                width: 50,
                                                height: 50,
                                                child:
                                                    CircularProgressIndicator(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                ),
                                              ),
                                            ),

                                            itemBuilder:
                                                (context, _, listViewIndex) {
                                              final listViewUserPostsRecord =
                                                  _pagingController!
                                                      .itemList![listViewIndex];
                                              return Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 210, 0, 0),
                                                child: InkWell(
                                                  onTap: () async {
                                                    await Navigator.push(
                                                      context,
                                                      PageTransition(
                                                        type: PageTransitionType
                                                            .fade,
                                                        child:
                                                            FlutterFlowExpandedImageView(
                                                          image: Image.network(
                                                            listViewUserPostsRecord
                                                                .postImage!,
                                                            fit: BoxFit.contain,
                                                          ),
                                                          allowRotation: false,
                                                          tag:
                                                              listViewUserPostsRecord
                                                                  .postImage!,
                                                          useHeroAnimation:
                                                              true,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  child: Hero(
                                                    tag: listViewUserPostsRecord
                                                        .postImage!,
                                                    transitionOnUserGestures:
                                                        true,
                                                    child: Image.network(
                                                      listViewUserPostsRecord
                                                          .postImage!,
                                                      width: double.infinity,
                                                      height: 300,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
