import 'package:flutter/material.dart';
import 'package:random_menu/resource/popular_card.dart';
import 'package:random_menu/ui/search/rm_search.dart';
import '../../resource/custom_chip_style.dart';
import '../../resource/constant.dart';
import '../../ui/appbar/rm_appbar.dart';

class RmHome extends StatefulWidget {
  @override
  _RmHomeState createState() => _RmHomeState();
}

// ignore: public_member_api_docs
class _RmHomeState extends State<RmHome> {
  TextEditingController _searchController = TextEditingController();
  FocusNode _searchNode = FocusNode();

  final List<String> _categoryList = [
    '전체',
    '한식',
    '분식',
    '아시안/양식',
    '햄버거',
    '피자',
    '돈까스/초밥'
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _searchController?.dispose();
    _searchNode?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: white,
        appBar: RmAppBar(),
        body: SingleChildScrollView(
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _top(),
              _search(),
              _category(),
              _popularTitle(),
              _popular(),
              _offerTitle(),
              _offer()
          ],
        )));
  }

  Widget _top() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 10),
      child: Container(
        child: Text(
          'Welcome!',
          style: TextStyle(
              color: deepBlueColor,
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
      ),
    );
  }

  Widget _search() {
    return Padding(
      padding: EdgeInsets.only(top: 20, left: 30),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: lightgrey,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Icon(
                Icons.search,
                color: black,
              ),
            ),
            Expanded(
                child: TextFormField(
              controller: _searchController,
              focusNode: _searchNode,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 10),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintText: "Search.."),
              cursorColor: deepBlueColor,
              onFieldSubmitted: (value) {
                // _searchNode.dispose();
                _searchMenu(value);
              },
            ))
          ],
        ),
      ),
    );
  }

  void _searchMenu(String value) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RmSearch(result: value)),
    );
  }

  Widget _category() {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Container(
        height: 60,
        // color: Constant.deepBlueColor,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: List.generate(_categoryList.length, (index) {
            return CustomChipStyle(
                selectMenu: _categoryList[index], index: index);
          }),
        ),
      ),
    );
  }

  Widget _popularTitle() {
    return Padding(
        padding: const EdgeInsets.only(top: 20, left: 10),
        child: Row(
          children: [
            Text(
              'Most Popular',
              style: TextStyle(
                  color: deepBlueColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 3),
              child: Image.asset(
                'assets/icon/category/sparkles.png',
                width: 30,
                height: 30,
              ),
            )
          ],
        ));
  }

  Widget _popular() {
    return Padding(
      padding: EdgeInsets.only(top: 15),
      child: Container(
          // color: Constant.deepBlueColor,
          height: 230,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(5, (index) {
              return PopularCard(imageUrl: popularImageUrl[index], name: popularName[index]);
            }),
          )),
    );
  }

  //https://apps.timwhitlock.info/emoji/tables/unicode
  Widget _offerTitle() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 10),
      child: Text(
        'Our Special Offer \u{1f60e}',
        style: TextStyle(
            color: deepBlueColor,
            fontWeight: FontWeight.bold,
            fontSize: 20),
      ),
    );
  }

  Widget _offer() {
    return Container(
      margin: EdgeInsets.all(10),
      height: 120,
      // color: Constant.deepBlueColor,
      child: Image.network(
          'https://www.jeffbullas.com/wp-content/uploads/2020/10/Banner-Designs-Inspiration-Starbucks-Draft.jpg'),
    );
  }
}
