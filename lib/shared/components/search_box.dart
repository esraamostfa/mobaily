
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: const [
          SizedBox(width: 9,),
          Icon(
              Icons.search_outlined,
            color: Colors.black,
          ),
          SizedBox(width: 15,),
          Text('Search Mobaily',
            style: TextStyle(
                fontSize: 15,
                color: Colors.grey
            ),
          ),
          SizedBox(width: 51,),
        ],
      ),
      width: 373,
      height: 35,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
    );
  }
}
