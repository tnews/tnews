part of tnews.news_feed.widget;

abstract class XBaseNews extends StatelessWidget {
  final XNews news;
  const XBaseNews(this.news, {Key key}) : super(key: key);
}

class NewsItemWidget extends XBaseNews {
  NewsItemWidget(XNews news, {Key key}) : super(news, key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: () => XError.f4(navigateNewsDetailScreen, context, bloc, id,categoryMap),
      child: Container(
        height: 96,
        child: Flex(
          direction: Axis.horizontal,
          children: <Widget>[
            Flexible(child: _buildImage(this.news.thumbnail)),
            // Expanded(flex: 2, child: _buildContent()),
          ],
        ),
      ),
    );
  }

  Widget _buildImage(String url) {
    final double height = 90;
    final double width = 115;
    return TCacheImageWidget(
      width: width,
      height: height,
      url: url,
    );
  }

  // Widget _buildContent() {
  //   return Container(
  //     padding: const EdgeInsets.only(left: 10),
  //     child: Flex(
  //       direction: Axis.vertical,
  //       mainAxisAlignment: MainAxisAlignment.start,
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: <Widget>[
  //         // _buildTitle(toPascalCase(news.headline)),
  //         SizedBox(height: 3),
  //         Flexible(
  //           child: _buildCreator(news.source, news.url, news.publishedTime,),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // Widget _buildTitle(String headline) {
  //   return HeadlineWidget(
  //     text: headline,
  //     style: SemiBoldTextStyle(16).copyWith(
  //       height: 1.4,
  //       fontSize: 16,
  //     ),
  //   );
  // }

  // Widget _buildCreator(String source, String url, int time) {
  //   final String time = getTime(this.news.publishedTime);
  //   return Flex(
  //     direction: Axis.horizontal,
  //     mainAxisSize: MainAxisSize.max,
  //     children: <Widget>[
  //       _buildTimeWidget(time),
  //       Expanded(
  //         child: SourceWidget(
  //           text: source,
  //           url: url,
  //           style: RegularTextStyle(14).copyWith(
  //             height: 1.4,
  //             color: XedColors.battleShipGrey,
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  // Widget _buildTimeWidget(String time) {
  //   return time is String
  //       ? Text(
  //           time + ' • ',
  //           style: RegularTextStyle(14).copyWith(
  //             height: 1.4,
  //             color: XedColors.battleShipGrey,
  //           ),
  //           maxLines: 1,
  //         )
  //       : SizedBox();
  // }

  // static String getTime(int publishedTime) {
}
