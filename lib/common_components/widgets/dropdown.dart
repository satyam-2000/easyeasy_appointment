import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DropDownWidget extends StatefulWidget {
  final String title;
  final String hint;
  final DropDownItem? selectedItem;
  final List<DropDownItem> options;
  final Function(DropDownItem) onChanged;
  final bool isMandatory;
  final bool isRead;

  const DropDownWidget({
    Key? key,
    this.title = "",
    this.hint = "Select",
    this.selectedItem,
    this.isMandatory = false,
    required this.options,
    required this.onChanged,
    this.isRead = false,
  }) : super(key: key);

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  final GlobalKey _key = LabeledGlobalKey("button_icon");
  late OverlayEntry _overlayEntry;
  late Size buttonSize;
  late Offset buttonPosition;

  bool isMenuOpen = false;
  late FixedExtentScrollController scrollController;

  findButton() {
    RenderBox renderBox = _key.currentContext!.findRenderObject() as RenderBox;
    buttonSize = renderBox.size;
    buttonPosition = renderBox.localToGlobal(Offset.zero);
  }

  @override
  void initState() {
    scrollController = FixedExtentScrollController();
    super.initState();
  }

  OverlayEntry _overlayEntryBuilder() {
    return OverlayEntry(builder: (context) {
      return Container(
        color: Colors.transparent,
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            closeMenu();
          },
          child: Stack(
            children: [
              Positioned(
                top: buttonPosition.dy + buttonSize.height + 4,
                left: buttonPosition.dx,
                width: buttonSize.width,
                child: Container(
                  color: Colors.white,
                  child: Material(
                    color: Colors.white,
                    elevation: 10,
                    child: dropDown(),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }

  void openMenu() {
    findButton();
    _overlayEntry = _overlayEntryBuilder();
    Overlay.of(context).insert(_overlayEntry);
    isMenuOpen = true;
    // Unfocus the current focus node to close the keyboard
    FocusScope.of(context).unfocus();
  }

  void closeMenu() {
    _overlayEntry.remove();
    isMenuOpen = false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onLongPress: () {
          HapticFeedback.lightImpact();
        },
        onLongPressUp: () {
          setState(() {
            closeMenu();
          });
        },
        onTap: () {
          if (widget.isRead) {
            return;
          }
          if (isMenuOpen) {
            closeMenu();
          } else {
            openMenu();
          }
        },
        child: SizedBox(
          child: Column(
            children: [
              if (widget.title.isNotEmpty)
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    children: [
                      Text(
                        widget.title,
                        style: const TextStyle(color: Colors.teal),
                      ),
                      if (widget.isMandatory)
                        const Text(
                          " *",
                          style: TextStyle(color: Colors.red),
                        )
                    ],
                  ),
                ),
              Container(
                key: _key,
                padding: const EdgeInsets.symmetric(vertical: 18,horizontal: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.teal,width: 1.0),
                  borderRadius: BorderRadius.circular(8)
                ),
                child: widget.selectedItem == null
                    ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.hint,
                      style: const TextStyle(

                      ),
                    ),
                    const Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: Colors.black,
                    ),
                  ],
                )
                    : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        if (widget.selectedItem!.icon != null)
                          Container(
                            child: widget.selectedItem!.icon,
                          ),
                        SizedBox(
                          width: widget.selectedItem!.icon != null ? 4
                              : 0,
                        ),
                        Text(
                          widget.selectedItem?.name ?? "Select",
                          style: const TextStyle(
                          ),
                        ),
                      ],
                    ),
                    const Icon(Icons.keyboard_arrow_down_rounded),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget dropDown() {
    return widget.options.length <= 4
        ? Wrap(
      children: widget.options.map((e) {
        return ListTile(
          leading: e.icon,
          title: Text(e.name),
          onTap: () {
            closeMenu();
            widget.onChanged(e);
            scrollController.animateToItem(
              widget.options.indexOf(e),
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn,
            );
            setState(() {});
          },
        );
      }).toList(),
    )
        : SizedBox(
      height: MediaQuery.of(context).size.height / 3.2,
      width: MediaQuery.of(context).size.width / 3,
      child: ListView(
        padding: EdgeInsets.zero,
        children: widget.options.map((e) {
          return ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 7,
            ),
            leading: e.icon,
            title: Text(
              e.name,
              overflow: TextOverflow.clip,
              style: const TextStyle(fontSize: 14),
            ),
            onTap: () {
              closeMenu();
              widget.onChanged(e);
              scrollController.animateToItem(
                widget.options.indexOf(e),
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeIn,
              );
              setState(() {});
            },
          );
        }).toList(),
      ),
    );
  }
}

class DropDownItem {
  final String name;
  final String? apiValue;
  final String? data;
  final Widget? icon;
  final DateTime? startTime;
  final DateTime? endTime;
  final String? id;

  const DropDownItem(
      {required this.name,
        this.apiValue,
        this.data,
        this.icon,
        this.startTime,
        this.endTime,
        this.id});
}
