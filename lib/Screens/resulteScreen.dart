
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final String userName;
  final double waterAmount;
  final double dailyGoal;

  const ResultScreen({
    super.key,
    required this.userName,
    required this.waterAmount,
    required this.dailyGoal,
  });

  @override
  Widget build(BuildContext context) {
    double progress = (waterAmount / dailyGoal).clamp(0.0, 1.0);
    double remaining = (dailyGoal - waterAmount).clamp(0.0, dailyGoal);
    int percentage = (waterAmount / dailyGoal * 100).round();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Water Result',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 15),

            const Icon(
              Icons.water_drop,
              size: 65,
              color: Colors.blue,
            ),

            const SizedBox(height: 15),

            Text(
              'Great job, $userName!',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1769AA),
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Here is your daily hydration report.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, color: Colors.grey),
            ),

            const SizedBox(height: 30),

            Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                  children: [
                    const Text(
                      'Your Daily Progress',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 25),

                    SizedBox(
                      width: 170,
                      height: 170,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            width: 170,
                            height: 170,
                            child: CircularProgressIndicator(
                              value: progress,
                              strokeWidth: 13,
                              backgroundColor: Colors.blue.shade50,
                              color: Colors.blue,
                            ),
                          ),

                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '$percentage%',
                                style: const TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF1769AA),
                                ),
                              ),

                              const Text(
                                'Completed',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 25),

                    Text(
                      '${waterAmount.toInt()} ml',
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(
                      'Daily goal: ${dailyGoal.toInt()} ml',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    const Icon(
                      Icons.water_drop_outlined,
                      size: 40,
                      color: Colors.blue,
                    ),

                    const SizedBox(width: 15),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Water Remaining',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 5),

                          Text(
                            '${remaining.toInt()} ml',
                            style: const TextStyle(
                              fontSize: 23,
                              color: Color(0xFF1769AA),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 25),

            Text(
              waterAmount >= dailyGoal
                  ? 'Congratulations! You reached your daily goal!'
                  : 'Keep drinking water to reach your daily goal!',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
                label: const Text(
                  'Back to Edit',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1769AA),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
