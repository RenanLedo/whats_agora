import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {

  const HomePage({ Key? key }) : super(key: key);

   

   @override
   Widget build(BuildContext context) {

     final telefoneEC = TextEditingController();



       return Scaffold(
           appBar: AppBar(title: const Text('Whats Agora'),),
           body: SingleChildScrollView(
             child: Padding(
               padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.stretch,
                 children: [
                   
                   TextField(
                     controller: telefoneEC,
                     keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.phone),
                      border: OutlineInputBorder(),
                      labelText: 'Digite o numero',
                    )),
                    SizedBox(height: 20,),
                    ElevatedButton(
                      onPressed: abrirWhatsApp, 
                      child: Text('Enviar'))
                 ],
               ),
             ),
           ),
       );
  }

  Future<void> abrirWhatsApp() async {
  var whatsappUrl = Uri.parse("https://api.whatsapp.com/send?phone=5588997277737").toString() ;

  await canLaunch(whatsappUrl) ? launch(whatsappUrl) : print('ERRO NA URL WHATSAPP');
print('ERRO NA FUNÇÃO');
  if (await canLaunch(whatsappUrl)) {
    await launch(whatsappUrl);
  } else {
    throw 'Could not launch $whatsappUrl';
  }
}





}