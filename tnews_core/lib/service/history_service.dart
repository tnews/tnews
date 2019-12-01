part of t_core.service;

abstract class HistoryService {
  Future<List<XNews>> getAllNews();
}

class HistoryServiceImpl extends HistoryService {
  final CachedNewsDetailService service;

  HistoryServiceImpl(this.service);

  @override
  Future<List<XNews>> getAllNews() {
    return service.getListCachedNews();
  }
}
