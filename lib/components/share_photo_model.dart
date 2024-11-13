import '/flutter_flow/flutter_flow_util.dart';
import 'share_photo_widget.dart' show SharePhotoWidget;
import 'package:flutter/material.dart';

class SharePhotoModel extends FlutterFlowModel<SharePhotoWidget> {
  ///  Local state fields for this component.

  bool? imageAttached = false;

  bool? emptychoice = false;

  bool? emptytext = false;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
