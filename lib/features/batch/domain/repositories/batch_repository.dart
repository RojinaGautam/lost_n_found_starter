import 'package:lost_n_found/core/error/failures.dart';
import 'package:lost_n_found/features/batch/domain/entities/batch_entity.dart';
import 'package:dartz/dartz.dart';
 
abstract interface class IBatchRepository {
  Future<Either<Failure, List<BatchEntity>>> getAllBatches();
  Future<Either<Failure, BatchEntity>> getBatchById(String batchId);
  Future<Either<Failure, bool>> createBatch(BatchEntity entity);
  Future<Either<Failure, bool>> updateBatch(BatchEntity entity);
  Future<Either<Failure, bool>> deleteBatch( String batchId);
}
 
 //Retrurn type: j pani huna sakyo
 //Parameter j pani huna sakyo

 //int add(int a, int b)

 //double add (double b)


//Generic class

//T add(y)

//SuccessType add (Params)