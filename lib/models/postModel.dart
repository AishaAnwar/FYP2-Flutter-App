import 'package:image_picker/image_picker.dart';
class PostModel{
  final String? id;
  final String? imageURL;
  final String? postDescription;
  
  const PostModel ({
    required this.id,
    required this.imageURL,
    required this.postDescription,
    
  });

  toJson(){
    return {
      "ImageURL": imageURL,
      "FirstName": postDescription,
      
    };
  }
  
}