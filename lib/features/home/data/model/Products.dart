class ProductsApiResponse {
  bool success;
  int statusCode;
  String timestamp;
  Data data;

  ProductsApiResponse(
      {this.success, this.statusCode, this.timestamp, this.data});

  ProductsApiResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['statusCode'];
    timestamp = json['timestamp'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['statusCode'] = this.statusCode;
    data['timestamp'] = this.timestamp;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  int items;
  List<Products> products;

  Data({this.items, this.products});

  Data.fromJson(Map<String, dynamic> json) {
    items = json['items'];
    if (json['products'] != null) {
      products = new List<Products>();
      json['products'].forEach((v) {
        products.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['items'] = this.items;
    if (this.products != null) {
      data['products'] = this.products.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  int id;
  String name;
  int sellingPrice;
  int maximumRetailPrice;
  int maximumOrderQuantity;
  List<String> badgeTags;
  bool onlyPreorder;
  String deliveryCategory;
  Unit unit;
  List<ProductVariants> productVariants;
  Hub category;
  Image icon;
  Image image;
  List<AvailableSlots> availableSlots;
  bool isFavorite;
  List<String> promotions;
  bool isPrimary;
  int expressDeliveryIn;

  Products(
      {this.id,
      this.name,
      this.sellingPrice,
      this.maximumRetailPrice,
      this.maximumOrderQuantity,
      this.badgeTags,
      this.onlyPreorder,
      this.deliveryCategory,
      this.unit,
      this.productVariants,
      this.category,
      this.icon,
      this.image,
      this.availableSlots,
      this.isFavorite,
      this.promotions,
      this.isPrimary,
      this.expressDeliveryIn});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    sellingPrice = json['sellingPrice'];
    maximumRetailPrice = json['maximumRetailPrice'];
    maximumOrderQuantity = json['maximumOrderQuantity'];
    badgeTags = json['badgeTags'].cast<String>();
    onlyPreorder = json['onlyPreorder'];
    deliveryCategory = json['deliveryCategory'];
    unit = json['unit'] != null ? new Unit.fromJson(json['unit']) : null;
    if (json['productVariants'] != null) {
      productVariants = new List<ProductVariants>();
      json['productVariants'].forEach((v) {
        productVariants.add(new ProductVariants.fromJson(v));
      });
    }
    category =
        json['category'] != null ? new Hub.fromJson(json['category']) : null;
    icon = json['icon'] != null ? new Image.fromJson(json['icon']) : null;
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
    if (json['availableSlots'] != null) {
      availableSlots = new List<AvailableSlots>();
      json['availableSlots'].forEach((v) {
        availableSlots.add(new AvailableSlots.fromJson(v));
      });
    }
    isFavorite = json['isFavorite'];
    promotions = json['promotions'].cast<String>();
    isPrimary = json['isPrimary'];
    expressDeliveryIn = json['expressDeliveryIn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['sellingPrice'] = this.sellingPrice;
    data['maximumRetailPrice'] = this.maximumRetailPrice;
    data['maximumOrderQuantity'] = this.maximumOrderQuantity;
    data['badgeTags'] = this.badgeTags;
    data['onlyPreorder'] = this.onlyPreorder;
    data['deliveryCategory'] = this.deliveryCategory;
    if (this.unit != null) {
      data['unit'] = this.unit.toJson();
    }
    if (this.productVariants != null) {
      data['productVariants'] =
          this.productVariants.map((v) => v.toJson()).toList();
    }
    if (this.category != null) {
      data['category'] = this.category.toJson();
    }
    if (this.icon != null) {
      data['icon'] = this.icon.toJson();
    }
    if (this.image != null) {
      data['image'] = this.image.toJson();
    }
    if (this.availableSlots != null) {
      data['availableSlots'] =
          this.availableSlots.map((v) => v.toJson()).toList();
    }
    data['isFavorite'] = this.isFavorite;
    data['promotions'] = this.promotions;
    data['isPrimary'] = this.isPrimary;
    data['expressDeliveryIn'] = this.expressDeliveryIn;
    return data;
  }
}

class Unit {
  String code;
  String name;

  Unit({this.code, this.name});

  Unit.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['name'] = this.name;
    return data;
  }
}

class ProductVariants {
  int id;
  String name;
  String description;
  int maximumRetailPrice;
  int unitValue;
  int grossWeightValue;
  Image image;
  HubInformation hubInformation;

  ProductVariants(
      {this.id,
      this.name,
      this.description,
      this.maximumRetailPrice,
      this.unitValue,
      this.grossWeightValue,
      this.image,
      this.hubInformation});

  ProductVariants.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    maximumRetailPrice = json['maximumRetailPrice'];
    unitValue = json['unitValue'];
    grossWeightValue = json['grossWeightValue'];
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
    hubInformation = json['hubInformation'] != null
        ? new HubInformation.fromJson(json['hubInformation'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['maximumRetailPrice'] = this.maximumRetailPrice;
    data['unitValue'] = this.unitValue;
    data['grossWeightValue'] = this.grossWeightValue;
    if (this.image != null) {
      data['image'] = this.image.toJson();
    }
    if (this.hubInformation != null) {
      data['hubInformation'] = this.hubInformation.toJson();
    }
    return data;
  }
}

class Image {
  int id;
  bool default_value;
  File file;

  Image({this.id, this.default_value, this.file});

  Image.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    default_value = json['default'];
    file = json['file'] != null ? new File.fromJson(json['file']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['default'] = this.default_value;
    if (this.file != null) {
      data['file'] = this.file.toJson();
    }
    return data;
  }
}

class File {
  String filename;
  String mimetype;
  String previewUrl;

  File({this.filename, this.mimetype, this.previewUrl});

  File.fromJson(Map<String, dynamic> json) {
    filename = json['filename'];
    mimetype = json['mimetype'];
    previewUrl = json['previewUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['filename'] = this.filename;
    data['mimetype'] = this.mimetype;
    data['previewUrl'] = this.previewUrl;
    return data;
  }
}

class HubInformation {
  int id;
  bool inStock;
  int currentStock;
  int maximumRetailPrice;
  int mbq;
  Hub hub;

  HubInformation(
      {this.id,
      this.inStock,
      this.currentStock,
      this.maximumRetailPrice,
      this.mbq,
      this.hub});

  HubInformation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    inStock = json['inStock'];
    currentStock = json['currentStock'];
    maximumRetailPrice = json['maximumRetailPrice'];
    mbq = json['mbq'];
    hub = json['hub'] != null ? new Hub.fromJson(json['hub']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['inStock'] = this.inStock;
    data['currentStock'] = this.currentStock;
    data['maximumRetailPrice'] = this.maximumRetailPrice;
    data['mbq'] = this.mbq;
    if (this.hub != null) {
      data['hub'] = this.hub.toJson();
    }
    return data;
  }
}

class Hub {
  int id;
  String name;

  Hub({this.id, this.name});

  Hub.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class AvailableSlots {
  int id;
  String time;

  AvailableSlots({this.id, this.time});

  AvailableSlots.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['time'] = this.time;
    return data;
  }
}

class ProductsNew {
  int id;
  String name;
  int sellingPrice;
  int maximumRetailPrice;
  int maximumOrderQuantity;
  List<String> badgeTags;
  bool onlyPreorder;
  String deliveryCategory;
  Unit unit;
  List<ProductVariants> productVariants;
  Hub category;
  Image icon;
  Image image;
  List<AvailableSlots> availableSlots;
  bool isFavorite;
  List<String> promotions;
  bool isPrimary;
  int expressDeliveryIn;

  ProductsNew(
      {this.id,
      this.name,
      this.sellingPrice,
      this.maximumRetailPrice,
      this.maximumOrderQuantity,
      this.badgeTags,
      this.onlyPreorder,
      this.deliveryCategory,
      this.unit,
      this.productVariants,
      this.category,
      this.icon,
      this.image,
      this.availableSlots,
      this.isFavorite,
      this.promotions,
      this.isPrimary,
      this.expressDeliveryIn});

  ProductsNew.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    sellingPrice = json['sellingPrice'];
    maximumRetailPrice = json['maximumRetailPrice'];
    maximumOrderQuantity = json['maximumOrderQuantity'];
    badgeTags = json['badgeTags'].cast<String>();
    onlyPreorder = json['onlyPreorder'];
    deliveryCategory = json['deliveryCategory'];
    unit = json['unit'] != null ? new Unit.fromJson(json['unit']) : null;
    if (json['productVariants'] != null) {
      productVariants = new List<ProductVariants>();
      json['productVariants'].forEach((v) {
        productVariants.add(new ProductVariants.fromJson(v));
      });
    }
    category =
        json['category'] != null ? new Hub.fromJson(json['category']) : null;
    icon = json['icon'] != null ? new Image.fromJson(json['icon']) : null;
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
    if (json['availableSlots'] != null) {
      availableSlots = new List<AvailableSlots>();
      json['availableSlots'].forEach((v) {
        availableSlots.add(new AvailableSlots.fromJson(v));
      });
    }
    isFavorite = json['isFavorite'];
    promotions = json['promotions'].cast<String>();
    isPrimary = json['isPrimary'];
    expressDeliveryIn = json['expressDeliveryIn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['sellingPrice'] = this.sellingPrice;
    data['maximumRetailPrice'] = this.maximumRetailPrice;
    data['maximumOrderQuantity'] = this.maximumOrderQuantity;
    data['badgeTags'] = this.badgeTags;
    data['onlyPreorder'] = this.onlyPreorder;
    data['deliveryCategory'] = this.deliveryCategory;
    if (this.unit != null) {
      data['unit'] = this.unit.toJson();
    }
    if (this.productVariants != null) {
      data['productVariants'] =
          this.productVariants.map((v) => v.toJson()).toList();
    }
    if (this.category != null) {
      data['category'] = this.category.toJson();
    }
    if (this.icon != null) {
      data['icon'] = this.icon.toJson();
    }
    if (this.image != null) {
      data['image'] = this.image.toJson();
    }
    if (this.availableSlots != null) {
      data['availableSlots'] =
          this.availableSlots.map((v) => v.toJson()).toList();
    }
    data['isFavorite'] = this.isFavorite;
    data['promotions'] = this.promotions;
    data['isPrimary'] = this.isPrimary;
    data['expressDeliveryIn'] = this.expressDeliveryIn;
    return data;
  }
}
