import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Wrap(
          spacing: 8,
          runSpacing: 16,
          children: [
            _buildChartContainer(
                title: "Doanh thu ngày",
                nums: 5000,
                icon: Icons.money_off),
            _buildChartContainer(
                title: "Đơn hàng",
                nums: 20,
                icon: Icons.shopping_cart),
            _buildChartContainer(
                title: "Doanh thu tháng",
                nums: 500000,
                icon: Icons.money),
            _buildChartContainer(
                title: "Khách hàng ",
                nums: 20,
                icon: Icons.account_box),
          ],
        ),
      ),
    );
  }

  Widget _buildChartContainer(
      {required String title, required int nums, required IconData icon}) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.45,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 8,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF4C53A5),
            ),
          ),
          SizedBox(height: 8),
          Text(
            nums.toString(),
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 112, 209, 143),
            ),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Xem chi tiết",
                  style: TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 137, 176, 207))),
              Icon(
                icon,
                size: 30,
                color: Color.fromARGB(255, 86, 83, 83),
              ),
            ],
          )
        ],
      ),
    );
  }
}
