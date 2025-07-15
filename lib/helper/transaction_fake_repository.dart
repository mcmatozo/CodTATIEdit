import 'dart:convert';
import 'dart:math';

import 'package:financial_tracker/common/errors/errors_classes.dart';
import 'package:financial_tracker/common/errors/errors_messagens.dart';

import '../domain/entity/transaction_entity.dart';

import 'transaction_fake_factory.dart';

class TransactionFakeRepository {
  late List<TransactionEntity> transactions;

  TransactionFakeRepository({int numInstance = 10}) {
    transactions = List.generate(
      numInstance,
      (index) => TransactionFakeFactory.factory(),
    );
  }
  // StudentFakeApiDataBase() {
  //   if (Random().nextBool()) {
  //     student = StudenteFakeFactory.factory();
  //   }
  // }

  Future<String> getData() async {
    // if (Random().nextBool()) {
    //   return throw APIFailure(MessagesError.apiError);
    // }

    return (transactions.isEmpty)
        ? throw DatasourceResultEmpty(MessagesError.emptySharedP)
        : jsonEncode(transactions.map((e) => e.toMap()).toList());
  }

  Future<String> getDataId(String id) async {
    final filteredTransactions =
        transactions.where((transaction) {
          return transaction.id == id;
        }).toList();
    return jsonEncode(filteredTransactions.first.toMap());
  }

  Future<void> deleteData(String id) async {
    final index = transactions.indexWhere((element) => element.id == id);

    if (index == -1) {
      throw RecordNotFound(MessagesError.recordNotFound);
    }

    transactions.removeAt(index);
  }

  Future<void> addData(String transactionJson) async {
    await Future.delayed(const Duration(seconds: 2));

    // Simula uma falha
    if (Random().nextBool()) {
      Random().nextBool()
          ? throw APIFailure(MessagesError.apiError)
          : throw InvalidData(MessagesError.recordInvalidFormat);
    }

    if (transactionJson.isEmpty) {
      throw InvalidData(MessagesError.recordInvalidFormat);
    }

    transactions.add(TransactionEntity.fromMap(jsonDecode(transactionJson)));
  }

  Future<String> getDataByDateRange(
    DateTime startDate,
    DateTime endDate,
  ) async {
    final filteredTransactions =
        transactions.where((transaction) {
          return transaction.date.isAfter(
                startDate.subtract(const Duration(seconds: 1)),
              ) &&
              transaction.date.isBefore(
                endDate.add(const Duration(seconds: 1)),
              );
        }).toList();

    if (filteredTransactions.isEmpty) {
      throw DatasourceResultEmpty(MessagesError.emptySearch);
    }

    return jsonEncode(filteredTransactions.map((e) => e.toMap()).toList());
  }

  Future<void> updateData(
    TransactionEntity transaction,
  ) async {
    try {
      final index = transactions.indexWhere((t) => t.id == transaction.id);
      print('Índice encontrado: $index'); // Adicione o log para depuração

      if (index == -1) {
        // Lança um erro se a transação não for encontrada
        throw RecordNotFound('Transação com id ${transaction.id} não encontrada.');
      }

      // Atualiza a transação no índice encontrado
      transactions[index] = transaction.copyWith(id: transaction.id);
      
    } catch (e) {
      throw APIFailureOnSave('erro ao salvar: ${transaction.id} // ${e.toString()}');
    }
  }
}
