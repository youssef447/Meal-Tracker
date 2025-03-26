part of '../../pages/home_page.dart';

class MealCard extends StatelessWidget {
  final MealModel model;
  const MealCard({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return ScaleAnimation(
      child: GetBuilder<HomePageController>(builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            GestureDetector(
              onLongPress: () {
                controller.toggkeCheckBoxes();
                controller.resetCheckBoxes();
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(color: Colors.white)),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (model.image != null)
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16.r),
                            topRight: Radius.circular(16.r)),
                        child: Image.memory(
                          model.image!,
                          frameBuilder: (BuildContext context, Widget child,
                              int? frame, bool? wasSynchronouslyLoaded) {
                            if (frame != null) {
                              return child;
                            } else {
                              return const LinearProgressIndicator();
                            }
                          },
                        ),
                      ),
                    Padding(
                      padding: EdgeInsets.all(5.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            model.name,
                            style: AppTextStyles.font14BoldText(context),
                          ),
                          const VerticalSpace(8),
                          Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.w, vertical: 7.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7.r),
                              gradient: const LinearGradient(
                                colors: AppColors.button,
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            ),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                      text: model.calories.toStringAsFixed(0),
                                      children: [
                                        TextSpan(
                                          text: ' Kcal',
                                          style: AppTextStyles.font12BoldText(
                                                  context)
                                              .copyWith(
                                            color: const Color.fromARGB(
                                                255, 160, 2, 2),
                                          ),
                                        ),
                                      ]),
                                ],
                                style: AppTextStyles.font12BoldText(context),
                              ),
                            ),
                          ),
                          const VerticalSpace(6),
                          Align(
                            alignment: AlignmentDirectional.centerEnd,
                            child: Text(
                              DateFormatHelper.formatDate(model.time),
                              style: AppTextStyles.font12RegularText(context),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (controller.showCheckboxes)
              GetBuilder<HomePageController>(
                  id: 'checkbox ${model.id}',
                  builder: (controller) {
                    return Checkbox(
                      value: controller.checkBoxes[model.id],
                      onChanged: (value) {
                        controller.updateCheckBox(model.id!);
                      },
                    );
                  })
          ],
        );
      }),
    );
  }
}
