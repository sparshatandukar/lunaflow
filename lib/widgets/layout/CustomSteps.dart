import 'package:flutter/material.dart';

class CustomSteps extends StatelessWidget {
  final int currentStep;
  final int totalSteps;

  const CustomSteps({
    super.key,
    required this.currentStep,
    required this.totalSteps,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        totalSteps,
            (index) {
          final isActive = index + 1 == currentStep;
          return Row(
            children: [
              // Step Circle
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: isActive
                      ? const Color(0xFFffffff) // Active step color
                      : const Color(0xFFEEA09C), // Inactive step color
                  borderRadius: BorderRadius.circular(50),
                  border: isActive
                      ? Border.all(color: Color(0xFFEEA09C), width: 2) // Active step border
                      : Border.all(color: Color(0xFFEEA09C)),
                ),
                child: Center(
                  child: Text(
                    '${index + 1}',
                    style: TextStyle(
                      color: isActive ? Colors.black : Colors.white,
                      fontWeight: FontWeight.bold, fontSize: 25,
                    ),
                  ),
                ),
              ),
              // Line Connector
              if (index < totalSteps - 1)
                Container(
                  width: 40,
                  height: 2,
                  color: const Color(0xFFFFE5E0),
                ),
            ],
          );
        },
      ),
    );
  }
}
