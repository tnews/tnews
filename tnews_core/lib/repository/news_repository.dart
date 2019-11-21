part of t_core.repository;

abstract class NewsRepository {
  Future<List<Language>> getLanguages();
  Future<List<Category>> getCategories();
  Future<List<News>> searchNews([SearchRequest request]);
  Future<List<XNews>> searchXNews([SearchRequest request]);
}

class FakeNewsRepository extends NewsRepository {
  final Random random = Random();
  Duration get timeDelay => Duration(milliseconds: random.nextInt(3000) + 300);

  final List<String> sources = <String>["cat.com", "dog.com", "tiger.com", "ahihi.com"];
  final List<String> authors = <String>["roman", "woman", "tiger", "ahihi"];
  final List<Category> categories = <Category>[
    Category(id: ThinId.randomId(), name: "Travel"),
    Category(id: ThinId.randomId(), name: "All"),
    Category(id: ThinId.randomId(), name: "Woman"),
    Category(id: ThinId.randomId(), name: "World"),
    Category(id: ThinId.randomId(), name: "Animal"),
  ];

  final List<String> contents = <String>[
    "Hàng nghìn hộ dân hoang mang vì nước sạch có mùi lạ",
    """"Chiều tối 11/10, anh Trần Minh Hoàng ở tòa nhà Hồ Gươm Plaza (phường Mỗ Lao, Hà Đông) phải đi mua hai bình nước tinh khiết loại 20 lít để nấu ăn cho cả gia đình và tắm cho trẻ nhỏ. Theo anh Hoàng, từ tối qua gia đình đã phát hiện nước sạch sinh hoạt bốc mùi khó chịu, nồng nặc như mùi clo. Sau hơn một ngày, hiện tượng nước có mùi không giảm.""",
    """Nhiều người dân phản ánh nước sạch dùng cho sinh hoạt của gia đình có mùi lạ. Ảnh: Thành Chung.""",
    """Nhiều hộ dân ở khu vực quận Hà Đông, các khu đô thị Kim Văn, Kim Lũ (Đại Kim, Hoàng Mai), tổ hợp chung cư HH Linh Đàm, Trung Văn (Nam Từ Liêm)... đều ghi nhận việc nước sạch có mùi lạ từ ngày 10/10.""",
    """Chị Vũ Hiền (khu chung cư Intracom tại Trung Văn, Nam Từ Liêm) cho biết, mùi nước rất hắc, xộc lên như mùi hóa chất, khét nồng. \"Tôi đánh răng mà cảm giác cứ buồn nôn. Thậm chí, tay được lau sạch sẽ vẫn không hết mùi\", chị Hiền mô tả.""",
    """Sống tại tổ hợp chung cư HH Linh Đàm, quận Hoàng Mai, anh Nguyễn Đình Hải cho biết, từ sáng 10/10, khi gia đình vệ sinh cá nhân đã thấy nước chảy ra từ vòi có mùi hôi khen khét, rất khó ngửi. \"Đến hôm nay, tình hình không khả quan hơn. Những ngày khác thì vợ tôi sẽ dậy sớm để làm bữa sáng cho gia đình nhưng hôm nay thì không dám dùng nước trong vòi để rửa tay\", anh Hải nói."""
        """Lãnh đạo Công ty TNHH MTV Nước sạch Hà Đông và Công ty CP Viwaco - hai đơn vị cung cấp nước cho các khu vực trên xác nhận việc người dân phản ánh hiện tượng nước có mùi và cho hay đã thông tin tới đơn vị liên quan.""",
    """Cán bộ Trung tâm kiểm soát bệnh tật thành phố lấy mẫu nước tại Nhà máy nước sạch sông Đà chiều 11/10. Ảnh: Võ Hải.""",
    """Chiều nay, đoàn liên ngành TP Hà Nội gồm Sở Xây dựng, Thanh tra Sở Y tế, Trung tâm kiểm soát bệnh tật thành phố và các đơn vị cung cấp nước sạch sông Đà đã đi kiểm tra, lấy mẫu nước tại ba địa điểm: Trạm bơm tăng áp Tây Mỗ (quận Nam Từ Liêm); bể chứa trung gian tại huyện Thạch Thất; và tại Nhà máy nước sông Đà, tỉnh Hoà Bình.""",
    """Đại diện đoàn kiểm tra, ông Lê Văn Du - Phó phòng hạ tầng kỹ thuật đô thị (Sở Xây dựng Hà Nội), cho biết ngoài việc lấy mẫu nước để kiểm tra, đoàn đã yêu cầu Công ty cổ phần đầu tư nước sạch sông Đà cung cấp toàn bộ nhật ký lịch trình cung cấp nước và quy trình quản lý vận hành cấp nước những ngày vừa qua; trong đó có lịch trình, số lượng các loại hoá chất đã sử dụng.""",
    """Theo ông Toản, nhà máy cung cấp 300.000 m3 nước/ngày, đêm cho nhiều quận huyện của Hà Nội. Công ty đang phối hợp với đơn vị độc lập để kiểm tra chất lượng nước.""",
    """Ông Vũ Đức Toản - Phó tổng giám đốc Công ty cổ phần đầu tư nước sạch sông Đà khẳng định nhà máy nước sạch sông Đà đang vận hành bình thường theo đúng quy trình \"đảm bảo chất lượng nước đầu ra theo tiêu chuẩn của Bộ Y tế""",
    """Tài xế Mercedes nhầm chân ga 'vì giày cao gót""",
    """Sáng 21/11, Công an quận Cầu Giấy cho biết tài xế Vũ Thị Hồng Thái sau khi gây tai nạn tại chân cầu vượt Lê Văn Lương đã đến trình diện.""",
    """Bà Thái khai, khoảng 7h30 ngày 20/11 lái chiếc Mercedes GLC 250 đến nút giao Lê Văn Lương - Nguyễn Ngọc Vũ (chân cầu vượt Lê Văn Lương). Thấy một số xe phía trước đang dừng đèn đỏ, bà chuyển sang chân phanh nhưng lại đạp nhầm chân ga, do đi giày cao gót.""",
    """Ôtô đâm vào ba xe máy và một xe đạp, khiến một người chết. Chiếc Mercedes GLC 250 phát cháy cùng xe của các nạn nhân. Một số nhân chứng cho hay, khi tai nạn xảy ra, họ \"nghe thấy hai tiếng nổ lớn, sau đó ôtô bốc cháy""",
    """Chiếc xe bốc cháy sau khi đâm vào ba xe máy""",
    """Theo cơ quan công an, bà Thái không có nồng độ cồn. Chiếc Mercedes đứng tên sở hữu của bà Thái, vừa mới mua""",
    """Đường ống nước sông Đà lại gặp sự cố""",
    """Đường ống truyền tải nước sạch sông Đà bị rò rỉ, nước chảy tràn ra Đại lộ Thăng Long khiến 280.000 hộ dân Hà Nội bị dừng cấp nước từ 17h ngày 20/11.""",
    """Điểm rò rỉ được phát hiện tại Km số 25+500 Đại lộ Thăng Long (huyện Thạch Thất). Tại Km27, nước từ đường ống chảy tràn ra đường khiến cầu chui dân sinh và mặt đường ngập hơn 30 cm. Công ty nước sạch sông Đà đã đóng van tại nhà máy và điều động một máy xúc cùng 15 công nhân đi khắc phục sự cố.""",
    """Do nước bị cắt từ nhà máy nên nhiều khu dân cư ở quận Hà Đông, Thanh Xuân, Nam Từ Liêm, Hoàng Mai... không có nước sạch từ 17h hôm nay. Các đơn vị phân phối nước sạch sông Đà như Công ty Viwaco, Công ty nước sạch Hà Đông đã thông báo dừng cấp nước, đề nghị khách hàng sử dụng nước tiết kiệm.""",
    """Đường ống nước sông Đà gặp sự cố, nước chảy tràn ra đường Đại lộ Thăng Long""",
    """Những hộ dân không có bể ngầm hoặc ở cuối nguồn cấp có thể sẽ bị mất nước trong một ngày\", ông Nguyễn Hữu Tới, Tổng giám đốc Công ty Viwaco nói. Dự kiến nhà máy sẽ cấp nước trở lại vào 3h ngày 21/11.""",
    """Nhà máy nước sạch sông Đà do Công ty Cổ phần nước sạch sông Đà (Viwasupco) quản lý, cung cấp trung bình 250.000 - 260.000 m3 nước mỗi ngày đêm cho hơn  280.000 hộ dân của Hà Nội.""",
  ];

