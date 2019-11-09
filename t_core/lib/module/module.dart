library t_core.module;

import 'dart:io';

import 'package:ddi/di.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:t_core/t_core.dart';
import 'package:dio/dio.dart';
import 'package:ddi/ddi.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

part 'dev_module_core.dart';
part 'production_module_core.dart';
