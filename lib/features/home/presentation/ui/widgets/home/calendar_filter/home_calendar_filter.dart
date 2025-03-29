part of '../../../pages/home_page.dart';

class CalenderFilter extends StatelessWidget {
  const CalenderFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SlideAnimation(
      leftToRight: true,
      child: Padding(
        padding: EdgeInsetsDirectional.only(bottom: 12.h),
        child: GetBuilder<HomePageController>(builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TableCalendar(
                onPageChanged: (focusedDay) {
                  controller.filterMeals(focusedDay);
                },
                firstDay: DateTime(2020, 1, 1),
                lastDay: DateTime(2030, 3, 20),
                focusedDay: controller.selectedDate,
                daysOfWeekHeight: 0,
                rowHeight: 0,
                //locale: Get.locale!.languageCode,
                headerStyle: HeaderStyle(
                  headerPadding: EdgeInsets.zero,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: AppColors.button,
                    ),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  formatButtonTextStyle: AppTextStyles.font14BoldText(context)
                      .copyWith(color: Colors.black),
                  titleCentered: true,
                  leftChevronPadding:
                      EdgeInsets.symmetric(horizontal: 6.w, vertical: 8.h),
                  rightChevronPadding:
                      EdgeInsets.symmetric(horizontal: 6.w, vertical: 8.h),
                ),
                availableCalendarFormats: {CalendarFormat.month: 'Month'.tr},
              ),
              const VerticalSpace(12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (controller.filterchanged)
                    GestureDetector(
                      onTap: () {
                        controller.resetFilter();
                      },
                      child: Text(
                        'Reset',
                        style: AppTextStyles.font14BoldText(context)
                            .copyWith(color: Colors.red),
                      ),
                    ),
                  if (!controller.filterchanged) const Spacer(),
                  AppDropdown(
                    height: 40.h,
                    width: 120.w,
                    textButton: 'Sort by: ${controller.sortValue.getName}',
                    items: SortEnum.values
                        .map((e) => DropdownMenuItem<SortEnum>(
                              value: e,
                              child: Row(
                                children: [
                                  Text(
                                    e.getName,
                                    style: AppTextStyles.font12RegularText(
                                        context),
                                  ),
                                  if (controller.sortValue == e)
                                    Padding(
                                      padding: EdgeInsetsDirectional.only(
                                          start: 16.0.w),
                                      child: CircleAvatar(
                                        radius: 6.r,
                                        backgroundColor: AppColors.primary,
                                      ),
                                    ),
                                ],
                              ),
                            ))
                        .toList(),
                    onChanged: (v) {
                      controller.sortMeals(v);
                    },
                  ),
                ],
              ),
            ],
          );
        }),
      ),
    );
  }
}
