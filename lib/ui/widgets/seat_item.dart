import 'package:flutter/material.dart';
import 'package:goair/cubit/seat_cubit.dart';
import 'package:goair/shared/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeatItem extends StatelessWidget {

  // 0 available
  // 1 selected
  // 2 unavailable
  final String id;
  final bool isAvailable;

  const SeatItem({
    Key? key,
    required this.id,
    this.isAvailable = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    bool isSelected = context.watch<SeatCubit>().isSelected(id);

    backgroundColor() {
      if(!isAvailable) {
        return kUnavailableColor;
      } else {
        if(isSelected) {
          return kGreenColor;
        } else {
          return kWhiteColor;
        }
      }
    }

    borderColor() {
      if(!isAvailable) {
        return kUnavailableColor;
      } else {
        return kGreenColor;
      }
    }

    child() {
      if(isSelected) {
        return Center(
          child: Text(
            'YOU',
            style: whiteTextStyle.copyWith(
              fontWeight: semiBold,
            ),
          ),
        );
      } else {
        return SizedBox();
      }
    }


    return  GestureDetector(
      onTap: () {
        if (isAvailable) {
          context.read<SeatCubit>().selectSeat(id);
        }
      },
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: backgroundColor(),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: borderColor(),
            width: 2,
          ),
        ),
        child: child(),
      ),
    );
  }
}
