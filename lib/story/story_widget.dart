import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_media_display.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_video_player.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StoryWidget extends StatefulWidget {
  const StoryWidget({Key? key}) : super(key: key);

  @override
  _StoryWidgetState createState() => _StoryWidgetState();
}

class _StoryWidgetState extends State<StoryWidget> {
  bool isMediaUploading = false;
  String uploadedFileUrl = '';

  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          FFLocalizations.of(context).getText(
            'df2ibin2' /* Create  Story */,
          ),
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Lexend Deca',
                color: Color(0xFF090F13),
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
        ),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
            child: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30,
              buttonSize: 48,
              icon: Icon(
                Icons.close_rounded,
                color: Color(0xFF95A1AC),
                size: 30,
              ),
              onPressed: () async {
                Navigator.pop(context);
              },
            ),
          ),
        ],
        centerTitle: false,
        elevation: 0,
      ),
      body: SafeArea(
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.always,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.94,
                    decoration: BoxDecoration(),
                    child: Stack(
                      children: [
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                          child: FlutterFlowMediaDisplay(
                            path: uploadedFileUrl,
                            imageBuilder: (path) => ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                path,
                                width: 300,
                                height: 300,
                                fit: BoxFit.contain,
                              ),
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
                        Align(
                          alignment: AlignmentDirectional(-0.85, -0.85),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 330, 0, 0),
                            child: InkWell(
                              onTap: () async {
                                final selectedMedia =
                                    await selectMediaWithSourceBottomSheet(
                                  context: context,
                                  maxWidth: 400.00,
                                  maxHeight: 400.00,
                                  imageQuality: 100,
                                  allowPhoto: true,
                                  allowVideo: true,
                                  backgroundColor: Color(0xFF607D8B),
                                );
                                if (selectedMedia != null &&
                                    selectedMedia.every((m) =>
                                        validateFileFormat(
                                            m.storagePath, context))) {
                                  setState(() => isMediaUploading = true);
                                  var downloadUrls = <String>[];
                                  try {
                                    showUploadMessage(
                                      context,
                                      'Uploading file...',
                                      showLoading: true,
                                    );
                                    downloadUrls = (await Future.wait(
                                      selectedMedia.map(
                                        (m) async => await uploadData(
                                            m.storagePath, m.bytes),
                                      ),
                                    ))
                                        .where((u) => u != null)
                                        .map((u) => u!)
                                        .toList();
                                  } finally {
                                    ScaffoldMessenger.of(context)
                                        .hideCurrentSnackBar();
                                    isMediaUploading = false;
                                  }
                                  if (downloadUrls.length ==
                                      selectedMedia.length) {
                                    setState(() =>
                                        uploadedFileUrl = downloadUrls.first);
                                    showUploadMessage(context, 'Success!');
                                  } else {
                                    setState(() {});
                                    showUploadMessage(
                                        context, 'Failed to upload media');
                                    return;
                                  }
                                }
                              },
                              child: Icon(
                                Icons.camera_alt,
                                color: Colors.black,
                                size: 30,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                    child: StreamBuilder<List<UserPostsRecord>>(
                      stream: queryUserPostsRecord(
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
                                    FlutterFlowTheme.of(context).primaryColor,
                              ),
                            ),
                          );
                        }
                        List<UserPostsRecord> buttonCreateUserPostsRecordList =
                            snapshot.data!;
                        final buttonCreateUserPostsRecord =
                            buttonCreateUserPostsRecordList.isNotEmpty
                                ? buttonCreateUserPostsRecordList.first
                                : null;
                        return FFButtonWidget(
                          onPressed: () async {
                            final storiesCreateData = createStoriesRecordData(
                              userName: currentUserReference,
                              storyTime: getCurrentTimestamp,
                              story: uploadedFileUrl,
                            );
                            await StoriesRecord.collection
                                .doc()
                                .set(storiesCreateData);

                            context.pushNamed('feedpage');
                          },
                          text: FFLocalizations.of(context).getText(
                            '0f1ag5gc' /* Share */,
                          ),
                          options: FFButtonOptions(
                            width: 270,
                            height: 50,
                            color: Color(0xFF4B39EF),
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Lexend Deca',
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                            elevation: 3,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                          ),
                        );
                      },
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
