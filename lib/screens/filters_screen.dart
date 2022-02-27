import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:happymeals/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String,bool> filters;
  FilterScreen({required this.saveFilters,required this.filters});
  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.filters['gluten'] as bool;
    _lactoseFree = widget.filters['lactose'] as bool;
    _vegetarian = widget.filters['vegetarian'] as bool;
    _vegan = widget.filters['vegan'] as bool;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Fiters'),
          actions: [
            IconButton(
                onPressed: () {
                  widget.saveFilters({
                    'gluten': _glutenFree,
                    'lactose': _lactoseFree,
                    'vegetarian': _vegetarian,
                    'vegan': _vegan,
                  });
                },
                icon: Icon(Icons.done))
          ],
        ),
        drawer: const MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: const Text(
                'Ajust your meal selection!',
                style: TextStyle(
                  fontFamily: 'Raleway',
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  SwitchListTile(
                    title: const Text('Gluten-Free'),
                    value: _glutenFree,
                    subtitle: const Text('Only include Gluten-Free meals'),
                    onChanged: (newValue) {
                      setState(() {
                        _glutenFree = newValue;
                      });
                    },
                  ),
                  SwitchListTile(
                    title: const Text('Vegetarian'),
                    value: _vegetarian,
                    subtitle: const Text('Only include Vegetarian meals'),
                    onChanged: (newValue) {
                      setState(() {
                        _vegetarian = newValue;
                      });
                    },
                  ),
                  SwitchListTile(
                    title: const Text('Lactose-Free'),
                    value: _lactoseFree,
                    subtitle: const Text('Only include Lactose-Free meals'),
                    onChanged: (newValue) {
                      setState(() {
                        _lactoseFree = newValue;
                      });
                    },
                  ),
                  SwitchListTile(
                    title: const Text('Vegan'),
                    value: _vegan,
                    subtitle: const Text('Only include Vegan meals'),
                    onChanged: (newValue) {
                      setState(() {
                        _vegan = newValue;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
