import 'package:flutter/material.dart';
import 'package:projeto_flutter/constants/app_colors.dart'; //IMPORTE DA CLASSE DE CORES
import 'package:projeto_flutter/models/lista.dart'; //IMPORTE DA CLASSE
import 'package:projeto_flutter/models/tarefa.dart'; //IMPORTE DA CLASSE

class DataList extends StatefulWidget {
  final Lista bloco;
  final VoidCallback delete; 
  const DataList({super.key, required this.bloco, required this.delete});

  
  @override
  State<DataList> createState() => _DataListState();
}

class _DataListState extends State<DataList> with SingleTickerProviderStateMixin {
  
  bool hideDones = false;

  void createTask() {   //METODO DE CRIAR NOVA TAREFA
    TextEditingController taskControl = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.black1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16), 
            side: BorderSide(
              color: AppColors.black2, 
              width: 1, 
            ),
          ),
          title: Text('Adicionar Tarefa',
            style: TextStyle(
              color: AppColors.white,
            ),
          ),
          content: TextField(
            controller: taskControl,
            style: TextStyle(
              color: AppColors.white,  
            ),
            decoration: InputDecoration(
              hintText: 'Nome da tarefa'
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                String textoTarefa = taskControl.text;
                if (textoTarefa.isNotEmpty) {
                  setState(() {
                    widget.bloco.conjTerefas.add(Tarefa(texto: textoTarefa));
                  });
                  Navigator.pop(context);
                }
              },
              child: Text('Adicionar',
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
  

  void showrMenu() {   //METODO DO MENU DE OPÇÕES DAS LISTAS

    if(hideDones == false){ //SE OS CONCUÍDOS ESTIVEREM A MOSTRA, OPÇÃO DE OCULTAR
      showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            backgroundColor: AppColors.black1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16), 
              side: BorderSide(
                color: AppColors.black3, 
                width: 1,            
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(   //CONTAINER (PARA TER A BORDA BOTTOM) DA OPÇÃO OCULTAR CONCLUIDOS
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: AppColors.black3,
                        width: 1,
                      ),
                    ),
                  ),
                  child: ListTile(   //OPÇÃO OCULTAR CONCLUIDOS
                    title: Text('Ocultar Concluídos',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 18,
                      ),
                    ),
                    trailing: Icon(Icons.visibility_outlined, 
                      color: AppColors.white,
                      size: 24,
                    ),
                    onTap: () {
                      hide();
                      Navigator.pop(context);
                    },
                  ),
                ),
            
                ListTile(   //OPÇÃO APAGAR LISTA 
                  title: Text('Apagar Lista',
                    style: TextStyle(
                      color: AppColors.red,
                      fontSize: 18,
                    ),
                  ),
                  trailing: Icon(Icons.delete_forever_outlined , 
                    color: AppColors.red,
                    size: 24,
                  ),
                  onTap: () {
                    widget.delete(); 
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        },
      );

    }else{   //SE OS CONCUÍDOS ESTIVEREM OCULTADOS, OPÇÃO DE MOSTRAR
      showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            backgroundColor: AppColors.black1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16), 
              side: BorderSide(
                color: AppColors.black2, 
                width: 1,            
              ),
            ),            
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(   //CONTAINER (PARA TER A BORDA BOTTOM) DA OPÇÃO MOSTRAR CONCLUIDOS
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: AppColors.black2,
                        width: 1,
                      ),
                    ),
                  ),
                  child: ListTile(
                    title: Text('Mostrar Concluídos',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 18,
                      ),
                    ),
                    trailing: Icon(Icons.visibility_outlined, 
                      color: AppColors.white,
                      size: 24,
                    ),
                    onTap: () {
                      hide();
                      Navigator.pop(context);
                    },
                  ),
                ),
            
                ListTile(   //LISTTILE DA OPÇÃO APAGAR LISTA 
                  title: Text('Apagar Lista',
                    style: TextStyle(
                      color: AppColors.red,
                      fontSize: 18,
                    ),
                  ),
                  trailing: Icon(Icons.delete_forever_outlined , 
                    color: AppColors.red,
                    size: 24,
                  ),
                  onTap: () {
                    widget.delete(); // Chamando o método para excluir a lista
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        },
      );
    }


  }

  void hide() {
    setState(() {
      hideDones = !hideDones;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.black1,
        title: Text('Listas',
          style: TextStyle(
            color:AppColors.green,
            fontSize: 20,
          ),
        ),

        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,
            color: AppColors.green, 
            ),
          onPressed: () {
            Navigator.pop(context); 
          },
        ),

        actions: [
          IconButton(
            onPressed: showrMenu, 
            icon: Icon(Icons.more_vert,
              color: AppColors.green,
            ),
          ),
        ],

        shape: Border(
          bottom: BorderSide(color:AppColors.black2, width: 2),
        ),

      ),
      
      body: Container(
          width: MediaQuery.of(context).size.width,   //PARA OCUPAR TODA A LARGURA DA TELA
          height: MediaQuery.of(context).size.height,   //PARA OCUPAR TODA A ALTURA DA TELA
          color: AppColors.black1,
          padding: EdgeInsets.symmetric(horizontal: 10),
        
          child: Column(
            children: [
        
              Container(   //CONTAINER DO NOME DA LISTA
                margin: EdgeInsets.only(top: 20, bottom: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(widget.bloco.nome,
                    style: TextStyle(
                      color: widget.bloco.colorName,
                      fontSize: 28,
                    ),
                  ),
                ),
              ),

              
              ListView.builder(   //LISTVIEW DE EXIBIÇÃO DAS TAREFAS
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: widget.bloco.conjTerefas.length,
                itemBuilder: (context, index) {
                  if (hideDones && widget.bloco.conjTerefas[index].done) {
                    return Container();  
                  }else{
                    return ListTile(
                      contentPadding: EdgeInsets.all(0),
                      title: Text(widget.bloco.conjTerefas[index].texto,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          decoration: widget.bloco.conjTerefas[index].done ? TextDecoration.lineThrough : TextDecoration.none,
                          decorationColor: AppColors.black3,
                          color: widget.bloco.conjTerefas[index].done ? AppColors.black3 : AppColors.white ,
                          fontSize: 20,
                        ),
                      ),
                      leading:Row(
                        mainAxisSize: MainAxisSize.min,
                        children:[
                          Icon(
                            widget.bloco.conjTerefas[index].done ? Icons.check_box_outlined : Icons.check_box_outline_blank,
                            color: widget.bloco.conjTerefas[index].done ? AppColors.green : AppColors.black3,
                          ),
                        ] 
                      ),
                      onTap: () {
                        widget.bloco.conjTerefas[index].done = !widget.bloco.conjTerefas[index].done;                       
                        (context as Element).markNeedsBuild();
                      },
                    );
                  }
                },
              ),
              
              Spacer(),
              Container( //CONTAINER DO BOTAO ADICIONAR TAREFAS
                alignment: Alignment.bottomLeft,
                margin: const EdgeInsets.only(bottom: 15),
                child: TextButton.icon(
                  onPressed: () {
                    createTask(); 
                  }, 
                  icon: Icon(Icons.add_circle_outline,
                    color: AppColors.green,
                    size: 24,
                  ),
                  label: Text('Adicionar tarefa',
                    style: TextStyle(
                      color: AppColors.green,
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