  final List<String> images = <String>[
    "https://i-vnexpress.vnecdn.net/2019/11/20/75534907-829759927481602-21779-9798-9383-1574251811.jpg",
    "https://i-vnexpress.vnecdn.net/2019/11/20/75534907-829759927481602-21779-9798-9383-1574251811.jpg",
    "https://i-vnexpress.vnecdn.net/2019/10/11/ngu-o-i-da-n-3933-1570804139.jpg",
    "https://i-vnexpress.vnecdn.net/2019/10/11/la-y-ma-u-nu-o-c-ta-i-NM-so-ng-3932-7375-1570804140.jpg",
    "https://i-vnexpress.vnecdn.net/2019/11/20/39thithe98321573141973-1574240-2623-1382-1574240922.jpg",
    "https://i-vnexpress.vnecdn.net/2019/11/20/saiphamtatthanhcang-2-15458985-9894-6788-1574219821.jpg",
    "https://i-vnexpress.vnecdn.net/2019/11/21/2-1574212039-1200x0-2811-1574319476.jpg",
    "https://i-vnexpress.vnecdn.net/2019/11/21/Bui-Thanh-Son-5741-1574305766.jpg",
    "https://i-vnexpress.vnecdn.net/2019/10/05/giet-nguoi-3642-1570262489.jpg"
  ];

