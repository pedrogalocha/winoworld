<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Player_Model extends CI_Model
{
    public function __construct()
    {
      parent::__construct();
    }

    public function listar_player($login){
      $sql = "Select p.id, p.glpi_id , p.name,p.hp,p.level,c.class_name,u.username,p.avatar,p.xp,p.patent From players p 
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
      if($xpConvert!=null){
        return $xpConvert->result();
      } else {
        return null;
      }
    }

    public function quantidade_chamado($id_glpi,$id_player){
      $glpi = $this->load->database('glpi', TRUE);
      $sql = "SELECT count(*) FROM winover_chamados.glpi_tickets t
      Inner Join winover_chamados.glpi_users u on t.users_id_lastupdater = u.id
      Inner Join winover_chamados.glpi_itilcategories i on t.itilcategories_id = i.id 
      where date between '2019-02-01 00:00:00' and '2019-02-15 23:00:00' AND u.id = $id_glpi;";
      $zombies = $glpi->query($sql);
      $zv = $zombies->row_array();
      $zombies_total = implode(",", $zv);
      if($zombies!=null){
        $sql2 = "Update players set zumbis_mortos = $zombies_total where id = $id_player;";
        $dog = $this->db->query($sql2);
        return $zombies_total;
      } else {
        return null;
      }  
    }

    public function atualizando_banco($id_player, $zombies_total){
      $sql2 = "Update winoworld.players set zumbis_mortos = $zombies_total where id = $id_player;";
      $zombies_mortos = $this->db->query($sql2);
    }


    public function missoes_concluidas($id_player){
      $sql = "Select COUNT(*) total From task_feita tf
      Inner Join players p on tf.player_id = p.id
        where p.id = $id_player";
      $missoes = $this->db->query($sql);
      $m1 = $missoes->row_array();
      $missoes_total = implode(",", $m1);
      if($missoes!=null){
        return $missoes_total;
      } else {
        return null;
      }  
    }

    public function somar_sla($id_player){
      $glpi = $this->load->database('glpi', TRUE);
      $sql = "SELECT SEC_TO_TIME(AVG(t.solve_delay_stat)) FROM winover_chamados.glpi_tickets t
      Inner Join winover_chamados.glpi_users u on t.users_id_lastupdater = u.id
      Inner Join winover_chamados.glpi_itilcategories i on t.itilcategories_id = i.id 
      where date between '2019-02-01 00:00:00' and '2019-02-28 23:00:00' AND u.id = $id_player;";
      $sla_total_segundos = $glpi->query($sql);
      $sla_total = $sla_total_segundos->row_array();
      $sla_segregado = implode(",", $sla_total);
      $sla = substr($sla_segregado, 0,-5);
 
      if($sla_total_segundos!=null){
        return $sla;
      } else {
        return null;
      }  
    }
   
}