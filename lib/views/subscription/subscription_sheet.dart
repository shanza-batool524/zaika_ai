import 'package:flutter/material.dart';

void showSubscriptionBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildSubscriptionCard(
              title: 'Monthly',
              price: '\$9,99',
              subtitle: 'Recurring monthly billing',
              badge: null,
            ),
            const SizedBox(height: 20),
            _buildSubscriptionCard(
              title: 'Yearly',
              price: '\$6,69',
              subtitle: 'Billed yearly - 79,99\$',
              badge: '33% Off & Best Value',
            ),
          ],
        ),
      );
    },
  );
}

Widget _buildSubscriptionCard({
  required String title,
  required String price,
  required String subtitle,
  String? badge,
}) {
  return Stack(
    clipBehavior: Clip.none,
    children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: const TextStyle(
                    fontSize: 16, fontWeight: FontWeight.w600)),
            const SizedBox(height: 5),
            Row(
              children: [
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text('/month',
                    style:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                const Spacer(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade400,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text('Subscribe',style: TextStyle(color: Colors.white),),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Text(
              subtitle,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 3),
            const Text(
              '7-days free trial',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
      if (badge != null)
        Positioned(
          top: -12,
          left: 12,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.green.shade100,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              badge,
              style: TextStyle(
                  color: Colors.green.shade800,
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
    ],
  );
}
