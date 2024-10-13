import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'default_photo_model.dart';
export 'default_photo_model.dart';

class DefaultPhotoWidget extends StatefulWidget {
  const DefaultPhotoWidget({
    super.key,
    this.parameter1,
  });

  final String? parameter1;

  @override
  State<DefaultPhotoWidget> createState() => _DefaultPhotoWidgetState();
}

class _DefaultPhotoWidgetState extends State<DefaultPhotoWidget> {
  late DefaultPhotoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DefaultPhotoModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          width: 160.0,
          height: 160.0,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Image.asset(
            'assets/images/default_profile_picture.jpg',
            fit: BoxFit.contain,
            alignment: const Alignment(0.0, 0.0),
          ),
        ),
      ),
    );
  }
}
