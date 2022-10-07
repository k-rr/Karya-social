import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_expanded_image_view.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class SearchResultsWidget extends StatefulWidget {
  const SearchResultsWidget({Key? key}) : super(key: key);

  @override
  _SearchResultsWidgetState createState() => _SearchResultsWidgetState();
}

class _SearchResultsWidgetState extends State<SearchResultsWidget> {
  String? buttonname;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 44),
      child: FutureBuilder<List<UserRecord>>(
        future: queryUserRecordOnce(),
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
          List<UserRecord> listViewUserRecordList = snapshot.data!;
          if (listViewUserRecordList.isEmpty) {
            return Image.network(
              '',
            );
          }
          return ListView.builder(
            padding: EdgeInsets.zero,
            primary: false,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: listViewUserRecordList.length,
            itemBuilder: (context, listViewIndex) {
              final listViewUserRecord = listViewUserRecordList[listViewIndex];
              return Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 4, 16, 8),
                child: Container(
                  width: double.infinity,
                  height: 70,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4,
                        color: Color(0x32000000),
                        offset: Offset(0, 2),
                      )
                    ],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () async {
                            await Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.fade,
                                child: FlutterFlowExpandedImageView(
                                  image: Image.network(
                                    listViewUserRecord.photoUrl!,
                                    fit: BoxFit.contain,
                                  ),
                                  allowRotation: false,
                                  tag: listViewUserRecord.photoUrl!,
                                  useHeroAnimation: true,
                                ),
                              ),
                            );
                          },
                          child: Hero(
                            tag: listViewUserRecord.photoUrl!,
                            transitionOnUserGestures: true,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(26),
                              child: Image.network(
                                listViewUserRecord.photoUrl!,
                                width: 36,
                                height: 36,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    listViewUserRecord.displayName!,
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
                                  ),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          listViewUserRecord.email!,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText2,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        StreamBuilder<UserRecord>(
                          stream: UserRecord.getDocument(
                              listViewUserRecord.reference),
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
                            final buttonUserRecord = snapshot.data!;
                            return FFButtonWidget(
                              onPressed: () async {
                                final userUpdateData = {
                                  'following': FieldValue.arrayUnion(
                                      [buttonUserRecord.reference]),
                                };
                                await currentUserReference!
                                    .update(userUpdateData);
                                buttonname = await actions.following();

                                setState(() {});
                              },
                              text: FFLocalizations.of(context).getText(
                                'x7kssh1p' /* Follow */,
                              ),
                              options: FFButtonOptions(
                                width: 70,
                                height: 36,
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Outfit',
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
