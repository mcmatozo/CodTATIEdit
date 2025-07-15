import 'package:financial_tracker/common/errors/errors_classes.dart';
import 'package:financial_tracker/common/patterns/result.dart';
import 'package:financial_tracker/data/repositories/transaction_repository_contract.dart';
import 'package:financial_tracker/domain/entity/transaction_entity.dart';
import 'package:financial_tracker/domain/usecase/add_transaction_use_case_impl.dart';
import 'package:financial_tracker/domain/usecase/use_case_contract.dart';
import 'package:flutter/foundation.dart';

typedef UpdateTransactionParams = ({@required TransactionEntity transaction});

class UpdateTransactionUseCaseImpl
    implements
        IUseCaseContract<Result<void, Failure>, UpdateTransactionParams> {
  final TransactionRepositoryContract repo;

  UpdateTransactionUseCaseImpl(this.repo);

  @override
  Future<Result<void, Failure>> call(UpdateTransactionParams params) {
    return repo.updateTransacion(params.transaction);
  }
}
