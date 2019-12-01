part of t_core.service;

abstract class HistoryService {
  Future<List<XNews>> getListNews();
}

class HistoryServiceImpl extends HistoryService {
  final CachedNewsDetailService service;

  HistoryServiceImpl(this.service);

  @override
  Future<List<XNews>> getListNews() {
    return service.getListCachedNews();
  }
}
