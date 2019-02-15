<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Player_Model extends CI_Model
{
    public function __construct()
    {
      parent::__construct();
    }

    public function listar_player($login){
      $sql = "Select p.id, p.name,p.hp,p.level,c.class_name,u.username,p.avatar,p.xp,p.patent From players p 
      Inner Join users u on p.users_id = u.id 
        Inner Join class c on p.class_id = c.id
        where u.username = '$login'";
      $heroe = $this->db->query($sql);
      $resultado = $heroe->row_array();
      if($resultado!=null){
        return $resultado;
      } else {
        return null;
      }
    }

    public function listar_conquistas($id_player){
      $sql = "Select c.id,c.nome_con, c.xp, c.descricao,p.name,cf.data,c.imagem From conquistas_feitas cf
      Inner Join players p on cf.jogador_id = p.id
        Inner Join conquistas c on cf.conquista_id = c.id
        where p.id = $id_player;";
      $heroe = $this->db->query($sql);
      if($heroe!=null){
        return $heroe->result();
      } else {
        return null;
      }
    }

    public function listar_tarefas_feitas($id_player){
      $sql = "Select t.name_task, tf.data_conclusao, tf.quantidade, tf.n_chamado From task_feita tf
      Inner Join players p on tf.player_id = p.id
        Inner Join task t on tf.task_id = t.id
        where p.id = $id_player;";
      $heroe = $this->db->query($sql);
      if($heroe!=null){
        return $heroe->result();
      } else {
        return null;
      }
    }

    public function listar_tarefas(){
      $sql = "SELECT id,name_task,xp FROM winoworld.task
              where name_task != 'Eliminar Zumbi'
              AND name_task != 'Tempo de missão diaria'";
      $heroe = $this->db->query($sql);
      if($heroe!=null){
        return $heroe->result();
      } else {
        return null;
      }
    }

    public function add_tarefas($dados){
      $idtask = $dados['task'];
      $playerid = $dados['playerid'];
      $xp = $dados['xp'];
      $quantidade = $dados['quantidade'];
      $nchamado = $dados['nchamado'];
      $data = (string)$dados['data'];

      $sql = "Insert into task_feita values (null,$idtask,'$data', $playerid, $xp, $quantidade, $nchamado);";

      $this->db->query($sql);
      $msg = 'Cadastrado';
      return $msg;
    }

    public function pegar_xp($dados){
      $idtask = $dados['task'];
      $xpTask_query = "Select t.xp From task t where t.id = $idtask;";
      $xpConvert = $this->db->query($xpTask_query);
      $xp = $xpConvert->row_array();

      $xptask = implode(",", $xp);

      return $xptask;
    }

    public function somar_xp($id_player){
      //Pegar XP das Tarefas
      $xpSoma = "SELECT SUM(xp_total) FROM winoworld.task_feita tf
      Inner Join players p on tf.player_id = p.id
      where p.id = $id_player;";
      $xpConvert = $this->db->query($xpSoma);
      $xp = $xpConvert->row_array();
      $xpTotal = implode(",", $xp);
      
      //Atualizar XP das Tarefas
      $sql = "Update players set xp = $xpTotal where id = $id_player;";
      $this->db->query($sql);
      if($xpConvert!=null){
        return $xpConvert->result();
      } else {
        return null;
      }
    }
}