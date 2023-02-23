import 'package:biapay_app/app/modules/events/views/new_event.dart';
import 'package:biapay_app/app/widgets/export_file.dart';
import 'package:get/get.dart';

class EcommerceDetailController extends GetxController {

  bool productSelection = false;
  int selectionCategoryIndex = 0;
  int itemCount = 0;
  double itemPrice = 0;
  bool productAdded = false;

  toggleSelection(int index) {
    productSelection = !productSelection;
    selectionCategoryIndex = index;
    update();
  }

  updateItemCount(String action, double baseItemPrice) {
    print("item count-----> " + itemCount.toString());
    if (action == "add") {
      itemCount = itemCount + 1;
      itemPrice = baseItemPrice * itemCount;
    } else {
      if (itemCount > 0) {
        itemCount = itemCount - 1;
        itemPrice = baseItemPrice * itemCount;
      }
    }
    print("item count-----> " + itemCount.toString());
    update();
  }

  addToCartTapped() {
    //---------------------- receive items here from params
    productAdded = true;
    update();
  }

}