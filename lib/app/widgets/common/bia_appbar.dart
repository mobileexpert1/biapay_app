import '../../configs/assets.dart';
import '../../modules/dashboard/controllers/dashboard_controller.dart';
import '../export_file.dart';

class BiaAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showIcon;
  final String? title;
  final bool centerTitle;
  final bool showAction;
  final bool? isShowFilter;
  final Widget? filterWidget;
  Function? onBackPressed;

  BiaAppBar(
      {this.showIcon = true,
      this.centerTitle = true,
      this.isShowFilter = false,
      this.showAction = true,
      this.filterWidget,
      this.title,
      this.onBackPressed});

  factory BiaAppBar.simple(String title,
          {bool? isShowFilter,
          Widget? filterWidget,
          Function? onBackPressed}) =>
      BiaAppBar(
        centerTitle: false,
        showIcon: false,
        title: title,
        showAction: false,
        onBackPressed: onBackPressed,
        isShowFilter: isShowFilter ?? false,
        filterWidget: filterWidget ?? Container(),
      );

  @override
  Size get preferredSize => const Size.fromHeight(65);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DashboardController());
    return AppBar(
      elevation: 1,
      leading: centerTitle
          ? InkWell(
              onTap: () => Scaffold.of(context).openDrawer(),
              child: Container(
                height: double.infinity,
                width: 60.w,
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                alignment: Alignment.center,
                child: Image.asset(
                  Assets.menu,
                  width: 35.w,
                ),
              ),
            )
          : onBackPressed != null
              ? IconButton(
                  onPressed: () {
                    onBackPressed!();
                  },
                  iconSize: 40.w,
                  icon: Icon(
                    Icons.chevron_left_outlined,
                    color: Colors.blue[900],
                    // size: 40.w,
                  ))
              : Navigator.canPop(context)
                  ? IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      iconSize: 40.w,
                      icon: Icon(
                        Icons.chevron_left_outlined,
                        color: Colors.blue[900],
                      ))
                  : null,
      actions: [
        if (showAction)
          GetBuilder<DashboardController>(builder: (controller) {
            return Container(
              height: 10.h,
              width: 100.w,
              child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    index = controller.lastlogin!.length - 2;
                    return BiaText(
                      "Last login -\n${index != -2 ? controller.lastlogin!.value[index].date : "loading..."}",
                      fontSize: 13,
                      color: Colors.blue,
                      padding: EdgeInsets.only(top: 13.w),
                    );
                  }),
            );
          }),
        if (isShowFilter!) filterWidget!,
      ],
      backgroundColor: Colors.white,
      titleSpacing: 0,
      toolbarHeight: 90.h,
      title: title != null
          ? BiaText(
              title,
              textType: TextType.headLine5,
              fontWeight: FontWeight.w600,
              color: Colors.blue[900],
            )
          : showIcon
              ? Center(
                  child: Image.asset(
                    Assets.landingLogo,
                    width: 144.w,
                    fit: BoxFit.contain,
                  ),
                )
              : null,
      centerTitle: centerTitle,
    );
  }
}
