import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {

  const HomePage({ Key? key }) : super(key: key);

   @override
   Widget build(BuildContext context) {

     final telefoneEC = TextEditingController();
     final mensagemEC = TextEditingController();

     final tele = telefoneEC.text.toString();
     final mensas = mensagemEC.text.toString();


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
                    TextField(
                      controller: mensagemEC,
                     keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.messenger),
                      border: OutlineInputBorder(),
                      labelText: 'Deseja enviar alguma mensagem (opcional)',
                    )),
                    SizedBox(height: 20,),
                    ElevatedButton(
                      onPressed: () => abrirWhatsApp(tele, mens: mensas), 
                      child: Text('Enviar'))
                 ],
               ),
             ),
           ),
       );
  }

  Future<dynamic> abrirWhatsApp(String tel, {String mens = ''}) async {
  var whatsappUrl = "whatsapp://send?phone=+55$tel&text=$mens ?";

  if (await canLaunch(whatsappUrl)) {
    await launch(whatsappUrl);
  } else {
    throw 'Could not launch $whatsappUrl';
  }
}


}