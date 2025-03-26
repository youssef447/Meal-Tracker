part of '../../pages/home_page.dart';

class HomeAppbar extends GetView<HomePageController>
    implements PreferredSizeWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'Meal Tracker',
        style: AppTextStyles.font18BoldText(context),
      ),
      actions: [
        GetBuilder<AppThemeController>(builder: (themeController) {
          return HomeShowcase(
            showcasekey: controller.showcaseTheme,
            type: ShowcaseTypes.first,
            description: '  toggle Light/Dark theme',
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 650),
              transitionBuilder: (child, anim) => RotationTransition(
                turns: child.key == const ValueKey('dark')
                    ? Tween<double>(begin: 0.85, end: 1).animate(anim)
                    : Tween<double>(begin: 0.75, end: 1).animate(anim),
                child: ScaleTransition(
                  scale: anim,
                  child: child,
                ),
              ),
              child: Icon(
                  key: themeController.isDark
                      ? const ValueKey('dark')
                      : const ValueKey('light'),
                  themeController.isDark
                      ? Icons.nightlight_round_sharp
                      : Icons.wb_sunny,
                  size: 24.sp,
                  color: themeController.isDark
                      ? Colors.white
                      : const Color.fromARGB(255, 203, 107, 4)),
            ),
          );
        }),
        GetBuilder<AppThemeController>(builder: (themeController) {
          return DefaultSwitchButton(
            value: themeController.isDark,
            onChanged: (bool value) async {
              themeController.changeTheme();
            },
          );
        }),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60.h);
}
