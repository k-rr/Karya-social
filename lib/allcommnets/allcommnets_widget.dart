import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AllcommnetsWidget extends StatefulWidget {
  const AllcommnetsWidget({Key? key}) : super(key: key);

  @override
  _AllcommnetsWidgetState createState() => _AllcommnetsWidgetState();
}

class _AllcommnetsWidgetState extends State<AllcommnetsWidget> {
  TextEditingController? commentController;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    commentController = TextEditingController();
  }

  @override
  void dispose() {
    commentController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () async {
            context.pop();
          },
        ),
        title: Text(
          FFLocalizations.of(context).getText(
            'h9bqw3le' /* All Comments */,
          ),
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Love Ya Like A Sister',
                color: Colors.white,
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: double.infinity,
                height: 600,
                decoration: BoxDecoration(),
                child: StreamBuilder<List<PostCommentRecord>>(
                  stream: queryPostCommentRecord(),
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
                    List<PostCommentRecord> listViewPostCommentRecordList =
                        snapshot.data!;
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewPostCommentRecordList.length,
                      itemBuilder: (context, listViewIndex) {
                        final listViewPostCommentRecord =
                            listViewPostCommentRecordList[listViewIndex];
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1, -0.35),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        2, 10, 0, 0),
                                    child: StreamBuilder<UserRecord>(
                                      stream: UserRecord.getDocument(
                                          listViewPostCommentRecord
                                              .parentReference),
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
                                        final circleImageUserRecord =
                                            snapshot.data!;
                                        return Container(
                                          width: 60,
                                          height: 60,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.network(
                                            circleImageUserRecord.photoUrl!,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                StreamBuilder<UserRecord>(
                                  stream: UserRecord.getDocument(
                                      listViewPostCommentRecord
                                          .parentReference),
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
                                    final textUserRecord = snapshot.data!;
                                    return Text(
                                      textUserRecord.displayName!,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Color(0x61E1D51A),
                                          ),
                                    );
                                  },
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-0.1, 0.1),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 0, 0, 0),
                                    child: StreamBuilder<PostCommentRecord>(
                                      stream: PostCommentRecord.getDocument(
                                          listViewPostCommentRecord.reference),
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
                                        final textPostCommentRecord =
                                            snapshot.data!;
                                        return Text(
                                          listViewPostCommentRecord.comments!,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Delius Unicase',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .black600,
                                                fontSize: 12,
                                              ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    width: 10,
                    child: Form(
                      key: formKey,
                      autovalidateMode: AutovalidateMode.disabled,
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                        child: Container(
                          width: 90,
                          height: 50,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              width: 2,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                                child: AuthUserStreamWidget(
                                  child: Container(
                                    width: 60,
                                    height: 60,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.network(
                                      currentUserPhoto,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: AlignmentDirectional(0, 0.3),
                                  child: TextFormField(
                                    controller: commentController,
                                    autofocus: true,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      hintText:
                                          FFLocalizations.of(context).getText(
                                        'rbl1l25g' /* Comments... */,
                                      ),
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodyText2,
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      errorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      focusedErrorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
                                    validator: (val) {
                                      if (val == null || val.isEmpty) {
                                        return FFLocalizations.of(context)
                                            .getText(
                                          'ng39a9mp' /* Field is required */,
                                        );
                                      }

                                      return null;
                                    },
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.05, -0.1),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 2, 0),
                                  child: StreamBuilder<List<PostCommentRecord>>(
                                    stream: queryPostCommentRecord(
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
                                      List<PostCommentRecord>
                                          iconPostCommentRecordList =
                                          snapshot.data!;
                                      final iconPostCommentRecord =
                                          iconPostCommentRecordList.isNotEmpty
                                              ? iconPostCommentRecordList.first
                                              : null;
                                      return InkWell(
                                        onTap: () async {
                                          final postCommentCreateData = {
                                            ...createPostCommentRecordData(
                                              comments: commentController!.text,
                                              commentedTime:
                                                  getCurrentTimestamp,
                                            ),
                                            'user_name': [currentUserReference],
                                          };
                                          await PostCommentRecord.createDoc(
                                                  currentUserReference!)
                                              .set(postCommentCreateData);

                                          context.pushNamed('feedpage');
                                        },
                                        child: Icon(
                                          Icons.send_sharp,
                                          color: FlutterFlowTheme.of(context)
                                              .tertiaryColor,
                                          size: 24,
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
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
