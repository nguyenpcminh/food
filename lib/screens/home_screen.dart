import 'package:flutter/material.dart';
import 'package:food/data/data.dart';
import 'package:food/screens/cart_screen.dart';
import 'package:food/screens/restaurant_screen.dart';
import 'package:food/widgets/rating_start.dart';
import 'package:food/widgets/recent_order.dart';
import 'package:provider/provider.dart';

class HomeScreens extends StatefulWidget {
  @override
  _HomeScreensState createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  TextEditingController textController = TextEditingController();
  Column _buildNearbyRestaurant() {
    List<Widget> restaurants = [];
    Provider.of<FoodData>(context).restaurants.forEach((element) {
      restaurants.add(
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RestaurantScreen(
                  restaurant: element,
                ),
              ),
            );
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(width: .8, color: Colors.grey.shade200),
            ),
            child: Row(
              children: <Widget>[
                Hero(
                  tag: element.imageUrl,
                  child: Image(
                    image: AssetImage('${element.imageUrl}'),
                    width: 150.0,
                    height: 150.0,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '${element.name}',
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w700),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 4.0,
                        ),
                        RatingStart(
                          rating: element.rating,
                        ),
                        SizedBox(
                          height: 4.0,
                        ),
                        Text(
                          element.address,
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 4.0,
                        ),
                        Text(
                          '0.2 milies away',
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
    return Column(
      children: restaurants,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            icon: Icon(
              Icons.account_circle,
              size: 30.0,
              color: Colors.white,
            ),
            onPressed: null),
        title: Text('Food Delivery'),
        actions: <Widget>[
          FlatButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen())),
              child: Text(
                'Cart (${Provider.of<FoodData>(context).currentUser.cart.length})',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ))
        ],
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(15.0),
            child: TextField(
              controller: textController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(
                    width: .2,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(
                      width: .2,
                      color: Theme.of(context).primaryColor,
                    )),
                hintText: 'Search Food or Restaurants',
                fillColor: Colors.white,
                filled: true,
                prefixIcon: Icon(Icons.search),
                suffixIcon: FlatButton(
                  onPressed: () {
                    textController.clear();
                  },
                  child: Icon(
                    Icons.clear,
                  ),
                ),
              ),
            ),
          ),
          RecentOrder(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: Text(
                  'Nearby Restaurants',
                  style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2),
                ),
              ),
              _buildNearbyRestaurant(),
            ],
          )
        ],
      ),
    );
  }
}
