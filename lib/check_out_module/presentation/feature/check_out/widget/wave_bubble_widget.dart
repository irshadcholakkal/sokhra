import 'dart:async';
import 'dart:io';

import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../../../base_module/domain/entity/color_scheme.dart';

class WaveBubble extends StatefulWidget {
  final bool isSender;
  final int? index;
  final String? path;
  final double? width;
  final Directory appDirectory;
  final void Function()? delete;

  const WaveBubble(
      {Key? key,
      required this.appDirectory,
      this.width,
      this.index,
      this.isSender = false,
      this.path,
      this.delete})
      : super(key: key);

  @override
  State<WaveBubble> createState() => _WaveBubbleState();
}

class _WaveBubbleState extends State<WaveBubble> {
  File? file;

  late PlayerController _controller;
  late StreamSubscription<PlayerState> _playerStateSubscription;

  final playerWaveStyle = const PlayerWaveStyle(
    fixedWaveColor: Colors.white54,
    liveWaveColor: Colors.white,
    spacing: 6,
  );

  @override
  void initState() {
    super.initState();
    _controller = PlayerController();
    _preparePlayer();
    _playerStateSubscription = _controller.onPlayerStateChanged.listen((_) {
      setState(() {});
    });
  }

  void _preparePlayer() async {
    // Opening file from assets folder
    if (widget.index != null) {
      file = File('${widget.appDirectory.path}/audio${widget.index}.mp3');
      await file?.writeAsBytes(
          (await rootBundle.load('assets/audios/audio${widget.index}.mp3'))
              .buffer
              .asUint8List());
    }
    if (widget.index == null && widget.path == null && file?.path == null) {
      return;
    }
    // Prepare player with extracting waveform if index is even.
    _controller.preparePlayer(
      path: widget.path ?? file!.path,
      shouldExtractWaveform: widget.index?.isEven ?? true,
    );
    // Extracting waveform separately if index is odd.
    if (widget.index?.isOdd ?? false) {
      _controller
          .extractWaveformData(
            path: widget.path ?? file!.path,
            noOfSamples:
                playerWaveStyle.getSamplesForWidth(widget.width ?? 200),
          )
          .then((waveformData) => debugPrint(waveformData.toString()));
    }
  }

  @override
  void dispose() {
    _playerStateSubscription.cancel();
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.path != null || file?.path != null
        ? SizedBox(
            height: 95,
            // alignment:
            // widget.isSender ? Alignment.centerRight : Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  // horizontal: AppConstants.defaultPadding / 4
                  horizontal: 0
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () async {
                          _controller.playerState.isPlaying
                              ? await _controller.pausePlayer()
                              : await _controller.startPlayer(
                                  finishMode: FinishMode.pause,
                                );
                        },
                        child: Icon(
                          _controller.playerState.isPlaying
                              ? Icons.stop
                              : Icons.play_arrow,
                          size: 30,
                          color: AppColorScheme.secondaryColorLight,
                        ),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: widget.delete,
                        child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 2, 4, 0),
                            child: Icon(MdiIcons.deleteOutline, size: 22)),
                      )
                    ],
                  ),
                  Spacer(),
                  Padding(
                    padding:EdgeInsetsDirectional.fromSTEB(9, 0, 0, 5) ,
                    child: Text(
                      _controller.playerState.isPlaying ? "Pause" : "Play",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: Theme.of(context).colorScheme.onTertiary),
                    ),
                  )
                ],
              ),
            ),
          )
        : const SizedBox.shrink();
  }
}
