import 'dart:ui';
import 'package:projeto_flutter/constants/app_colors.dart'; //IMPORTE DA CLASSE DE CORES
import 'package:projeto_flutter/models/tarefa.dart'; //IMPORTE DA CLASSE

class Lista {
  Color colorName;
  String nome;
  List<Tarefa> conjTerefas; 
  Lista({required this.nome,this.colorName = AppColors.red}) : conjTerefas = [];


}