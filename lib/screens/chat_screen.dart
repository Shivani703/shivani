

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(stream: Firestore.instance
       .collection('chatslbK6JEl6ueD2mGkYCGBE/messages')
       .snapshots(),
       
       builder:(cxt, streamSnapot){

  if(streamSnapot.connectionState == ConnectionState.waiting){
    return Center(
      child: CircularProgressIndicator(),
    );

  }
  final documents = streamSnapot.data.documents;
  return ListView.builder(
  itemCount: streamSnapot.data.documents.length,
  itemBuilder:(ctx, index)=>Container(
    padding: EdgeInsets.all(8),
    child: Text(documents[index]['text']),
  ),
      );
},
  ),
     

    
     floatingActionButton: FloatingActionButton(child: Icon(Icons.add),
     onPressed: (){
       Firestore.instance
       .collection('chatslbK6JEl6ueD2mGkYCGBE/messages').add({
         'text':' This was added by clicking the button!'
       });
      

       },),
    

    
     ),
      
     
  }
}


