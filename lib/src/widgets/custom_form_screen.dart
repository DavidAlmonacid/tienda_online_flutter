class CustomFormScreen extends StatelessWidget {
  final String title;
  final List<Widget> formFields;
  final VoidCallback onActionButtonPressed;
  final String actionButtonText;

  const CustomFormScreen({
    super.key,
    required this.title,
    required this.formFields,
    required this.onActionButtonPressed,
    required this.actionButtonText,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          child: Column(
            children: [
              ...formFields,
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: onActionButtonPressed,
                child: Text(actionButtonText),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
