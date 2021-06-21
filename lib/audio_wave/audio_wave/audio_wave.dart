import 'package:audio_wave/audio_wave/audio_wave/audio_wave_controller.dart';
import 'package:flutter/material.dart';

class AudioWave extends StatelessWidget {
  AudioWave({
    @required this.audioWaveController,
    this.height,
    this.activeBarColor = const Color(0xFF81B3C1),
    this.inActiveBarColor = Colors.black54,
  });

  final AudioWaveController audioWaveController;

  ///[height] is the height of the container
  final double height;

  /// [activeBarColor] is the color of the bar
  final Color activeBarColor;

  /// [inActiveBarColor] is the color of the bar
  final Color inActiveBarColor;

  @override
  Widget build(BuildContext context) {
    double _containerHeight = height;
    if (_containerHeight == null) {
      final double _blockSizeVertical =
          MediaQuery.of(context).size.height / 100;
      _containerHeight = 3 * _blockSizeVertical;
    }

    final double _blockSizeHorizontal = MediaQuery.of(context).size.width / 100;

    final double _barWidth = 0.3 * _blockSizeHorizontal;

    final double _spacing = 0.3 * _blockSizeHorizontal;

    return Container(
      height: _containerHeight,
      child: ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.all(0),
        itemCount: audioWaveController.audioWaves.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext _, int index) {
          double bar = audioWaveController.audioWaves[index] * 100;

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(right: _spacing),
                height: bar * _containerHeight / 100,
                width: _barWidth,
                decoration: BoxDecoration(
                  color:
                      //TODO
                      // index <= _barAnimation.value
                      //     ? activeBarColor
                      //     :
                      inActiveBarColor,
                  borderRadius: BorderRadius.circular(_barWidth),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
