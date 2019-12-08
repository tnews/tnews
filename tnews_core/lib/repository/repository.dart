library t_core.repository;

import 'dart:convert';
import 'dart:math';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tnews_core/domain/domain.dart';
import 'package:tnews_core/util/logger.dart';
import 'package:meta/meta.dart';

part 'storage_repository.dart';
part 'news_repository.dart';
part 'favorite_repository.dart';