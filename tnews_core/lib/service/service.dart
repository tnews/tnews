library t_core.service;

import 'dart:io';
import 'package:path/path.dart' as path;

import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:tnews_core/domain/domain.dart';
import 'package:tnews_core/domain/search_request/search.dart';
import 'package:tnews_core/repository/repository.dart';

part 'cache_service.dart';
part 'storage_service.dart';
part 'news_service.dart';