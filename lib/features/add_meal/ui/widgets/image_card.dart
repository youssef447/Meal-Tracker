part of '../pages/add_meal_page.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddMealController>(builder: (controller) {
      return GestureDetector(
        onTap: () {
          controller.pickImage();
        },
        child: Stack(
          alignment: AlignmentDirectional.topEnd,
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 220.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: Colors.white),
              ),
              child: controller.image != null
                  ? Image.file(controller.image!)
                  : CircleAvatar(
                      radius: 20.r,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 19.r,
                        backgroundColor: AppColors.background(context),
                        child: Icon(
                          Icons.add,
                          color: AppColors.primary,
                          size: 20.sp,
                        ),
                      ),
                    ),
            ),
            if (controller.image != null)
              PositionedDirectional(
                end: -5,
                top: -10,
                child: GestureDetector(
                  onTap: () {
                    controller.pickImage();
                  },
                  child: CircleAvatar(
                    backgroundColor: AppColors.primary,
                    radius: 14.r,
                    child: Icon(
                      Icons.edit,
                      size: 14.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
          ],
        ),
      );
    });
  }
}
