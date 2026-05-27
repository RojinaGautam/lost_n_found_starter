
import 'package:hive/hive.dart';
import 'package:lost_n_found/core/constants/hive_table_constant.dart';
import 'package:lost_n_found/features/batch/data/models/batch_hive_model.dart';
import 'package:path_provider/path_provider.dart';
 
class HiveService {
  Future<void> init() async {
    final directory = await getApplicationDocumentsDirectory();
    // c: /prasad/asdasd/lost_sadad_db
    final path = '${directory.path} /${HiveTableConstant.dbName}';
    Hive.init(path);
    _registerAdapter();
  }
 
  // Register Adapters
  void _registerAdapter() {
    if (!Hive.isAdapterRegistered(HiveTableConstant.batchTypeId)) {
      Hive.registerAdapter(BatchHiveModelAdapter());
    }
  }
 
  // Open Boxes
  Future<void> openBoxes() async {
    await Hive.openBox<BatchHiveModel>(HiveTableConstant.batchTable);
  }
 
  // Close boxes
  Future<void> close() async {
    await Hive.close();
  }
 
  //------------BATCH  QUERIES---------------
  Box<BatchHiveModel> get _batchBox =>
      Hive.box<BatchHiveModel>(HiveTableConstant.batchTable);
 
  Future<BatchHiveModel> createBatch(BatchHiveModel model) async {
    await _batchBox.put(model.batchId, model);
    return model;
  }
 
  // getallbatch
  List<BatchHiveModel> getAllBatches() {
    return _batchBox.values.toList();
  }
 
  // update
  Future<void> updateBatch(BatchHiveModel model) async {
    await _batchBox.put(model.batchId, model);
  }

  Future<void> deletebatch(String batchId) async {}
 
  // delete
}
 
 