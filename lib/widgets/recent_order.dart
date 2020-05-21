import 'package:flutter/material.dart';
import 'package:food/data/data.dart';
import 'package:food/models/order.dart';
import 'package:provider/provider.dart';

class RecentOrder extends StatelessWidget {
  Widget _buildRecentOrder(BuildContext context, Order order) {
    return Container(
      margin: EdgeInsets.all(9.0),
      width: 320.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.0),
        border: Border.all(
          width: .5,
          color: Colors.grey,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(30.0),
            child: Image(
              image: AssetImage(order.food.imageUrl),
              fit: BoxFit.cover,
              height: 100.0,
              width: 100.0,
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '${order.food.name}',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w800,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4.0,),
                  Text(
                    '${order.restaurant.name}',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4.0,),
                  Text(
                    '${order.date}',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 20.0),
            width: 48.0,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: IconButton(
              icon: Icon(Icons.add),
              onPressed: () {},
              iconSize: 30.0,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FoodData>(
      builder: (context, foodData, child) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Text(
              'Recent Orders',
              style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.2),
            ),
          ),
          Container(
            height: 120.0,
            child: ListView.builder(
              padding: EdgeInsets.only(left: 10.0),
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: foodData.currentUser.orders.length,
              itemBuilder: (BuildContext context, int index) {
                Order order = foodData.currentUser.orders[index];
                return _buildRecentOrder(context, order);
              },
            ),
          )
        ],
      ),
    );
  }
}
