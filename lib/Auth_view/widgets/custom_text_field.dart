import 'package:flutter/material.dart';

class CustomFormTextField extends StatefulWidget {
  const CustomFormTextField(
      {this.hintText,
      this.obscureText = false,
      required this.onchanged,
      required this.emptyText,
      required this.label,
      required this.suffixIcon,
      this.readOnly = false, this.initText});

  final String? hintText;

  final String? initText;

  final IconData suffixIcon;

  final String label;

  final String? emptyText;

  final bool obscureText;

  final Function(String)? onchanged;

  final bool readOnly ;

  @override
  State<CustomFormTextField> createState() => _CustomFormTextFieldState();
}

class _CustomFormTextFieldState extends State<CustomFormTextField> {
  late bool _isVisible = widget.obscureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: TextStyle(fontSize: 16, color: Color(0xff808194)),
          ),
          SizedBox(
            height: 8,
          ),
          TextFormField(
            initialValue:widget.initText,
            readOnly: widget.readOnly,
            onChanged: widget.onchanged,
            obscureText: widget.obscureText,
            style: TextStyle(color: Colors.black),
            validator: (value) {
              if (value!.isEmpty) {
                return "${widget.emptyText}";
              }
            },
            decoration: InputDecoration(
              // labelText: lableText,
              // labelStyle: TextStyle(color: Colors.black),
              suffixIcon: IconButton(
                padding: EdgeInsets.zero,
                icon: Icon(widget.suffixIcon , size: 20,),
                onPressed: () {
                  setState(() {
                    _isVisible = !_isVisible;
                  });
                },
              ),
              hintText: widget.hintText,
              hintStyle: TextStyle(color: Colors.black.withOpacity(0.4)),
              filled: true,
              fillColor: Colors.white.withOpacity(0),
              focusColor: Colors.black,
              contentPadding: EdgeInsets.symmetric(horizontal: 15 , vertical: 15),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.blue)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.grey.shade400)),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.red, width: 2.0)),
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.red, width: 2.0)),
            ),
          ),
        ],
      ),
    );
  }
}
