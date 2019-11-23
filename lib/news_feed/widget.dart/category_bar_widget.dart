part of tnews.news_feed.widget;

class CategoryBarWidget extends TStatefulWidget {
  final List<Category> categories;
  final ValueChanged<Category> onCategoryChanged;
  final int initSeleted;

  const CategoryBarWidget(
      {@required this.categories, this.initSeleted, this.onCategoryChanged, Key key})
      : super(key: key);

  @override
  _CategoryBarWidgetState createState() => _CategoryBarWidgetState();
}

class _CategoryBarWidgetState extends TState<CategoryBarWidget> {
  int currentSeleted;
  @override
  void initState() {
    super.initState();
    currentSeleted = widget.initSeleted ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      primary: false,
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: widget.categories.length,
      itemBuilder: (_, int index) {
        return CategoryItemWidget(
          category: widget.categories[index],
          isSelected: index == currentSeleted,
          onTap: () => setState(() {
            currentSeleted = index;
            if (widget.onCategoryChanged != null)
              widget.onCategoryChanged(widget.categories[index]);
          }),
        );
      },
    );
  }
}
