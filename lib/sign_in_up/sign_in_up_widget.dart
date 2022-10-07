import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInUpWidget extends StatefulWidget {
  const SignInUpWidget({Key? key}) : super(key: key);

  @override
  _SignInUpWidgetState createState() => _SignInUpWidgetState();
}

class _SignInUpWidgetState extends State<SignInUpWidget> {
  bool isMediaUploading = false;
  String uploadedFileUrl = '';

  TextEditingController? emailController;
  TextEditingController? createPasswordController;

  late bool createPasswordVisibility;
  TextEditingController? emailAddressController;
  TextEditingController? passwordController;

  late bool passwordVisibility;
  final formKey1 = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey2 = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    createPasswordController = TextEditingController();
    createPasswordVisibility = false;
    emailController = TextEditingController();
    emailAddressController = TextEditingController();
    passwordController = TextEditingController();
    passwordVisibility = false;
  }

  @override
  void dispose() {
    createPasswordController?.dispose();
    emailController?.dispose();
    emailAddressController?.dispose();
    passwordController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<UserRecord>>(
      stream: queryUserRecord(
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
                color: FlutterFlowTheme.of(context).primaryColor,
              ),
            ),
          );
        }
        List<UserRecord> signInUpUserRecordList = snapshot.data!;
        final signInUpUserRecord = signInUpUserRecordList.isNotEmpty
            ? signInUpUserRecordList.first
            : null;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryColor,
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 70, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 60),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              'wkirbgth' /* KARYA MEET POINT */,
                            ),
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      fontSize: 35,
                                    ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: DefaultTabController(
                        length: 2,
                        initialIndex: 0,
                        child: Column(
                          children: [
                            TabBar(
                              isScrollable: true,
                              labelColor:
                                  FlutterFlowTheme.of(context).primaryBtnText,
                              labelPadding:
                                  EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                              labelStyle:
                                  FlutterFlowTheme.of(context).subtitle1,
                              indicatorColor:
                                  FlutterFlowTheme.of(context).primaryBtnText,
                              tabs: [
                                Tab(
                                  text: FFLocalizations.of(context).getText(
                                    '7wkavzvp' /* Sign In */,
                                  ),
                                ),
                                Tab(
                                  text: FFLocalizations.of(context).getText(
                                    'lwuvs518' /* Sign Up */,
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: TabBarView(
                                children: [
                                  Form(
                                    key: formKey1,
                                    autovalidateMode: AutovalidateMode.always,
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24, 24, 24, 24),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20, 20, 20, 0),
                                            child:
                                                StreamBuilder<List<UserRecord>>(
                                              stream: queryUserRecord(
                                                queryBuilder: (userRecord) =>
                                                    userRecord.where('email',
                                                        isEqualTo:
                                                            emailController!
                                                                .text),
                                                singleRecord: true,
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50,
                                                      height: 50,
                                                      child:
                                                          CircularProgressIndicator(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<UserRecord>
                                                    emailAddressUserRecordList =
                                                    snapshot.data!;
                                                final emailAddressUserRecord =
                                                    emailAddressUserRecordList
                                                            .isNotEmpty
                                                        ? emailAddressUserRecordList
                                                            .first
                                                        : null;
                                                return TextFormField(
                                                  controller:
                                                      emailAddressController,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyText2,
                                                    hintText:
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                      'dmwnbpm4' /* Enter your email... */,
                                                    ),
                                                    hintStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyText2,
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: Colors.white,
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: Colors.white,
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 1,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    filled: true,
                                                    fillColor: Colors.white,
                                                    contentPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                20, 24, 20, 24),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            Color(0xFF0F1113),
                                                      ),
                                                  validator: (val) {
                                                    if (val == null ||
                                                        val.isEmpty) {
                                                      return FFLocalizations.of(
                                                              context)
                                                          .getText(
                                                        'zkq6hac8' /* Field is required */,
                                                      );
                                                    }

                                                    if (!RegExp(
                                                            kTextValidatorEmailRegex)
                                                        .hasMatch(val)) {
                                                      return 'Has to be a valid email address.';
                                                    }
                                                    return null;
                                                  },
                                                );
                                              },
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20, 12, 20, 0),
                                            child: TextFormField(
                                              controller: passwordController,
                                              obscureText: !passwordVisibility,
                                              decoration: InputDecoration(
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText2,
                                                hintText:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  't0sm7tkp' /* Enter your password... */,
                                                ),
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText2,
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Colors.white,
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Colors.white,
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                filled: true,
                                                fillColor: Colors.white,
                                                contentPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            20, 24, 20, 24),
                                                suffixIcon: InkWell(
                                                  onTap: () => setState(
                                                    () => passwordVisibility =
                                                        !passwordVisibility,
                                                  ),
                                                  focusNode: FocusNode(
                                                      skipTraversal: true),
                                                  child: Icon(
                                                    passwordVisibility
                                                        ? Icons
                                                            .visibility_outlined
                                                        : Icons
                                                            .visibility_off_outlined,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    size: 20,
                                                  ),
                                                ),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            Color(0xFF0F1113),
                                                      ),
                                              validator: (val) {
                                                if (val == null ||
                                                    val.isEmpty) {
                                                  return FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'usokaei3' /* Field is required */,
                                                  );
                                                }

                                                return null;
                                              },
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 24, 0, 0),
                                            child:
                                                StreamBuilder<List<UserRecord>>(
                                              stream: queryUserRecord(
                                                singleRecord: true,
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50,
                                                      height: 50,
                                                      child:
                                                          CircularProgressIndicator(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<UserRecord>
                                                    buttonLoginUserRecordList =
                                                    snapshot.data!;
                                                final buttonLoginUserRecord =
                                                    buttonLoginUserRecordList
                                                            .isNotEmpty
                                                        ? buttonLoginUserRecordList
                                                            .first
                                                        : null;
                                                return FFButtonWidget(
                                                  onPressed: () async {
                                                    GoRouter.of(context)
                                                        .prepareAuthEvent();

                                                    final user =
                                                        await signInWithEmail(
                                                      context,
                                                      emailAddressController!
                                                          .text,
                                                      passwordController!.text,
                                                    );
                                                    if (user == null) {
                                                      return;
                                                    }

                                                    context.pushNamedAuth(
                                                        'feedpage', mounted);
                                                  },
                                                  text: FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'vuoiv3b2' /* Sign In */,
                                                  ),
                                                  options: FFButtonOptions(
                                                    width: 230,
                                                    height: 50,
                                                    color: Colors.white,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryColor,
                                                        ),
                                                    elevation: 3,
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 20, 0, 0),
                                            child: FFButtonWidget(
                                              onPressed: () {
                                                print(
                                                    'Button-ForgotPassword pressed ...');
                                              },
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'be6wjbpw' /* Forgot Password? */,
                                              ),
                                              options: FFButtonOptions(
                                                width: 170,
                                                height: 40,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: Colors.white,
                                                        ),
                                                elevation: 0,
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0, 0.3),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -0.45, -0.2),
                                                  child: InkWell(
                                                    onTap: () async {
                                                      GoRouter.of(context)
                                                          .prepareAuthEvent();
                                                      final user =
                                                          await signInWithGoogle(
                                                              context);
                                                      if (user == null) {
                                                        return;
                                                      }

                                                      context.goNamedAuth(
                                                          'feedpage', mounted);
                                                    },
                                                    child: FaIcon(
                                                      FontAwesomeIcons.gofore,
                                                      color: Color(0xFFF8F1F2),
                                                      size: 30,
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.35, 0.35),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                30, 0, 0, 0),
                                                    child: InkWell(
                                                      onTap: () async {
                                                        GoRouter.of(context)
                                                            .prepareAuthEvent();
                                                        final user =
                                                            await signInWithApple(
                                                                context);
                                                        if (user == null) {
                                                          return;
                                                        }

                                                        context.goNamedAuth(
                                                            'feedpage',
                                                            mounted);
                                                      },
                                                      child: FaIcon(
                                                        FontAwesomeIcons.apple,
                                                        color: Colors.black,
                                                        size: 24,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Form(
                                    key: formKey2,
                                    autovalidateMode: AutovalidateMode.always,
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24, 24, 24, 24),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10, 2, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                StreamBuilder<List<UserRecord>>(
                                                  stream: queryUserRecord(
                                                    singleRecord: true,
                                                  ),
                                                  builder: (context, snapshot) {
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
                                                      width: 90,
                                                      height: 90,
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Image.network(
                                                        uploadedFileUrl,
                                                      ),
                                                    );
                                                  },
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.2, 0.1),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                10, 0, 0, 0),
                                                    child: StreamBuilder<
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
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryColor,
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        List<UserRecord>
                                                            buttonUserRecordList =
                                                            snapshot.data!;
                                                        final buttonUserRecord =
                                                            buttonUserRecordList
                                                                    .isNotEmpty
                                                                ? buttonUserRecordList
                                                                    .first
                                                                : null;
                                                        return FFButtonWidget(
                                                          onPressed: () async {
                                                            final selectedMedia =
                                                                await selectMediaWithSourceBottomSheet(
                                                              context: context,
                                                              allowPhoto: true,
                                                            );
                                                            if (selectedMedia !=
                                                                    null &&
                                                                selectedMedia.every((m) =>
                                                                    validateFileFormat(
                                                                        m.storagePath,
                                                                        context))) {
                                                              setState(() =>
                                                                  isMediaUploading =
                                                                      true);
                                                              var downloadUrls =
                                                                  <String>[];
                                                              try {
                                                                showUploadMessage(
                                                                  context,
                                                                  'Uploading file...',
                                                                  showLoading:
                                                                      true,
                                                                );
                                                                downloadUrls = (await Future
                                                                        .wait(
                                                                  selectedMedia
                                                                      .map(
                                                                    (m) async =>
                                                                        await uploadData(
                                                                            m.storagePath,
                                                                            m.bytes),
                                                                  ),
                                                                ))
                                                                    .where((u) =>
                                                                        u !=
                                                                        null)
                                                                    .map((u) =>
                                                                        u!)
                                                                    .toList();
                                                              } finally {
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .hideCurrentSnackBar();
                                                                isMediaUploading =
                                                                    false;
                                                              }
                                                              if (downloadUrls
                                                                      .length ==
                                                                  selectedMedia
                                                                      .length) {
                                                                setState(() =>
                                                                    uploadedFileUrl =
                                                                        downloadUrls
                                                                            .first);
                                                                showUploadMessage(
                                                                    context,
                                                                    'Success!');
                                                              } else {
                                                                setState(() {});
                                                                showUploadMessage(
                                                                    context,
                                                                    'Failed to upload media');
                                                                return;
                                                              }
                                                            }
                                                          },
                                                          text: FFLocalizations
                                                                  .of(context)
                                                              .getText(
                                                            'rlp55xro' /* Upload */,
                                                          ),
                                                          options:
                                                              FFButtonOptions(
                                                            width: 130,
                                                            height: 40,
                                                            color: Color(
                                                                0xA1397FEF),
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .subtitle2
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                            borderSide:
                                                                BorderSide(
                                                              color: Colors
                                                                  .transparent,
                                                              width: 1,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20, 20, 20, 0),
                                            child: TextFormField(
                                              controller: emailController,
                                              onFieldSubmitted: (_) async {
                                                if (formKey1.currentState ==
                                                        null ||
                                                    !formKey1.currentState!
                                                        .validate()) {
                                                  return;
                                                }

                                                setState(() {
                                                  createPasswordController
                                                      ?.clear();
                                                  emailAddressController
                                                      ?.clear();
                                                  emailController?.clear();
                                                });
                                              },
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText2,
                                                hintText:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'h0h8w48y' /* Enter your email... */,
                                                ),
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText2,
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Colors.white,
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Colors.white,
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                filled: true,
                                                fillColor: Colors.white,
                                                contentPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            20, 24, 20, 24),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            Color(0xFF0F1113),
                                                      ),
                                              keyboardType:
                                                  TextInputType.emailAddress,
                                              validator: (val) {
                                                if (val == null ||
                                                    val.isEmpty) {
                                                  return FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    '0y787ne6' /* Field is required */,
                                                  );
                                                }

                                                if (!RegExp(
                                                        kTextValidatorEmailRegex)
                                                    .hasMatch(val)) {
                                                  return 'Has to be a valid email address.';
                                                }
                                                return null;
                                              },
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20, 12, 20, 0),
                                            child: TextFormField(
                                              controller:
                                                  createPasswordController,
                                              onFieldSubmitted: (_) async {
                                                if (formKey1.currentState ==
                                                        null ||
                                                    !formKey1.currentState!
                                                        .validate()) {
                                                  return;
                                                }
                                              },
                                              obscureText:
                                                  !createPasswordVisibility,
                                              decoration: InputDecoration(
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText2,
                                                hintText:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'c1ol9vvg' /* Enter your password... */,
                                                ),
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText2,
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Colors.white,
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Colors.white,
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                filled: true,
                                                fillColor: Colors.white,
                                                contentPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            20, 24, 20, 24),
                                                suffixIcon: InkWell(
                                                  onTap: () => setState(
                                                    () => createPasswordVisibility =
                                                        !createPasswordVisibility,
                                                  ),
                                                  focusNode: FocusNode(
                                                      skipTraversal: true),
                                                  child: Icon(
                                                    createPasswordVisibility
                                                        ? Icons
                                                            .visibility_outlined
                                                        : Icons
                                                            .visibility_off_outlined,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    size: 0,
                                                  ),
                                                ),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            Color(0xFF0F1113),
                                                      ),
                                              keyboardType:
                                                  TextInputType.visiblePassword,
                                              validator: (val) {
                                                if (val == null ||
                                                    val.isEmpty) {
                                                  return FFLocalizations.of(
                                                          context)
                                                      .getText(
                                                    'ro5hx7do' /* Field is required */,
                                                  );
                                                }

                                                return null;
                                              },
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 24, 0, 0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                GoRouter.of(context)
                                                    .prepareAuthEvent();

                                                final user =
                                                    await createAccountWithEmail(
                                                  context,
                                                  emailController!.text,
                                                  createPasswordController!
                                                      .text,
                                                );
                                                if (user == null) {
                                                  return;
                                                }

                                                context.pushNamedAuth(
                                                    'Sign-in-up', mounted);
                                              },
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'vobjxmoa' /* Create Account */,
                                              ),
                                              options: FFButtonOptions(
                                                width: 230,
                                                height: 50,
                                                color: Colors.white,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryColor,
                                                        ),
                                                elevation: 3,
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
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
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
