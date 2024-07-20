// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:zego_uikit/zego_uikit.dart';

// Project imports:
import 'package:zego_uikit_prebuilt_live_audio_room/src/components/defines.dart';
import 'package:zego_uikit_prebuilt_live_audio_room/src/components/leave_button.dart';
import 'package:zego_uikit_prebuilt_live_audio_room/src/config.dart';
import 'package:zego_uikit_prebuilt_live_audio_room/src/core/connect/connect_manager.dart';
import 'package:zego_uikit_prebuilt_live_audio_room/src/core/seat/seat_manager.dart';
import 'package:zego_uikit_prebuilt_live_audio_room/src/defines.dart';
import 'package:zego_uikit_prebuilt_live_audio_room/src/events.dart';
import 'package:zego_uikit_prebuilt_live_audio_room/src/events.defines.dart';
import 'package:zego_uikit_prebuilt_live_audio_room/src/inner_text.dart';
import 'package:zego_uikit_prebuilt_live_audio_room/src/minimizing/mini_button.dart';

/// @nodoc
class ZegoLiveAudioRoomTopBar extends StatefulWidget {
  final ZegoUIKitPrebuiltLiveAudioRoomConfig config;
  final ZegoUIKitPrebuiltLiveAudioRoomEvents events;
  final void Function(ZegoLiveAudioRoomEndEvent event) defaultEndAction;
  final Future<bool> Function(
    ZegoLiveAudioRoomLeaveConfirmationEvent event,
  ) defaultLeaveConfirmationAction;

  final ZegoLiveAudioRoomSeatManager seatManager;
  final ZegoLiveAudioRoomConnectManager connectManager;
  final ZegoUIKitPrebuiltLiveAudioRoomInnerText translationText;
  final String name;
  final String topic;

  const ZegoLiveAudioRoomTopBar({
    Key? key,
    required this.config,
    required this.events,
    required this.defaultEndAction,
    required this.defaultLeaveConfirmationAction,
    required this.seatManager,
    required this.connectManager,
    required this.translationText,
    required this.name,
    required this.topic,
  }) : super(key: key);

  @override
  State<ZegoLiveAudioRoomTopBar> createState() =>
      _ZegoLiveAudioRoomTopBarState();
}

/// @nodoc
class _ZegoLiveAudioRoomTopBarState extends State<ZegoLiveAudioRoomTopBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.transparent),
      height: 120.zR,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // minimizingButton(),
          SizedBox(width: 34.zR),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.name,
                style: TextStyle(
                    color: Color(0xFF21242D),
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                widget.topic,
                style: TextStyle(
                    color: Color(0xFF848484),
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
              ),
            ],
          )),
          closeButton(),
          SizedBox(width: 34.zR),
        ],
      ),
    );
  }

  Widget minimizingButton() {
    return widget.config.topMenuBar.buttons
            .contains(ZegoLiveAudioRoomMenuBarButtonName.minimizingButton)
        ? ZegoMinimizingButton(
            rootNavigator: widget.config.rootNavigator,
          )
        : Container();
  }

  Widget closeButton() {
    if (!widget.config.topMenuBar.showLeaveButton) {
      return Container();
    }

    return ZegoLiveAudioRoomLeaveButton(
      buttonSize: Size(60.zR, 60.zR),
      iconSize: Size(24.zR, 24.zR),
      icon: ButtonIcon(
        icon:
            ZegoLiveAudioRoomImage.svgAsset(ZegoLiveAudioRoomIconUrls.icLogout),
        backgroundColor: Color(0xFFFFBF14),
      ),
      config: widget.config,
      events: widget.events,
      defaultEndAction: widget.defaultEndAction,
      defaultLeaveConfirmationAction: widget.defaultLeaveConfirmationAction,
      seatManager: widget.seatManager,
    );
  }
}
