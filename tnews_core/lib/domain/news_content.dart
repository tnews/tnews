part of t_core.domain;
/**
 * @author tvc12
 * @email meomeocf98@gmail.com
 * @create date 2019-10-31 23:13:18
 * @modify date 2019-10-31 23:13:18
 * @desc BaseContent
 */

@immutable
abstract class BaseNewsContent {
  static const String textType = 'text_content';
  static const String imageType = 'text_content';

  final String contentType;

  BaseNewsContent(this.contentType);

  @mustCallSuper
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      'content_type': contentType,
    };
    return data;
  }
}

class TextContent extends BaseNewsContent {
  final String text;
  TextContent(this.text) : super(BaseNewsContent.textType);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = super.toJson();
    addValueToMap('text', text, data);
    return data;
  }

  @override
  String toString() => text;
}

class ImageContent extends BaseNewsContent {
  final String text;
  final String imageUrl;
  ImageContent(this.imageUrl, this.text) : super(BaseNewsContent.imageType);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = super.toJson();
    addValueToMap('text', text, data);
    addValueToMap('image', imageUrl, data);

    return data;
  }

  @override
  String toString() => 'url: $imageUrl, text: $text';
}
