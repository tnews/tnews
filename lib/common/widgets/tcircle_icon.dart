part of tnews.common.widgets;

class TCircleIcon extends StatelessWidget {
  final Icon child;
  final VoidCallback onTap;

  const TCircleIcon({Key key, this.child, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: TColors.white,
          boxShadow: TShadows.defaultShadow,
        ),
        child: Theme(
          data: theme.copyWith(
            iconTheme: IconThemeData(
              color: theme.primaryColor,
              size: 20,
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}


