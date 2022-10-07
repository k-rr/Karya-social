import '../auth/auth_util.dart';
import '../auth/firebase_user_provider.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_expanded_image_view.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_media_display.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_video_player.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class ProfilePageWidget extends StatefulWidget {
  const ProfilePageWidget({
    Key? key,
    this.user,
  }) : super(key: key);

  final UserRecord? user;

  @override
  _ProfilePageWidgetState createState() => _ProfilePageWidgetState();
}

class _ProfilePageWidgetState extends State<ProfilePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 1,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).black600,
          ),
          child: InkWell(
            onTap: () async {
              if (loggedIn) {
                context.pushNamed('ProfilePage');
              } else {
                context.pushNamed('Sign-in-up');
              }
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(0.05, 0.05),
                    child: AuthUserStreamWidget(
                      child: Text(
                        currentUserDisplayName,
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Roboto',
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Color(0xFFEEEEEE),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        AuthUserStreamWidget(
                          child: StreamBuilder<List<UserRecord>>(
                            stream: queryUserRecord(
                              queryBuilder: (userRecord) => userRecord
                                  .where('email', isEqualTo: currentUserEmail),
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
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                    ),
                                  ),
                                );
                              }
                              List<UserRecord> circleImageUserRecordList =
                                  snapshot.data!;
                              final circleImageUserRecord =
                                  circleImageUserRecordList.isNotEmpty
                                      ? circleImageUserRecordList.first
                                      : null;
                              return InkWell(
                                onTap: () async {
                                  await Navigator.push(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.fade,
                                      child: FlutterFlowExpandedImageView(
                                        image: Image.network(
                                          currentUserPhoto,
                                          fit: BoxFit.contain,
                                        ),
                                        allowRotation: false,
                                        tag: currentUserPhoto,
                                        useHeroAnimation: true,
                                      ),
                                    ),
                                  );
                                },
                                child: Hero(
                                  tag: currentUserPhoto,
                                  transitionOnUserGestures: true,
                                  child: Container(
                                    width: 120,
                                    height: 120,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.network(
                                      currentUserPhoto,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        width: 100,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFEEEEEE),
                                        ),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.1, 0.65),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'hzkptrjx' /* 32 */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Roboto',
                                                  color: Color(0xFF5391C6),
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        width: 100,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFEEEEEE),
                                        ),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.1, 0.65),
                                          child: AuthUserStreamWidget(
                                            child: Text(
                                              formatNumber(
                                                (currentUserDocument?.following
                                                            ?.toList() ??
                                                        [])
                                                    .length,
                                                formatType: FormatType.compact,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Roboto',
                                                    color: Color(0xFF5391C6),
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        width: 100,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFEEEEEE),
                                        ),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.1, 0.65),
                                          child: AuthUserStreamWidget(
                                            child: Text(
                                              formatNumber(
                                                (currentUserDocument
                                                            ?.followersUser
                                                            ?.toList() ??
                                                        [])
                                                    .length,
                                                formatType: FormatType.compact,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Roboto',
                                                    color: Color(0xFF5391C6),
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        width: 100,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFEEEEEE),
                                        ),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.1, -1),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'c0bmd9tz' /* Posts */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Roboto',
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        width: 100,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFEEEEEE),
                                        ),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.1, -1),
                                          child: InkWell(
                                            onTap: () async {
                                              context.pushNamed('Following');
                                            },
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'qm6u5jlf' /* following */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        width: 100,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFEEEEEE),
                                        ),
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.1, -1),
                                          child: InkWell(
                                            onTap: () async {
                                              context.pushNamed('Followers');
                                            },
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'b37pr9m7' /* followers */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 200,
                  constraints: BoxConstraints(
                    maxHeight: 100,
                  ),
                  decoration: BoxDecoration(),
                  alignment: AlignmentDirectional(-0.30000000000000004, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AuthUserStreamWidget(
                            child: StreamBuilder<List<UserRecord>>(
                              stream: queryUserRecord(
                                queryBuilder: (userRecord) => userRecord.where(
                                    'email',
                                    isEqualTo: currentUserEmail),
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
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                      ),
                                    ),
                                  );
                                }
                                List<UserRecord> textUserRecordList =
                                    snapshot.data!;
                                final textUserRecord =
                                    textUserRecordList.isNotEmpty
                                        ? textUserRecordList.first
                                        : null;
                                return Text(
                                  currentUserDisplayName,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF1D39BF),
                                        fontWeight: FontWeight.w200,
                                      ),
                                );
                              },
                            ),
                          ),
                          AuthUserStreamWidget(
                            child: StreamBuilder<List<UserRecord>>(
                              stream: queryUserRecord(
                                queryBuilder: (userRecord) => userRecord.where(
                                    'email',
                                    isEqualTo: currentUserEmail),
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
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                      ),
                                    ),
                                  );
                                }
                                List<UserRecord> textUserRecordList =
                                    snapshot.data!;
                                final textUserRecord =
                                    textUserRecordList.isNotEmpty
                                        ? textUserRecordList.first
                                        : null;
                                return Text(
                                  valueOrDefault(currentUserDocument?.bio, ''),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFFC5242F),
                                        fontWeight: FontWeight.normal,
                                      ),
                                );
                              },
                            ),
                          ),
                          FFButtonWidget(
                            onPressed: () async {
                              context.pushNamed('EditProfile');
                            },
                            text: FFLocalizations.of(context).getText(
                              '2d0ngunb' /* Edit Profile & Settings */,
                            ),
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 30,
                              color: Color(0xFFF7F7F7),
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF050505),
                                  ),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 55,
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFCFC),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 30,
                          borderWidth: 1,
                          buttonSize: 60,
                          icon: Icon(
                            Icons.grid_on,
                            color: Colors.black,
                            size: 30,
                          ),
                          onPressed: () {
                            print('IconButton pressed ...');
                          },
                        ),
                      ),
                      Expanded(
                        child: FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 30,
                          borderWidth: 1,
                          buttonSize: 60,
                          icon: Icon(
                            Icons.location_history_outlined,
                            color: Colors.black,
                            size: 30,
                          ),
                          onPressed: () {
                            print('IconButton pressed ...');
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 500,
                  constraints: BoxConstraints(
                    maxWidth: double.infinity,
                    maxHeight: 400,
                  ),
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBtnText,
                  ),
                  child: StreamBuilder<List<UserPostsRecord>>(
                    stream: queryUserPostsRecord(
                      parent: currentUserReference,
                    ),
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
                      List<UserPostsRecord> gridViewUserPostsRecordList =
                          snapshot.data!;
                      return GridView.builder(
                        padding: EdgeInsets.zero,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 5,
                          crossAxisSpacing: 1,
                          mainAxisSpacing: 1,
                          childAspectRatio: 1,
                        ),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: gridViewUserPostsRecordList.length,
                        itemBuilder: (context, gridViewIndex) {
                          final gridViewUserPostsRecord =
                              gridViewUserPostsRecordList[gridViewIndex];
                          return Container(
                            width: double.infinity,
                            height: 500,
                            child: Stack(
                              children: [
                                if (gridViewUserPostsRecord.postVideo != null &&
                                    gridViewUserPostsRecord.postVideo != '')
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 10, 10, 10),
                                    child: FlutterFlowMediaDisplay(
                                      path: gridViewUserPostsRecord.postVideo!,
                                      imageBuilder: (path) => Image.network(
                                        path,
                                        width: 300,
                                        height: 300,
                                        fit: BoxFit.contain,
                                      ),
                                      videoPlayerBuilder: (path) =>
                                          FlutterFlowVideoPlayer(
                                        path: path,
                                        width: 300,
                                        autoPlay: false,
                                        looping: true,
                                        showControls: true,
                                        allowFullScreen: true,
                                        allowPlaybackSpeedMenu: false,
                                      ),
                                    ),
                                  ),
                              ],
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
      ),
    );
  }
}
