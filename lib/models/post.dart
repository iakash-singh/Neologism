import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String description;
  final String uid;
  final String username;
  final likes;
  final String postId;
  final DateTime datePublished;
  final String postUrl;
  final String profImage;

  const Post({
    required this.description,
    required this.uid,
    required this.username,
    required this.likes,
    required this.postId,
    required this.datePublished,
    required this.postUrl,
    required this.profImage,
  });
/*A [DocumentSnapshot] contains data read from a document in your [FirebaseFirestore] database.
The data can be extracted with the data property or by using subscript syntax to access a specific field.*/
  static Post fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String,
        dynamic>; //snapshot:Contains all the data of this document snapshot.

/*A collection of key/value pairs, from which you retrieve a value using its associated key.
There is a finite number of keys in the map, and each key has exactly one value associated with it.

Maps, and their keys and values, can be iterated. The order of iteration is defined by the individual type of map. Examples:*/
    return Post(
        description: snapshot["description"],
        uid: snapshot["uid"],
        likes: snapshot["likes"],
        postId: snapshot["postId"],
        datePublished: snapshot["datePublished"],
        username: snapshot["username"],
        postUrl: snapshot['postUrl'],
        profImage: snapshot['profImage']);
  }

  Map<String, dynamic> toJson() => {
        "description": description,
        "uid": uid,
        "likes": likes,
        "username": username,
        "postId": postId,
        "datePublished": datePublished,
        'postUrl': postUrl,
        'profImage': profImage
      };
}
