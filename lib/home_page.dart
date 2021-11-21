import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {

  const HomePage({ Key? key }) : super(key: key);

   

   @override
   Widget build(BuildContext context) {

     final telefoneEC = TextEditingController();



       return Scaffold(
         backgroundColor: Colors.teal[50],
           body: SingleChildScrollView(
             child: Padding(
               padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 80),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.stretch,
                 children: [
                   Image.asset('assets/logo-whats-agora.png',
                   width: 100,
                   height: 150,),
                   SizedBox(height: 30,),
                   TextField(
                     controller: telefoneEC,
                     keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.phone),
                      border: OutlineInputBorder(),
                      labelText: 'Digite o numero com o DDD',
                    )),
                    SizedBox(height: 20,),
                    ElevatedButton(
                      onPressed: () => abrirWhatsApp(telefoneEC.text), 
                      child: Text('Enviar'),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        primary: Colors.greenAccent[700],
                        elevation: 10
                      )
                      ),
                      
                    SizedBox(height: 40,),
                    Text('Coloque o numero desejado da seguinte forma: Ex.: 88912345678 não coloque traços, pontos, parenteses ou qualquer outro simbolo. ')
                 ],
               ),
             ),
           ),
       );
  }

  Future<void> abrirWhatsApp(String fone) async {
  var whatsappUrl = Uri.parse("https://api.whatsapp.com/send?phone=55$fone").toString() ;

  await canLaunch(whatsappUrl) ? launch(whatsappUrl) : print('ERRO NA URL WHATSAPP');
  if (await canLaunch(whatsappUrl)) {
    await launch(whatsappUrl);
  } else {
    throw 'Could not launch $whatsappUrl';
  }
}





}