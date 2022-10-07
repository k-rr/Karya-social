import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_media_display.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_video_player.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';

class FeedpageWidget extends StatefulWidget {
  const FeedpageWidget({Key? key}) : super(key: key);

  @override
  _FeedpageWidgetState createState() => _FeedpageWidgetState();
}

class _FeedpageWidgetState extends State<FeedpageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 3,
                      color: Color(0x3A000000),
                      offset: Offset(0, 1),
                    )
                  ],
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                                child: AuthUserStreamWidget(
                                  child: InkWell(
                                    onTap: () async {
                                      context.pushNamed('ProfilePage');
                                    },
                                    child: Container(
                                      width: 40,
                                      height: 40,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.network(
                                        currentUserPhoto,
                                        fit: BoxFit.fitHeight,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-0.2, -0.35),
                                child: AuthUserStreamWidget(
                                  child: Text(
                                    currentUserDisplayName,
                                    style: FlutterFlowTheme.of(context)
                                        .subtitle1
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                        ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-0.85, -0.9),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      60, 0, 0, 0),
                                  child: InkWell(
                                    onTap: () async {
                                      context.pushNamed('audioChatDemo');
                                    },
                                    child: Icon(
                                      Icons.maps_ugc,
                                      color:
                                          FlutterFlowTheme.of(context).gray600,
                                      size: 24,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 90,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 10, 10, 10),
                                  child: StreamBuilder<List<StoriesRecord>>(
                                    stream: queryStoriesRecord(
                                      queryBuilder: (storiesRecord) =>
                                          storiesRecord.where('user_name',
                                              isEqualTo: currentUserReference),
                                      singleRecord: true,
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50,
                                            height: 50,
                                            child: CircularProgressIndicator(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                            ),
                                          ),
                                        );
                                      }
                                      List<StoriesRecord>
                                          mediaDisplayStoriesRecordList =
                                          snapshot.data!;
                                      // Return an empty Container when the document does not exist.
                                      if (snapshot.data!.isEmpty) {
                                        return Container();
                                      }
                                      final mediaDisplayStoriesRecord =
                                          mediaDisplayStoriesRecordList
                                                  .isNotEmpty
                                              ? mediaDisplayStoriesRecordList
                                                  .first
                                              : null;
                                      return FlutterFlowMediaDisplay(
                                        path: mediaDisplayStoriesRecord!.story!,
                                        imageBuilder: (path) => ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.network(
                                            path,
                                            width: 200,
                                            height: 200,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        videoPlayerBuilder: (path) =>
                                            FlutterFlowVideoPlayer(
                                          path: path,
                                          width: 300,
                                          height: 100,
                                          autoPlay: false,
                                          looping: true,
                                          showControls: true,
                                          allowFullScreen: true,
                                          allowPlaybackSpeedMenu: false,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                if (currentUserEmail == null ||
                                    currentUserEmail == '')
                                  InkWell(
                                    onTap: () async {
                                      context.pushNamed('Story');
                                    },
                                    child: Container(
                                      width: 120,
                                      height: 120,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.network(
                                        'https://picsum.photos/seed/122/600',
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                Align(
                                  alignment: AlignmentDirectional(0.05, -0.3),
                                  child: InkWell(
                                    onTap: () async {
                                      context.pushNamed('Story');
                                    },
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'l2dd5kxi' /* story */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 6000,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: StreamBuilder<List<UserPostsRecord>>(
                  stream: queryUserPostsRecord(),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: CircularProgressIndicator(
                            color: FlutterFlowTheme.of(context).primaryColor,
                          ),
                        ),
                      );
                    }
                    List<UserPostsRecord> listViewUserPostsRecordList =
                        snapshot.data!;
                    if (listViewUserPostsRecordList.isEmpty) {
                      return Image.asset(
                        'assets/images/404.jpeg',
                      );
                    }
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewUserPostsRecordList.length,
                      itemBuilder: (context, listViewIndex) {
                        final listViewUserPostsRecord =
                            listViewUserPostsRecordList[listViewIndex];
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 32),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 8, 0, 12),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.94,
                                    decoration: BoxDecoration(),
                                    child: SingleChildScrollView(
                                      primary: false,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 2, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Card(
                                                  clipBehavior: Clip
                                                      .antiAliasWithSaveLayer,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                1, 1, 1, 1),
                                                    child: StreamBuilder<
                                                        UserRecord>(
                                                      stream: UserRecord.getDocument(
                                                          listViewUserPostsRecord
                                                              .parentReference),
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
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryColor,
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        final circleImageUserRecord =
                                                            snapshot.data!;
                                                        return Container(
                                                          width: 40,
                                                          height: 40,
                                                          clipBehavior:
                                                              Clip.antiAlias,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: Image.network(
                                                            circleImageUserRecord
                                                                .photoUrl!,
                                                            fit:
                                                                BoxFit.fitWidth,
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(12, 0,
                                                                    0, 0),
                                                        child: StreamBuilder<
                                                            UserRecord>(
                                                          stream: UserRecord
                                                              .getDocument(
                                                                  listViewUserPostsRecord
                                                                      .parentReference),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
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
                                                              );
                                                            }
                                                            final textUserRecord =
                                                                snapshot.data!;
                                                            return Text(
                                                              textUserRecord
                                                                  .displayName!,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1,
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                      StreamBuilder<
                                                          UserPostsRecord>(
                                                        stream: UserPostsRecord
                                                            .getDocument(
                                                                listViewUserPostsRecord
                                                                    .reference),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
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
                                                            );
                                                          }
                                                          final toggleIconUserPostsRecord =
                                                              snapshot.data!;
                                                          return ToggleIcon(
                                                            onPressed:
                                                                () async {
                                                              final userPostsUpdateData =
                                                                  {
                                                                'is_favourite':
                                                                    !listViewUserPostsRecord
                                                                        .isFavourite!,
                                                              };
                                                              await listViewUserPostsRecord
                                                                  .reference
                                                                  .update(
                                                                      userPostsUpdateData);
                                                            },
                                                            value:
                                                                listViewUserPostsRecord
                                                                    .isFavourite!,
                                                            onIcon: Icon(
                                                              Icons
                                                                  .bookmark_sharp,
                                                              color: Color(
                                                                  0x5770DA20),
                                                              size: 25,
                                                            ),
                                                            offIcon: Icon(
                                                              Icons
                                                                  .bookmark_border,
                                                              size: 25,
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 4, 0, 0),
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.96,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 6,
                                                    color: Color(0x3A000000),
                                                    offset: Offset(0, 2),
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: FlutterFlowMediaDisplay(
                                                path: listViewUserPostsRecord
                                                    .postVideo!,
                                                imageBuilder: (path) =>
                                                    ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(0),
                                                    bottomRight:
                                                        Radius.circular(0),
                                                    topLeft: Radius.circular(8),
                                                    topRight:
                                                        Radius.circular(8),
                                                  ),
                                                  child: Image.network(
                                                    path,
                                                    width: 400,
                                                    height: 400,
                                                    fit: BoxFit.contain,
                                                  ),
                                                ),
                                                videoPlayerBuilder: (path) =>
                                                    FlutterFlowVideoPlayer(
                                                  path: path,
                                                  width: 300,
                                                  height: 200,
                                                  aspectRatio: 2.00,
                                                  autoPlay: false,
                                                  looping: false,
                                                  showControls: true,
                                                  allowFullScreen: true,
                                                  allowPlaybackSpeedMenu: false,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 4, 8, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 16, 0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          StreamBuilder<
                                                              UserPostsRecord>(
                                                            stream: UserPostsRecord
                                                                .getDocument(
                                                                    listViewUserPostsRecord
                                                                        .reference),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 50,
                                                                    height: 50,
                                                                    child:
                                                                        CircularProgressIndicator(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryColor,
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              final iconUserPostsRecord =
                                                                  snapshot
                                                                      .data!;
                                                              return InkWell(
                                                                onTap:
                                                                    () async {
                                                                  final userPostsUpdateData =
                                                                      {
                                                                    'likedBy':
                                                                        FieldValue
                                                                            .arrayUnion([
                                                                      currentUserReference
                                                                    ]),
                                                                  };
                                                                  await listViewUserPostsRecord
                                                                      .reference
                                                                      .update(
                                                                          userPostsUpdateData);
                                                                },
                                                                child: Icon(
                                                                  Icons
                                                                      .favorite_border,
                                                                  color: Colors
                                                                      .black,
                                                                  size: 24,
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        4,
                                                                        0,
                                                                        0,
                                                                        0),
                                                            child: Text(
                                                              formatNumber(
                                                                listViewUserPostsRecord
                                                                    .likedBy!
                                                                    .toList()
                                                                    .length,
                                                                formatType:
                                                                    FormatType
                                                                        .compact,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText2,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        StreamBuilder<
                                                            UserPostsRecord>(
                                                          stream: UserPostsRecord
                                                              .getDocument(
                                                                  listViewUserPostsRecord
                                                                      .reference),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
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
                                                              );
                                                            }
                                                            final iconUserPostsRecord =
                                                                snapshot.data!;
                                                            return InkWell(
                                                              onTap: () async {
                                                                context.pushNamed(
                                                                    'Allcommnets');
                                                              },
                                                              child: Icon(
                                                                Icons
                                                                    .mode_comment_outlined,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .grayIcon,
                                                                size: 24,
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(4,
                                                                      0, 0, 0),
                                                          child: StreamBuilder<
                                                              List<
                                                                  PostCommentRecord>>(
                                                            stream:
                                                                queryPostCommentRecord(
                                                              parent: listViewUserPostsRecord
                                                                  .parentReference,
                                                              singleRecord:
                                                                  true,
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 50,
                                                                    height: 50,
                                                                    child:
                                                                        CircularProgressIndicator(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryColor,
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              List<PostCommentRecord>
                                                                  textPostCommentRecordList =
                                                                  snapshot
                                                                      .data!;
                                                              final textPostCommentRecord =
                                                                  textPostCommentRecordList
                                                                          .isNotEmpty
                                                                      ? textPostCommentRecordList
                                                                          .first
                                                                      : null;
                                                              return Text(
                                                                formatNumber(
                                                                  listViewUserPostsRecord
                                                                      .commentBy!
                                                                      .toList()
                                                                      .length,
                                                                  formatType:
                                                                      FormatType
                                                                          .compact,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText2,
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    InkWell(
                                                      onTap: () async {
                                                        await Share.share(
                                                            'karyameetpoint://karyameetpoint.com${GoRouter.of(context).location}');
                                                      },
                                                      child: Icon(
                                                        Icons.ios_share,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .grayIcon,
                                                        size: 24,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    2, 4, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    listViewUserPostsRecord
                                                        .postTitle!,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