  @override
  Future<List<Category>> getCategories() {
    return Future<Category>.delayed(timeDelay).then((_) {
      return categories;
    });
  }

  @override
  Future<List<Language>> getLanguages() {
    return Future<Language>.delayed(timeDelay).then((_) {
      return <Language>[
        Language(id: ThinId.randomId(), name: "English"),
        Language(id: ThinId.randomId(), name: "Vietnamese"),
        Language(id: ThinId.randomId(), name: "Chinese"),
        Language(id: ThinId.randomId(), name: "Koraen"),
        Language(id: ThinId.randomId(), name: "Japanese"),
      ];
    });
  }

  @override
  Future<List<News>> searchNews([SearchRequest request]) {
    return Future<List<News>>.delayed(timeDelay).then((_) {
      return <News>[];
    });
  }

  @override
  Future<List<XNews>> searchXNews([SearchRequest request]) {
    return Future<List<XNews>>.delayed(timeDelay).then((_) {
      return List<XNews>.generate(request.size, (_) => _getXNews());
    });
  }

  String getRandom(List<dynamic> list) {
    return list[random.nextInt(list.length)];
  }

  XNews _getXNews() {
    return XNews(
      id: ThinId.randomId(),
      lang: ThinId.randomId(),
      source: getRandom(sources),
      author: getRandom(authors),
      authors: <String>[
        getRandom(authors),
        getRandom(authors),
        getRandom(authors),
      ],
      categories: <String>[
        getRandom(categories),
        getRandom(categories),
        getRandom(categories),
      ],
      contents: <String>[
        getRandom(contents),
        getRandom(contents),
        getRandom(contents),
        getRandom(contents),
        getRandom(contents),
        getRandom(contents),
        getRandom(contents),
        getRandom(contents),
      ],
      description: getRandom(contents),
      headline: getRandom(contents),
      originId: ThinId.randomId(),
      thumbnail: getRandom(images),
      url: getRandom(images),
    );
  }
}
