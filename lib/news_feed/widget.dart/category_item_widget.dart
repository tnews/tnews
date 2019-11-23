part of tnews.news_feed.widget;

class CategoryItemWidget extends StatelessWidget {
  final Category category;
  final bool isSelected;
  final VoidCallback onTap;
  const CategoryItemWidget({this.category, Key key, this.isSelected, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isSelected = this.isSelected ?? false;
    final Color color = _getColor(isSelected, theme);
    final TextStyle style = _getStyle(isSelected, theme);
    final Border border = _getBorder(isSelected, theme);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          color: color,
          border: border,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            category.name,
            style: style,
          ),
        ),
      ),
    );
  }

  Color _getColor(bool isSelected, ThemeData theme) {
    return isSelected ? theme.primaryColor : TColors.transparent;
  }

  TextStyle _getStyle(bool isSelected, ThemeData theme) {
    return isSelected
        ? theme.accentTextTheme.body1
        : theme.accentTextTheme.body1.copyWith(color: theme.textTheme.body1.color);
  }

  Border _getBorder(bool isSelected, ThemeData theme) {
    return isSelected
        ? null
        : Border.all(
            color: TColors.duck_egg_blue
          );
  }
}
