part of '../../../pages/home_page.dart';

class HomeFloatingButton extends StatelessWidget {
  const HomeFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(builder: (controller) {
      return HomeShowcase(
        showcasekey: controller.showcaseAdd,
        type: ShowcaseTypes.last,
        description: '  Add your first meal',
        child: FloatingActionButton(
          onPressed: () {
            if (controller.checkBoxes.values
                .any((element) => element == true)) {
              controller.deleteMeals();
            } else if (controller.showCheckboxes) {
              controller.toggkeCheckBoxes();
            } else {
              context.navigate(AppRoutes.addMeal);
            }
          },
          backgroundColor: Colors.transparent,
          shape: const CircleBorder(
            side: BorderSide(
              color: Colors.white,
            ),
          ),
          splashColor: Colors.transparent,
          hoverElevation: 0,
          elevation: 0,
          highlightElevation: 0,
          child: controller.showCheckboxes
              ? CircleAvatar(
                  radius: 25.r,
                  backgroundColor: Colors.red,
                  child:
                      SvgPicture.asset(AppAssets.cancel, color: Colors.white),
                )
              : AppDefaultButton(
                  icon: AppAssets.add,
                  shape: BoxShape.circle,
                  height: 55.h,
                  width: 55.h,
                ),
        ),
      );
    });
  }
}
