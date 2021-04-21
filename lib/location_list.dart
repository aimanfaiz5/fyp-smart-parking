import 'package:flutter/material.dart';
import 'package:flutter_fyp_app/location_detail.dart';
import 'models/location.dart';

class LocationList extends StatelessWidget {
  final List<Location> _locations;

  LocationList(this._locations);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          );
        }),
        title: Text('Locations'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: this._locations.length,
        itemBuilder: _listViewItemBuilder,
      ),
    );
  }

  Widget _listViewItemBuilder(BuildContext context, int index) {
    var location = this._locations[index];
    return ListTile(
      contentPadding: EdgeInsets.all(10),
      //leading: _itemThumbnail(location),
      title: _itemTitle(location),
      onTap: () => _navigationToLocationDetail(context, this._locations[index]),
    );
  }

  void _navigationToLocationDetail(BuildContext context, Location location) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => LocationDetail(location)));
  }

  Widget _itemTitle(Location location) {
    return Text(
      location.name,
    );
  }
}
