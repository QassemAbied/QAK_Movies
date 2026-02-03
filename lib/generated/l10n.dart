// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Top Reacted`
  String get title1 {
    return Intl.message('Top Reacted', name: 'title1', desc: '', args: []);
  }

  /// `Up Coming`
  String get title2 {
    return Intl.message('Up Coming', name: 'title2', desc: '', args: []);
  }

  /// `Popular`
  String get title3 {
    return Intl.message('Popular', name: 'title3', desc: '', args: []);
  }

  /// `Playing Now`
  String get title4 {
    return Intl.message('Playing Now', name: 'title4', desc: '', args: []);
  }

  /// `Trend`
  String get title5 {
    return Intl.message('Trend', name: 'title5', desc: '', args: []);
  }

  /// `See More`
  String get seeMore {
    return Intl.message('See More', name: 'seeMore', desc: '', args: []);
  }

  /// `Status`
  String get Status {
    return Intl.message('Status', name: 'Status', desc: '', args: []);
  }

  /// `Revenue`
  String get Revenue {
    return Intl.message('Revenue', name: 'Revenue', desc: '', args: []);
  }

  /// `Images For Movie`
  String get ImagesForMovie {
    return Intl.message(
      'Images For Movie',
      name: 'ImagesForMovie',
      desc: '',
      args: [],
    );
  }

  /// `Images For Cast`
  String get ImagesForCast {
    return Intl.message(
      'Images For Cast',
      name: 'ImagesForCast',
      desc: '',
      args: [],
    );
  }

  /// `Similar Movies`
  String get SimilarMovies {
    return Intl.message(
      'Similar Movies',
      name: 'SimilarMovies',
      desc: '',
      args: [],
    );
  }

  /// `Original Title`
  String get OriginalTitle {
    return Intl.message(
      'Original Title',
      name: 'OriginalTitle',
      desc: '',
      args: [],
    );
  }

  /// `Overview`
  String get Overview {
    return Intl.message('Overview', name: 'Overview', desc: '', args: []);
  }

  /// `Favorites`
  String get Favorites {
    return Intl.message('Favorites', name: 'Favorites', desc: '', args: []);
  }

  /// `WatchList`
  String get watchList {
    return Intl.message('WatchList', name: 'watchList', desc: '', args: []);
  }

  /// `Home`
  String get Home {
    return Intl.message('Home', name: 'Home', desc: '', args: []);
  }

  /// `Search`
  String get Search {
    return Intl.message('Search', name: 'Search', desc: '', args: []);
  }

  /// `Favorite`
  String get Favorite {
    return Intl.message('Favorite', name: 'Favorite', desc: '', args: []);
  }

  /// `WatchList`
  String get WatchList {
    return Intl.message('WatchList', name: 'WatchList', desc: '', args: []);
  }

  /// `Search movies...`
  String get searchMovies {
    return Intl.message(
      'Search movies...',
      name: 'searchMovies',
      desc: '',
      args: [],
    );
  }

  /// `No Favorites Yet`
  String get noFavoritesYet {
    return Intl.message(
      'No Favorites Yet',
      name: 'noFavoritesYet',
      desc: '',
      args: [],
    );
  }

  /// `No WatchList Yet`
  String get noWatchListYet {
    return Intl.message(
      'No WatchList Yet',
      name: 'noWatchListYet',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `Profile`
  String get profile {
    return Intl.message('Profile', name: 'profile', desc: '', args: []);
  }

  /// `Theme Mode`
  String get theme {
    return Intl.message('Theme Mode', name: 'theme', desc: '', args: []);
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
