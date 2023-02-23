


import 'country_code_split.dart';
import 'export_file.dart';

Widget sizeBoxWidget({height,width}){
  return SizedBox(height: height,width: width);
}


popMenuItemWidget({Function(int)? onSelectedItem}) {
  return PopupMenuButton<int>(
    icon: Padding(
      padding:  EdgeInsets.only(right: 20.w),
      child: Icon(
        Icons.filter_alt,
        color: Colors.grey,
        size: 45.h,
      ),
    ),
    itemBuilder: (context) => [
      PopupMenuItem<int>(
        value: 1,
        // row has two child icon and text.
        child: Text(LocaleKeys.all.tr ?? ""),
      ),
      PopupMenuItem<int>(
        value: 2,
        // row has two child icon and text.
        child: Text(LocaleKeys.active.tr ?? ""),
      ),
      PopupMenuItem<int>(
        value: 3,
        // row has two child icon and text.
        child: Text(LocaleKeys.in_active.tr ?? ""),
      )
    ],
    offset: Offset(-10, 10),
    color: Colors.white.withOpacity(1),
    onSelected: (selectedIndex) {
      if(onSelectedItem!=null){
        onSelectedItem(selectedIndex);
      }
    },
    elevation: 5,
  );
}

spanTextWidget({firstTitle,secTitle}){
  return Text.rich(
      TextSpan(
          text: firstTitle,
          style:TextStyle( /*textType: TextType.headLine6,*/
              color: Colors.white,
              fontWeight: FontWeight.normal,
              fontSize: 22.sp,


          ),
          children: <InlineSpan>[
            TextSpan(
              text: ' ${secTitle}',
              style: TextStyle(
                  color: Theme.of(Get.context!).colorScheme.secondary,
                  fontWeight: FontWeight.bold,
                fontSize: 24.sp

              ),
            )
          ]
      )
  );

}


hidekeyboard(){
  return FocusScope.of(Get.context!).unfocus();
}

isEmptyFiedds(data){
  if(data?.toString().trim().isEmpty==true) return true; else false;
}


emptyListDataWidget() {
  return BiaText(
    LocaleKeys.empty_list.tr,
    fontSize: 25.h,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );



}

Map<String,dynamic> getCountryNameBycode({phnNumber}){
  Map<String,dynamic> finalMap={};
  phnNumber="+"+phnNumber.toString();
    Map<String, String> foundedCountry = {};
    for (var country in CountryCodeSplit.allCountries) {
      String dialCode = country["dial_code"].toString();
      if (phnNumber.contains(dialCode)) {
        foundedCountry = country;
      }
    }

      foundedCountry;

    print(foundedCountry);
    if (foundedCountry.isNotEmpty) {
      var dialCode = phnNumber.substring(
        0,
        foundedCountry["dial_code"]!.length,
      );
      var newPhoneNumber = phnNumber.substring(
        foundedCountry["dial_code"]!.length,
      );
      finalMap['dial_code']=dialCode;
      finalMap['newPhoneNumber']=newPhoneNumber;
      return finalMap;

    }

    return finalMap;

}

getIsUser(){
  if(box.read(Config.keys.userType)!=null&&box.read(Config.keys.userType)=='USER'){
    return "USER";
  }else{
    return "MERCHANT";
  }
}