part of t_core.module;

abstract class DIKeys {
  static const String dio_client = 'dio_client';
  static const String cache_image = 'cache_image';
}

abstract class KeysCached {
  static const String imageCache = 'image_cached';
}

class DevModuleCore extends AbstractModule {
  @override
  void init() async {
    bind(DIKeys.dio_client).to(_buildClient());
    bind(DIKeys.cache_image).to(await _buildCacheImage());
    bind(SharedPreferences).to(await _buildSharedPrefrendces());
    bind(StorageService).to(_buildStorageService());
    bind(NewsRepository).to(_buildNewsRepository());
    bind(NewsService).to(_buildNewsService());
    bind(FavoriteRepository).to(avoriteRepository());
    bind(FavoriteService).to(_buildFavoriteService());
    bind(CachedNewsDetailService).to(_buildCacheNewsDetailService());
    bind(NewsDetailService).to(_buildNewsDetailService());
    bind(HistoryService).to(_buildHistoryService());
  }

  HttpClient _buildClient() {
    final BaseOptions baseOption = BaseOptions(
      baseUrl: Config.getString('api_host'),
      connectTimeout: 10000,
      receiveTimeout: 5000,
      headers: <String, dynamic>{
        HttpHeaders.contentTypeHeader: 'application/json'
      },
    );
    Dio dio = Dio(baseOption);
    return HttpClient.init(dio);
  }

  Future<TCacheService> _buildCacheImage() async {
    final Directory directory = await getTemporaryDirectory();
    FileService fileService = HttpFileService(httpClient: http.Client());

    return TCacheService(
      KeysCached.imageCache,
      directory,
      maxAgeCacheObject: Duration(days: 60),
      maxNrOfCacheObjects: 500,
      fileSerivce: fileService,
    );
  }

  Future<SharedPreferences> _buildSharedPrefrendces() async {
    return SharedPreferences.getInstance();
  }

  StorageService _buildStorageService() {
    final SharedPreferences shared =
        this.get<SharedPreferences>(SharedPreferences);
    final StorageRepository repository = StorageRepositoryImpl(shared);
    return StorageServiceImpl(repository);
  }

  NewsService _buildNewsService() {
    final NewsRepository repository = this.get(NewsRepository);

    return NewsServiceImpl(repository);
  }

  FavoriteRepository avoriteRepository() {
    final SharedPreferences shared = get(SharedPreferences);
    return LocalFavoriteRepository(shared);
  }

  FavoriteService _buildFavoriteService() {
    final FavoriteRepository repository = get(FavoriteRepository);
    return FavoriteServiceImpl(repository);
  }

  CachedNewsDetailService _buildCacheNewsDetailService() {
    final NewsRepository repository = this.get(NewsRepository);

    return CachedNewsDetailServiceImpl(repository);
  }

  NewsDetailService _buildNewsDetailService() {
    return get(CachedNewsDetailService);
  }

  HistoryService _buildHistoryService() {
    final CachedNewsDetailService service = this.get(CachedNewsDetailService);
    return HistoryServiceImpl(service);
  }

  NewsRepository _buildNewsRepository() {
    final HttpClient client = this.get(DIKeys.dio_client);
    return NewsRepositoryImpl(client);
  }
}
