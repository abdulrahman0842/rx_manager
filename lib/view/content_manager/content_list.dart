import 'package:flutter/material.dart';
import 'package:rx_manager/view/content_manager/content_form.dart';
import 'package:rx_manager/widgets/action_buttons.dart';

class ContentList extends StatefulWidget {
  const ContentList(
      {super.key,
      this.isEditing = false,
      this.isDeleting = false,
      this.isViewing = false});
  final bool isEditing;
  final bool isDeleting;
  final bool isViewing;

  @override
  State<ContentList> createState() => _ContentListState();
}

class _ContentListState extends State<ContentList> {
  final _searchController = TextEditingController();
  final _searchNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _searchNode.requestFocus();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchNode.dispose();

    super.dispose();
  }

  _updateContentDialog(String content) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Update"),
              content: ContentForm(
                content: content,
                isEditing: true,
              ),
              actions: [
                ActionButtons(
                    textButtonLabel: "Cancel",
                    elevatedButtonLabel: "Save Changes",
                    textButtonOnTap: () {
                      Navigator.pop(context);
                    },
                    elevatedButtonOnTap: () {})
              ],
            ));
  }

  _deleteContentDialog(String content) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Delete"),
              content: Text("Are you sure you want to delete $content?"),
              actions: [
                ActionButtons(
                    textButtonLabel: "Cancel",
                    elevatedButtonLabel: "Delete",
                    textButtonOnTap: () {
                      Navigator.pop(context);
                    },
                    elevatedButtonOnTap: () {})
              ],
            ));
  }

  _displayContentDialog(String content) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(content),
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.clear))
        ]),
        content: Text("Medicines List"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return
        // The reason why here expanded is used is because Column inside Coolumn create Layout issue , we are caling this columnn widget inside content_manager_screen's column widget which can cause error so wrapping this column with expanded sovles the issue
        Expanded(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.4,
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              focusNode: _searchNode,
              decoration: InputDecoration(
                  hintText: "Search..",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  )),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 15,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                      onTap: () {
                        widget.isEditing
                            ? _updateContentDialog("Item $index")
                            : widget.isDeleting
                                ? _deleteContentDialog("Item $index")
                                : _displayContentDialog("Item $index");
                      },
                      title: Text("Item $index"));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
