import 'package:flutter/material.dart';
import 'package:projeto_flutter/constants/app_colors.dart'; //IMPORTE DA CLASSE DE CORES
import 'package:projeto_flutter/models/lista.dart'; //IMPORTE DA CLASSE 
import 'package:projeto_flutter/pages/data_list_page.dart'; //IMPORTE DA PAGE

class HomeList extends StatefulWidget {

  const HomeList({super.key,});

  @override
  State<HomeList> createState() => _HomeListState();
}

class _HomeListState extends State<HomeList> {
  List<Lista> conjListas = [];
  late Color color;


  void createList(){   //METODO DE CRIAR NOVA LISTA
    showDialog(
      context: context,
      builder: (context) {
        TextEditingController titleController = TextEditingController();
        return AlertDialog(
          backgroundColor: AppColors.black1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16), 
            side: BorderSide(
              color: AppColors.black2, 
              width: 1,            
            ),
          ), 
          title: Text('Criar Nova Lista',
            style: TextStyle(
              color: AppColors.white,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                style: TextStyle(
                  color: AppColors.white,  
                ),
                decoration: InputDecoration(
                  hintText: 'Nome da Lista',
                ),
              ),
              
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton.icon(   // BOTÃO DA OPÇÃO COR PURPLE
                  onPressed: () {
                      setState(() {
                        color = AppColors.purple;
                      });
                    },
                    icon: Icon(Icons.radio_button_on,
                      color: AppColors.purple,
                      size: 24
                    ) ,
                    label: SizedBox.shrink(),
                  ),

                  TextButton.icon(   // BOTÃO DA OPÇÃO COR GREEN
                  onPressed: () {
                      setState(() {
                        color = AppColors.green;
                      });
                    },
                    icon: Icon(Icons.radio_button_on,
                      color: AppColors.green,
                      size: 24
                    ) ,
                    label: SizedBox.shrink(),
                  ),

                  TextButton.icon(   // BOTÃO DA OPÇÃO COR BLUE
                  onPressed: () {
                      setState(() {
                        color = AppColors.blue;
                      });
                    },
                    icon: Icon(Icons.radio_button_on,
                      color: AppColors.blue,
                      size: 24
                    ) ,
                    label: SizedBox.shrink(),
                  ),                  
                ]
              ),
            ]
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                String title = titleController.text;
                if (title.isNotEmpty) {
                  setState(() {
                    conjListas.add(Lista(nome: title, colorName: color));
                  });
                  Navigator.pop(context);
                }
              },
              child: Text('Criar',
                style: TextStyle(
                  color: AppColors.green,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancelar',
                style: TextStyle(
                    color: AppColors.red,
                  ),
                ),
            ),
          ],
        );
      },
    );
  }
  
    
  void deleteList(int index) {   //METODO DE APAGAR UMA LISTA 
    setState(() {
      conjListas.removeAt(index); 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,   //PARA OCUPAR TODA A LARGURA DA TELA
        height: MediaQuery.of(context).size.height,   //PARA OCUPAR TODA A ALTURA DA TELA
        color: AppColors.black1,
        child: Column(
          children: [

            Container(   //CONTAINER DO TITULO "MINHAS LISTAS"
              margin: const EdgeInsets.only(top: 70.0, left: 20, bottom: 20),
              child: Align( 
                alignment: Alignment.centerLeft,
                child: Text('Minhas Listas',
                  style: TextStyle(
                    fontSize: 28,
                    color: AppColors.white,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),


            Container( //CONTAINER DE EXIBIÇÃO DE TODAS AS LISTAS
              margin: EdgeInsets.symmetric(horizontal: 20), 
              decoration: BoxDecoration(
                color: AppColors.black2,
                borderRadius: BorderRadius.circular(15), 
              ), 
              child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: conjListas.length,
                itemBuilder: (context, index) {
                  bool notFirst = index > 0;   //VARIAVEL CONDICIONAL PRA NÃO COLOCAR A BORDA DA PRIMEIRA LISTA
                  return Container(
                    decoration: BoxDecoration(
                      border: Border(
                        top: notFirst
                        ? BorderSide(
                          color: AppColors.black3,
                          width: 1,
                        )
                        : BorderSide.none, 
                      ),
                    ),
                    child: ListTile(
                      title: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            child: Icon(
                              Icons.circle,
                              color: conjListas[index].colorName, 
                              size: 10, 
                            ),
                          ),
                          Text(conjListas[index].nome,
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      trailing: Row(
                          mainAxisSize: MainAxisSize.min, 
                          children: [
                            Text('${conjListas[index].conjTerefas.length}', 
                              style: TextStyle(
                                color: AppColors.white
                              )
                            ),
                            Icon(Icons.arrow_forward_ios, 
                              color: AppColors.black3,
                              size: 20,
                            ),
                          ],
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DataList(
                              bloco: conjListas[index],
                              delete: () => deleteList(index),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            
            
            Spacer(),
            Container(   //CONTAINER DO BOTÃO "NOVA LISTA"
              margin: const EdgeInsets.only( bottom: 40),
              child: ElevatedButton.icon(
                onPressed: () {
                  createList();
                }, 
                icon: Icon(
                  Icons.add_circle_outline,
                  color: AppColors.black1, 
                  size: 24,
                ),
                label: Text('Nova Lista',
                  style: TextStyle(
                    color: AppColors.black1,
                    fontSize: 18,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.green,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15), 
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), 
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