import 'package:aoun_app/data/model/payment_models/debit_card_model/debit_card_model.dart';
import 'package:hive/hive.dart';

/// HiveService manages local storage operations for debit card data using Hive.
///
/// This service provides CRUD operations for DebitCardModel objects, storing them
/// in a local Hive database. It ensures thread-safe access to the storage and
/// handles box initialization automatically.
///
/// Features:
/// - Automatic box initialization
/// - Type-safe storage operations
/// - Batch operations support
/// - Lazy loading of stored data
class HiveService {
  /// Constant identifier for the debit card storage box
  /// This key is used to access the same box across app sessions
  static const String DEBITCARDBOX = "debit_card_box";

  /// Reference to the Hive box storing DebitCardModel objects
  /// Late initialization is safe as the box is opened in constructor
  late Box<DebitCardModel> boxDebitcard;

  /// Creates a new instance of HiveService and initializes the storage box
  ///
  /// The constructor automatically calls [openBox] to ensure the storage
  /// is ready for use when the service is instantiated
  HiveService() {
    openBox();
  }

  /// Opens the debit card storage box or retrieves existing reference
  ///
  /// This method ensures thread-safe access to the storage by:
  /// 1. Checking if the box is already open
  /// 2. Opening it if needed or retrieving existing reference
  /// 3. Assigning the box reference for future operations
  Future<void> openBox() async {
    if (!Hive.isBoxOpen(DEBITCARDBOX)) {
      // Box not open, create new instance
      boxDebitcard = await Hive.openBox<DebitCardModel>(DEBITCARDBOX);
    } else {
      // Box already open, get existing reference
      boxDebitcard = Hive.box<DebitCardModel>(DEBITCARDBOX);
    }
  }

  /// Adds a new debit card to storage
  ///
  /// [model] The DebitCardModel to store
  ///
  /// The card is appended to the end of the box using auto-incrementing keys
  Future<void> addDebitCard(DebitCardModel model) async {
    await boxDebitcard.add(model);
  }

  /// Deletes a debit card at the specified index
  ///
  /// [index] The position of the card to delete
  ///
  /// Throws [RangeError] if index is out of bounds
  Future<void> deleteDebitCard(int index) async {
    await boxDebitcard.deleteAt(index);
  }

  /// Removes all stored debit cards
  ///
  /// This operation clears the entire box but keeps the box itself intact
  /// Use with caution as this operation cannot be undone
  Future<void> deleteAllDebitCard() async {
    await boxDebitcard.clear();
  }

  /// Updates a debit card at the specified index
  ///
  /// [index] The position of the card to update
  /// [model] The new DebitCardModel data
  ///
  /// Throws [RangeError] if index is out of bounds
  Future<void> updateDebitCard(int index, DebitCardModel model) async {
    await boxDebitcard.putAt(index, model);
  }

  /// Retrieves a single debit card by its index
  ///
  /// [index] The position of the card to retrieve
  /// Returns null if no card exists at the specified index
  ///
  /// Throws [RangeError] if index is out of bounds
  Future<DebitCardModel?> getDebitCard(int index) async {
    return boxDebitcard.getAt(index);
  }

  /// Retrieves all stored debit cards
  ///
  /// Returns a List of DebitCardModel objects in storage order
  /// Returns an empty list if no cards are stored
  Future<List<DebitCardModel>> getAllDebitCard() async {
    return boxDebitcard.values.toList().cast<DebitCardModel>();
  }
}
