<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Player_Model extends CI_Model
{
    public function __construct()
    {
      parent::__construct();
    }

    public function listar_player($login){
      $sql = "Select p.id, p.glpi_id ,p.chance, p.name,p.hp,l.level,c.class_name,u.username,p.avatar,p.xp,p.patent, p.liberado From players p 
      Inner Join users u on p.users_id = u.id
      Inner Join level l on p.level_id = l.id 
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

    public function listar_historico($player_name, $second){
      if($second = 1){
      $sql = "SELECT l.nome_jogador, l.zumbis_mortos, l.sem_categoria FROM winoworld.log_jogadores l
      Inner Join players p on l.nome_jogador = p.name where l.nome_jogador = '$player_name';";
      $heroe = $this->db->query($sql);
      $resultado = $heroe->row_array();
      if($resultado!=null){
        return $resultado;
      } else {
        return null;
      }
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

    public function somar_xp($id_player, $zumbis){
      //Pegar XP das Tarefas
      $xpSoma = "SELECT SUM(xp_total) FROM winoworld.task_feita tf
      Inner Join players p on tf.player_id = p.id
      where p.id = $id_player;";
      $xpConvert = $this->db->query($xpSoma);
      $xp = $xpConvert->row_array();
      $xpTotal = implode(",", $xp);
      $xp_final = $xpTotal + $zumbis;
      $sql = "Update players SET xp = $xp_final WHERE id= $id_player";
      $query_soma = $this->db->query($sql);
      if($xpConvert!=null){
        return $xpConvert->result();
      } else {
        return null;
      }
    }

    public function quantidade_chamado($id_glpi,$id_player,$vida_2,$zumbis_historico){
      $glpi = $this->load->database('glpi', TRUE);
      $sql = "SELECT count(*) FROM winover_chamados.glpi_tickets t
      Inner Join winover_chamados.glpi_users u on t.users_id_lastupdater = u.id
      Inner Join winover_chamados.glpi_itilcategories i on t.itilcategories_id = i.id 
      where date between '2019-02-01 00:00:00' and '2019-02-28 23:00:00' AND u.id = $id_glpi;";
      $zombies = $glpi->query($sql);
      $zv = $zombies->row_array();
      $zombies_total = implode(",", $zv);
      if($zombies!=null){
        if($vida_2 == 1){
          $segunda_chance = $zombies_total - $zumbis_historico;
          $sql2 = "Update players set zumbis_mortos = $segunda_chance where id = $id_player;";
          $dog = $this->db->query($sql2);
          return $segunda_chance;
        }else{
          $sql2 = "Update players set zumbis_mortos = $zombies_total where id = $id_player;";
          $dog = $this->db->query($sql2);
          return $zombies_total;
        }
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

    public function somar_sla($id_glpi, $id_player, $hp){
      $glpi = $this->load->database('glpi', TRUE);
      $sql = "SELECT SEC_TO_TIME(AVG(t.solve_delay_stat)) FROM winover_chamados.glpi_tickets t
      Inner Join winover_chamados.glpi_users u on t.users_id_lastupdater = u.id
      Inner Join winover_chamados.glpi_itilcategories i on t.itilcategories_id = i.id 
      where date between '2019-02-01 00:00:00' and '2019-02-28 23:00:00' AND u.id = $id_glpi;";
      $sla_total_segundos = $glpi->query($sql);
      $sla_total = $sla_total_segundos->row_array();
      $sla_segregado = implode(",", $sla_total);
      $sla = substr($sla_segregado, 0,-5);
      $sql2 = "Update players SET tma = '$sla' WHERE id= $id_player;";
      $query_sql2 = $this->db->query($sql2);
      if($sla_total_segundos!=null){
        return $sla;
      } else {
        return null;
      }  
    }

    public function sem_categoria($id_glpi){
      $glpi = $this->load->database('glpi', TRUE);
      $sql = "SELECT COUNT(*) FROM winover_chamados.glpi_tickets 
      where date between '2019-02-01 00:00:00' and '2019-02-28 23:00:00' 
      and users_id_lastupdater = $id_glpi
      and itilcategories_id = 0;";
      $total_query = $glpi->query($sql);
      $total_array = $total_query->row_array();
      $total_sem_categoria = implode(",", $total_array);
      return $total_sem_categoria;
    }

    public function calcular_vida_semcat($id_player, $total_sem_categoria,$hp,$vida,$historico){
      // if($vida == 1){
      //   $nova_categoria = $total_sem_categoria - $historico;
      //   $dano_total = $nova_categoria * 6;
      //   $vida_perdida = $hp - $dano_total;
      //   if($vida_perdida < 0 ){
      //     $zerado = 0;
      //     $sql_update_vida = "Update players SET hp = '$vida_perdida' WHERE id= $id_player;";
      //     //$query_vida = $this->db->query($sql_update_vida);
      //   }else{
      //     $sql_update_vida = "Update players SET hp = '$vida_perdida' WHERE id= $id_player;";
      //     //$query_vida = $this->db->query($sql_update_vida);
      //   }
      // } else {

      echo $total_sem_categoria;
      $dano_total = $total_sem_categoria * 6;
      $vida_perdida = $hp - $dano_total;
      if($vida_perdida < 0 ){
        $vida_perdida = 0;
        $sql_update_vida = "Update players SET hp = '$vida_perdida' WHERE id= $id_player;";
        //$query_vida = $this->db->query($sql_update_vida);
      }else{
        $sql_update_vida = "Update players SET hp = '$vida_perdida' WHERE id= $id_player;";
       // $query_vida = $this->db->query($sql_update_vida);
      }
    

    }

    public function verificar_level($id_player,$level_id){

    }

    public function veriricar_vivo($id_player){
      $sql_verificar_vida = "select Count(p.name) from players p
      where hp <= 0 and id = $id_player or chance = 1;";
      $status_vida = $this->db->query($sql_verificar_vida);
      $qtd_mortes = $status_vida->row_array();
      $mortes_total = implode(",", $qtd_mortes);

      return $mortes_total;
    }


    public function registro_vida($id, $class_id, $name, $level_id, $xp, $zumbis_mortos, $tma, $sem_categoria){
      $sql_log_vida = "INSERT INTO log_jogadores VALUES (null,'$name', $xp, $level_id, '$class_id', NOW(), '$tma', $zumbis_mortos, $sem_categoria);";
      $registrando_morte = $this->db->query($sql_log_vida);
    }

    public function matar_personagem($id_player){
      $sql_matando = "Update players set class_id = 1 where id = $id_player;"; 
      $sql_matando1 = "Update players set hp = 50 where id = $id_player; ";
      $sql_matando2 = "Update players set patent = null where id = $id_player;";
      $sql_matando3 = "Update players set xp = 0 where id = $id_player;";
      $sql_matando4 = "Update players set liberado = 0 where id = $id_player;";
      $sql_matando5 = "Update players set bloqueio = 0 where id = $id_player;";

      $this->db->query($sql_matando);
      $this->db->query($sql_matando1);
      $this->db->query($sql_matando2);
      $this->db->query($sql_matando3);
      $this->db->query($sql_matando4);
      $this->db->query($sql_matando5);
    }



    // public function evoluir_classe($id_player,$level,$liberado,$classe){
    //   if($liberado == 1){
    //     $sql = "update players set level = $level_up where id= $id_player;";
    //     $query_xp = $this->db->query($sql);
    //   }

    // }
   
}