// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:faker/faker.dart';

// class Item {
//   final String id;
//   final String title;
//   final String description;
//   final double price;
//   final String category;
//   final DateTime createdAt;
//   final String imageUrl;

//   Item({
//     required this.id,
//     required this.title,
//     required this.description,
//     required this.price,
//     required this.category,
//     required this.createdAt,
//     required this.imageUrl,
//   });

//   factory Item.fromFormData(AddItemFormState form) {
//     final faker = Faker();
//     return Item(
//       id: faker.guid.guid(),
//       title: form.title,
//       description: form.description,
//       price: form.price,
//       category: form.category,
//       createdAt: DateTime.now(),
//       imageUrl: 'https://picsum.photos/400/300?random=${faker.randomGenerator.integer(100)}',
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'title': title,
//       'description': description,
//       'price': price,
//       'category': category,
//       'createdAt': createdAt.toIso8601String(),
//       'imageUrl': imageUrl,
//     };
//   }
// }

// class AddItemFormState {
//   final String title;
//   final String description;
//   final double price;
//   final String category;
//   final bool isLoading;
//   final String? error;
//   final Map<String, String?> fieldErrors;

//   AddItemFormState({
//     this.title = '',
//     this.description = '',
//     this.price = 0.0,
//     this.category = 'General',
//     this.isLoading = false,
//     this.error,
//     Map<String, String?>? fieldErrors,
//   }) : fieldErrors = fieldErrors ?? {};

//   AddItemFormState copyWith({
//     String? title,
//     String? description,
//     double? price,
//     String? category,
//     bool? isLoading,
//     String? error,
//     Map<String, String?>? fieldErrors,
//   }) {
//     return AddItemFormState(
//       title: title ?? this.title,
//       description: description ?? this.description,
//       price: price ?? this.price,
//       category: category ?? this.category,
//       isLoading: isLoading ?? this.isLoading,
//       error: error ?? this.error,
//       fieldErrors: fieldErrors ?? this.fieldErrors,
//     );
//   }

//   bool get isValid {
//     return title.isNotEmpty &&
//         description.isNotEmpty &&
//         price > 0 &&
//         category.isNotEmpty &&
//         fieldErrors.isEmpty;
//   }
// }

// class AddItemFormNotifier extends StateNotifier<AddItemFormState> {
//   AddItemFormNotifier() : super(AddItemFormState());

//   void updateTitle(String title) {
//     final errors = Map<String, String?>.from(state.fieldErrors);
//     if (title.isEmpty) {
//       errors['title'] = 'Title is required';
//     } else if (title.length < 3) {
//       errors['title'] = 'Title must be at least 3 characters';
//     } else {
//       errors.remove('title');
//     }

//     state = state.copyWith(title: title, fieldErrors: errors);
//   }

//   void updateDescription(String description) {
//     final errors = Map<String, String?>.from(state.fieldErrors);
//     if (description.isEmpty) {
//       errors['description'] = 'Description is required';
//     } else if (description.length < 10) {
//       errors['description'] = 'Description must be at least 10 characters';
//     } else {
//       errors.remove('description');
//     }

//     state = state.copyWith(description: description, fieldErrors: errors);
//   }

//   void updatePrice(String price) {
//     final errors = Map<String, String?>.from(state.fieldErrors);
//     final parsedPrice = double.tryParse(price);
    
//     if (price.isEmpty) {
//       errors['price'] = 'Price is required';
//     } else if (parsedPrice == null) {
//       errors['price'] = 'Price must be a valid number';
//     } else if (parsedPrice <= 0) {
//       errors['price'] = 'Price must be greater than 0';
//     } else {
//       errors.remove('price');
//       state = state.copyWith(price: parsedPrice, fieldErrors: errors);
//       return;
//     }
    
//     state = state.copyWith(fieldErrors: errors);
//   }

//   void updateCategory(String category) {
//     state = state.copyWith(category: category);
//   }

//   Future<Item?> submit() async {
//     if (!state.isValid) {
//       state = state.copyWith(error: 'Please fix all errors before submitting');
//       return null;
//     }

//     state = state.copyWith(isLoading: true, error: null);

//     try {
//       await Future.delayed(const Duration(seconds: 2));
      
//       final item = Item.fromFormData(state);
      
//       // Reset form on success
//       state = AddItemFormState();
      
//       return item;
//     } catch (e) {
//       state = state.copyWith(
//         isLoading: false,
//         error: 'Failed to submit: $e',
//       );
//       return null;
//     }
//   }

