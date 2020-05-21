import 'package:flutter/material.dart';
import 'package:food/data/data.dart';
import 'package:food/models/order.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  _buildCartItem(Order order) {
    return Container(
      height: 170,
      padding: EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(order.food.imageUrl),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        order.food.name,
                        style: TextStyle(
                            fontSize: 24.0, fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        order.restaurant.name,
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.w600),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        children: <Widget>[
                          InkWell(
                            onTap: () {},
                            child: Text(
                              '-',
                              style: TextStyle(
                                fontSize: 20,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                          Text('${order.quantity * order.food.price}'),
                          InkWell(
                            onTap: () {},
                            child: Text(
                              '+',
                              style: TextStyle(
                                fontSize: 20,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FoodData>(
      builder: (context, foodData, child) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('Cart (${foodData.currentUser.cart.length})'),
          ),
          body: ListView.separated(
            itemBuilder: (context, int index) {
              Order order = foodData.currentUser.cart[index];
              return _buildCartItem(order);
            },
            separatorBuilder: (context, int index) => Divider(
              height: 1.0,
              color: Colors.grey,
            ),
            itemCount: foodData.currentUser.cart.length,
          ),
        );
      },
    );
  }
}
