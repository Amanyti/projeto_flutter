import 'package:flutter/material.dart';
import 'package:projeto_flutter/constants/app_colors.dart'; //IMPORTE DA CLASSE DE CORES
import 'package:projeto_flutter/pages/home_list_page.dart'; //IMPORTE DA PAGE

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,  
        height: MediaQuery.of(context).size.height,
        color: AppColors.black1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[

              Container(   //CONTAINER APENAS DO TITULO 
                margin: const EdgeInsets.only(top: 90.0),
                child:  Text(
                  'Que bom ter você\naqui no I-List!',
                  style: TextStyle(
                    fontSize: 30,
                    color:AppColors.white,
                  ), 
                  textAlign: TextAlign.center,
                ),
              ),

              Container(
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                child: Image.asset('assets/img2.png',
                  width: 250,
                  height: 250,
                ),
              ),

              Container(   //CO
                margin: const EdgeInsets.symmetric(vertical: 10.0), 
                child:  Text(
                  'Crie listas, defina lembrete e\n alcance seus objetivos com mais\n facilidade.',
                  style: TextStyle(
                    fontSize: 15,
                    color: AppColors.white,
                  ), 
                  textAlign: TextAlign.center,
                ),
              ),

              
              Container(   //CONTAINER DO BOTÃO
                margin: const EdgeInsets.only( bottom: 40),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context, MaterialPageRoute(
                        builder: (context) => HomeList(),
                      ),
                    );
                  }, 
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.purple,
                    padding: EdgeInsets.symmetric(horizontal: 55, vertical: 15), 
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), 
                    ),
                  ),
                  child: Text('Comerçar',
                    style: TextStyle(
                      color: AppColors.black1,
                      fontSize: 18,
                    ),
                  ),
 
                ),
              ),

            ],

          ),
        
      ),
      
    );

  }
}