//   void reset() {
//     state = AddItemFormState();
//   }
// }

// final addItemFormProvider = StateNotifierProvider<AddItemFormNotifier, AddItemFormState>(
//   (ref) => AddItemFormNotifier(),
// );

// final itemsProvider = StateProvider<List<Item>>((ref) => []);
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:faker/faker.dart';

class Item {
  final String id;
  final String title;
  final String description;
  final double price;
  final String category;
  final DateTime createdAt;
  final String imageUrl;

  Item({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.category,
    required this.createdAt,
    required this.imageUrl,
  });

  factory Item.fromFormData(AddItemFormState form) {
    final faker = Faker();
    return Item(
      id: faker.guid.guid(),
      title: form.title,
      description: form.description,
      price: form.price,
      category: form.category,
      createdAt: DateTime.now(),
      imageUrl: 'https://picsum.photos/400/300?random=${faker.randomGenerator.integer(100)}',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'category': category,
      'createdAt': createdAt.toIso8601String(),
      'imageUrl': imageUrl,
    };
  }
}

class AddItemFormState {
  final String title;
  final String description;
  final double price;
  final String category;
  final bool isLoading;
  final String? error;
  final Map<String, String?> fieldErrors;

  AddItemFormState({
    this.title = '',
    this.description = '',
    this.price = 0.0,
    this.category = 'General',
    this.isLoading = false,
    this.error,
    Map<String, String?>? fieldErrors,
  }) : fieldErrors = fieldErrors ?? {};

  AddItemFormState copyWith({
    String? title,
    String? description,
    double? price,
    String? category,
    bool? isLoading,
    String? error,
    Map<String, String?>? fieldErrors,
  }) {
    return AddItemFormState(
      title: title ?? this.title,
      description: description ?? this.description,
      price: price ?? this.price,
      category: category ?? this.category,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      fieldErrors: fieldErrors ?? this.fieldErrors,
    );
  }

  bool get isValid {
    return title.isNotEmpty &&
        description.isNotEmpty &&
        price > 0 &&
        category.isNotEmpty &&
        fieldErrors.isEmpty;
  }
}

class AddItemFormNotifier extends StateNotifier<AddItemFormState> {
  AddItemFormNotifier() : super(AddItemFormState());

  void updateTitle(String title) {
    final errors = Map<String, String?>.from(state.fieldErrors);
    if (title.isEmpty) {
      errors['title'] = 'Title is required';
    } else if (title.length < 3) {
      errors['title'] = 'Title must be at least 3 characters';
    } else {
      errors.remove('title');
    }

    state = state.copyWith(title: title, fieldErrors: errors);
  }

  void updateDescription(String description) {
    final errors = Map<String, String?>.from(state.fieldErrors);
    if (description.isEmpty) {
      errors['description'] = 'Description is required';
    } else if (description.length < 10) {
      errors['description'] = 'Description must be at least 10 characters';
    } else {
      errors.remove('description');
    }

    state = state.copyWith(description: description, fieldErrors: errors);
  }

  void updatePrice(String price) {
    final errors = Map<String, String?>.from(state.fieldErrors);
    final parsedPrice = double.tryParse(price);
    
    if (price.isEmpty) {
      errors['price'] = 'Price is required';
    } else if (parsedPrice == null) {
      errors['price'] = 'Price must be a valid number';
    } else if (parsedPrice <= 0) {
      errors['price'] = 'Price must be greater than 0';
    } else {
      errors.remove('price');
      state = state.copyWith(price: parsedPrice, fieldErrors: errors);
      return;
    }
    
    state = state.copyWith(fieldErrors: errors);
  }

  void updateCategory(String category) {
    state = state.copyWith(category: category);
  }

  Future<Item?> submit() async {
    if (!state.isValid) {
      state = state.copyWith(error: 'Please fix all errors before submitting');
      return null;
    }

    state = state.copyWith(isLoading: true, error: null);

    try {
      await Future.delayed(const Duration(seconds: 2));
      
      final item = Item.fromFormData(state);
      
      // Reset form on success
      state = AddItemFormState();
      
      return item;
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: 'Failed to submit: $e',
      );
      return null;
    }
  }

  void reset() {
    state = AddItemFormState();
  }
}

final addItemFormProvider = StateNotifierProvider<AddItemFormNotifier, AddItemFormState>(
  (ref) => AddItemFormNotifier(),
);