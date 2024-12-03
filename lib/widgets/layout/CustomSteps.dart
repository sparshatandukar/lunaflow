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
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: isActive
                      ? const Color(0xFFFF897A) // Active step color
                      : const Color(0xFFFFE5E0), // Inactive step color
                  borderRadius: BorderRadius.circular(15),
                  border: isActive
                      ? Border.all(color: Colors.blue, width: 2) // Active step border
                      : Border.all(color: Colors.transparent),
                ),
                child: Center(
                  child: Text(
                    '${index + 1}',
                    style: TextStyle(
                      color: isActive ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
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
