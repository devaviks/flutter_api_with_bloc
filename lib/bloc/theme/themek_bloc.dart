import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_with_bloc/themes/app_theme.dart';
import 'package:meta/meta.dart';

part 'themek_event.dart';
part 'themek_state.dart';

class ThemekBloc extends Bloc<ThemekEvent, ThemekState> {
  ThemekBloc() : super(ThemekState(themeData: AppThemes.appThemData[AppTheme.lightTheme]));

  @override
  Stream<ThemekState> mapEventToState(ThemekEvent event  ) async* {
    try {
      print("Called");
      if (event is ThemekEvent) {
        print("Called 12 ");
        yield ThemekState(
          themeData: AppThemes.appThemData[event.appTheme],

        );
        print("Called 123 ${event.appTheme}");
      }
    }
    catch( e)
    {
      print(e.toString());
    }
  }
}
