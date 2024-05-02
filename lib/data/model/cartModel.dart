class CartModel {
  int? itemsPriceForItemAfterCount;
  int? countitems;
  int? cartId;
  int? cartUsersid;
  int? cartItemsid;
  int? itemsId;
  String? itemsName;
  String? itemsNameAr;
  String? itemsDesc;
  String? itemsDescAr;
  String? itemsImages;
  int? itemsCount;
  int? itemsActive;
  int? itemsPriceForItemBeforeCount;
  int? itemsDiscount;
  String? itemsDate;
  int? itemsCat;

  CartModel(
      {this.itemsPriceForItemAfterCount,
        this.countitems,
        this.cartId,
        this.cartUsersid,
        this.cartItemsid,
        this.itemsId,
        this.itemsName,
        this.itemsNameAr,
        this.itemsDesc,
        this.itemsDescAr,
        this.itemsImages,
        this.itemsCount,
        this.itemsActive,
        this.itemsPriceForItemBeforeCount,
        this.itemsDiscount,
        this.itemsDate,
        this.itemsCat});

  CartModel.fromJson(Map<String, dynamic> json) {
    itemsPriceForItemAfterCount = json['itemsprice'];
    countitems = json['countitems'];
    cartId = json['cart_id'];
    cartUsersid = json['cart_usersid'];
    cartItemsid = json['cart_itemsid'];
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsNameAr = json['items_name_ar'];
    itemsDesc = json['items_desc'];
    itemsDescAr = json['items_desc_ar'];
    itemsImages = json['items_images'];
    itemsCount = json['items_count'];
    itemsActive = json['items_active'];
    itemsPriceForItemBeforeCount = json['items_price'];
    itemsDiscount = json['items_discount'];
    itemsDate = json['items_date'];
    itemsCat = json['items_cat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemsprice'] = this.itemsPriceForItemAfterCount;
    data['countitems'] = this.countitems;
    data['cart_id'] = this.cartId;
    data['cart_usersid'] = this.cartUsersid;
    data['cart_itemsid'] = this.cartItemsid;
    data['items_id'] = this.itemsId;
    data['items_name'] = this.itemsName;
    data['items_name_ar'] = this.itemsNameAr;
    data['items_desc'] = this.itemsDesc;
    data['items_desc_ar'] = this.itemsDescAr;
    data['items_images'] = this.itemsImages;
    data['items_count'] = this.itemsCount;
    data['items_active'] = this.itemsActive;
    data['items_price'] = this.itemsPriceForItemBeforeCount;
    data['items_discount'] = this.itemsDiscount;
    data['items_date'] = this.itemsDate;
    data['items_cat'] = this.itemsCat;
    return data;
  }
}