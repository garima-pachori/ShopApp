import 'package:flutter/material.dart';
import 'package:shop_app/Providers/product.dart';

class EditProductScreen extends StatefulWidget {
  static const routeName='/edit-product';
  const EditProductScreen({super.key});

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _priceFocusNode =FocusNode();
  final _descriptionFocusNode=FocusNode();
  final _imageUrlController=TextEditingController();
  final _imageUrlFocusNode=FocusNode();
  final _form=GlobalKey<FormState>();
  var _editedProduct=
    Product(
        id: null, 
        title: '', 
        description: '', 
        price: 0, 
        imageURL: ''
        );


  @override
  void initState() {
    // TODO: implement initState
    _imageUrlFocusNode.addListener(_updateImageUrl);
    super.initState();
  }
  //focus nodes leads to memory leakage, so we gotta remove it before moving further

  @override
  void dispose() {
    // TODO: implement dispose
    _priceFocusNode.dispose();
    _descriptionFocusNode.dispose();
    _imageUrlController.dispose();
    _imageUrlController.dispose();
    super.dispose();
  }

  void _updateImageUrl(){
    if(!_imageUrlFocusNode.hasFocus){
      setState(() {
      });
    }
  }

  void _saveForm(){
    final isValid=_form.currentState?.validate();
    if(!isValid!){
      return;
    };
    _form.currentState?.save();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Products'),
        actions: <Widget>[
          IconButton(
            onPressed: _saveForm, 
            icon: Icon(Icons.save),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _form,
          child: ListView(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Title'
                ),
                textInputAction: TextInputAction.next,
                //when we want to shift focus to next item
                onFieldSubmitted: (_){
                  FocusScope.of(context).requestFocus(_priceFocusNode);
                },
                validator: (value){
                  if(value!.isEmpty){
                    return 'Please provide a value!';
                  }
                  return null;
                },
                onSaved: (value) {
                  _editedProduct = Product(
                    id: null, 
                    title: value!, 
                    description: _editedProduct.description, 
                    price: _editedProduct.price, 
                    imageURL: _editedProduct.imageURL);
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Price'
                ),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                focusNode: _priceFocusNode,
                onFieldSubmitted: (_){
                  FocusScope.of(context).requestFocus(_descriptionFocusNode);
                },
                onSaved: (value) {
                  _editedProduct = Product(
                    id: null, 
                    title: _editedProduct.title, 
                    description: _editedProduct.description, 
                    price: double.parse(value!), 
                    imageURL: _editedProduct.imageURL);
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Description'
                ),
                maxLines: 3,
                keyboardType: TextInputType.multiline,
                focusNode: _descriptionFocusNode,
                onSaved: (value) {
                  _editedProduct = Product(
                    id: null, 
                    title: _editedProduct.title,
                    description: value!, 
                    price: _editedProduct.price, 
                    imageURL: _editedProduct.imageURL);
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    margin: const EdgeInsets.only(
                      top:8,
                      right: 10
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Colors.grey
                      )
                    ),
                    child: Container(
                     child: _imageUrlController.text.isEmpty? 
                      const Text('Enter a URL') :
                      FittedBox(
                        child: Image.network(
                          _imageUrlController.text,
                          fit: BoxFit.cover,
                        ),
                      )
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Image URL'
                        ),
                        keyboardType: TextInputType.url,
                        textInputAction: TextInputAction.done,
                        controller: _imageUrlController,
                        focusNode: _imageUrlFocusNode,
                        onFieldSubmitted: (_){
                          _saveForm();
                        } ,
                        onSaved: (value) {
                          _editedProduct = Product(
                            id: null, 
                            title: _editedProduct.title, 
                            description: _editedProduct.description, 
                            price: _editedProduct.price, 
                            imageURL: value!);
                        },
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}