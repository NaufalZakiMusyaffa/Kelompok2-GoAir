import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goair/cubit/transaction_cubit.dart';
import 'package:goair/shared/theme.dart';
import 'package:goair/ui/widgets/transaction_card.dart';

class TranscationPage extends StatefulWidget {
  const TranscationPage({Key? key}) : super(key: key);

  @override
  State<TranscationPage> createState() => _TranscationPageState();
}

class _TranscationPageState extends State<TranscationPage> {

  @override
  void initState() {
    context.read<TransactionCubit>().fetchTransactions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionCubit, TransactionState>(
      builder: (context, state) {

        if(state is TransactionLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        else if(state is TransactionSuccess) {
          if(state.transactions.length == 0) {
            return Center(
              child: Text('Tidak Ada Transaksi'),
            );
          } else {
            return ListView.builder(
                itemCount: state.transactions.length,
                padding: EdgeInsets.symmetric(
                  horizontal: defaultMargin,
                ),
                itemBuilder: (context, index){
              return TransactionCard(
                state.transactions[index],
              );
            });
          }
        }
        return Center(
          child: Text(
              'Transaction Page'),
        );
      },
    );
  }
}
