import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hb_flutter_library/widget/cust_chip/base_select_entity.dart';

class MultiSelectChip<T extends BaseSelectEntity> extends StatefulWidget {
  /// 标签的list
  final List<T> dataList;

  /// 选中的list
  final List<T> selectList;

  ///选择回调事件
  final Function(List<T>) onSelectionChanged;

  ///是否单选
  final bool singleSelect;

  final bool firstIsAll;

  MultiSelectChip(this.dataList,
      {this.selectList,
      this.onSelectionChanged,
      this.singleSelect = false,
      this.firstIsAll = true});

  @override
  _MultiSelectChipState createState() => _MultiSelectChipState(selectList);
}

class _MultiSelectChipState<T extends BaseSelectEntity>
    extends State<MultiSelectChip> {
  List<T> selectList;

  _MultiSelectChipState(this.selectList);

  @override
  Widget build(BuildContext context) {
    //fixme 这块样式可能还要调整
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      margin: EdgeInsets.all(8.0),
      child: Wrap(
        spacing: 4,
        children: _buildChoiceList(),
      ),
    );

    return Wrap(
      spacing: 4,
      children: _buildChoiceList(),
    );
  }

  _buildChoiceList() {
    List<Widget> choices = List();
    widget.dataList.forEach((item) {
      choices.add(
        ChoiceChip(
          label: Text(
            item.getTag(),
            style: TextStyle(fontSize: 14),
          ),
          selected: selectList.contains(item),
//          materialTapTargetSize: MaterialTapTargetSize.padded,
//          labelPadding: EdgeInsets.only(bottom: 9),
//          padding: EdgeInsets.only(left: 12, right: 12, bottom: 9),
//          selectedColor: Colors.redAccent,
//          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
          onSelected: (selected) {
            if (widget.singleSelect) {
              //单选
              if (selectList.contains(item)) {
                //如已经选中，移除
                selectList.remove(item);
              } else {
                //如没有选中，清除其他，再选中
                selectList.clear();
                selectList.add(item);
              }
            } else if (widget.firstIsAll) {
              //第一个是所有选项，出现在多选里
              if ("所有" == item.getTag()) {
                //选中第一个，清除其他选项，和单选类似
                if (selectList.contains(item)) {
                  //如已经选中，移除
                  selectList.remove(item);
                } else {
                  //如没有选中，清除其他，再选中
                  selectList.clear();
                  selectList.add(item);
                }
              } else {
                //选中其他，清除第一个选中
                if (selectList.length == 1 && selectList[0].getTag() == "所有") {
                  selectList.removeAt(0);
                }
                selectList.contains(item)
                    ? selectList.remove(item)
                    : selectList.add(item);
              }
            } else {
              //多选，选中就移除，没选中就继续选中
              selectList.contains(item)
                  ? selectList.remove(item)
                  : selectList.add(item);
            }
            debugPrint(selectList == null ? "0" : selectList.length.toString());
            setState(() {
              //回调选中list
              widget.onSelectionChanged(selectList);
            });
          },
        ),
      );
    });
    return choices;
  }
}
