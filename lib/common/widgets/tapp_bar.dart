part of tnews.common.widgets;

abstract class TAppBar extends PreferredSize {
  const TAppBar({Widget child, Key key, Size preferredSize})
      : super(key: key, child: child, preferredSize: preferredSize ?? const Size.fromHeight(56.0));
  @override
  Widget build(BuildContext context) => SafeArea(child: child);
}
