import 'package:flutter/material.dart';

class LibraryPanel extends StatefulWidget {
  const LibraryPanel({super.key});

  @override
  State<LibraryPanel> createState() => _LibraryPanelState();
}

class _LibraryPanelState extends State<LibraryPanel> {
  bool showFileScreen = false;

  void openFileScreen(){
    setState(() {
      showFileScreen = true;
    });
  }

  void goBack(){
    setState(() {
      showFileScreen = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      child: showFileScreen 
      ? FileScreen(onBack : goBack) 
      : BaseScreen(onSelectFolder : openFileScreen),
    );
  }
}

class BaseScreen extends StatelessWidget{
  final VoidCallback onSelectFolder;

  const BaseScreen({
    super.key,
    required this.onSelectFolder,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Container(
              color: Colors.blue,
            ),
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: onSelectFolder,
            child: Text("Select Folder")
            ),
        )
      ],
    );
  }
}

class FileScreen extends StatelessWidget{
  final VoidCallback onBack;

  const FileScreen({
    super.key,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              IconButton(
                onPressed: onBack, 
                icon: Icon(Icons.arrow_back,size: 20,)
              ),
              const SizedBox(width: 8,),
              const Text(
                'Selected Folder'
              )

            ],
          ),
        ),

        Expanded(
          child: Text(""),
        )
      ],
    );
  }
}
