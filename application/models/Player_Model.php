<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Player_Model extends CI_Model
{
    public function __construct()
    {
      parent::__construct();
    }

    public function listar_player($login){
      $sql = "Select p.id, p.glpi_id ,p.chance, p.name,p.hp, p.hp_total,l.level,c.class_name,u.username,p.avatar,p.xp, p.xp_atual, p.liberado From players p 
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

    public function mes_atual(){
      $sql_mes = "SELECT inicio_mes, fim_mes FROM mes_atual;";
      $query_mes = $this->db->query($sql_mes);
      $mes_atual = $query_mes->row_array();

      if($mes_atual!=null){
        return $mes_atual;
      } else {
        return null;
      }
    }

    public function listar_historico($player_name, $second){
      if($second == 1){
      $sql = "SELECT l.nome_jogador, l.zumbis_mortos, l.sem_categoria FROM log_jogadores l
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

    public function listar_conquistas($id_player,$inicio_mes,$fim_mes){
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

    public function listar_tarefas_feitas($id_player, $inicio_mes, $fim_mes){
      $sql = "Select t.name_task, tf.data_conclusao, tf.quantidade, tf.n_chamado, tf.descricao From task_feita tf
      Inner Join players p on tf.player_id = p.id
        Inner Join task t on tf.task_id = t.id
        where p.id = $id_player
        and data_conclusao between '$inicio_mes' and '$fim_mes'
        ORDER BY tf.data_conclusao desc;";
      $heroe = $this->db->query($sql);
      if($heroe!=null){
        return $heroe->result();
      } else {
        return null;
      }
    }

    public function listar_tarefas($id_class, $level){
      if($id_class == 'Cientista' && $level >=2){
        $sql = "SELECT id,name_task,xp FROM task
        where name_task != 'Eliminar Zumbi'
        AND name_task != 'Tempo de missão diaria;'";
        $heroe = $this->db->query($sql);
      } else {
        $sql = "SELECT id,name_task,xp FROM task
        where name_task != 'Eliminar Zumbi'
        AND name_task != 'Documentação de Soluções'
        AND name_task != 'SLA Semanal';";
        $heroe = $this->db->query($sql);
      }
      if($heroe!=null){
        return $heroe->result();
      } else {
        return null;
      }
    }

    public function add_tarefas($dados, $id_class, $level){
      $idtask = $dados['task'];
      $playerid = $dados['playerid'];
      $xp = $dados['xp'];
      $quantidade = $dados['quantidade'];
      $nchamado = $dados['nchamado'];
      $descricao = $dados['descricao'];
      $data = (string)$dados['data'];
      if($id_class == 'Cientista' && $idtask == 9 && $level >= 1){
        $xp_classe = $xp+$xp;
        $sql = "Insert into task_feita values (null,$idtask,'$data', $playerid, $xp_classe, $quantidade, $nchamado, null, '$descricao');";
        $this->db->query($sql);
        $msg = 'Cadastrado';
        return $msg;
      } if ($id_class == 'Cientista' && $idtask == 21 && $level >=2 ) {
        $xp_classe = $xp+$xp;
        $sql = "Insert into task_feita values (null,$idtask,'$data', $playerid, $xp_classe, $quantidade, $nchamado, null, '$descricao');";
        $this->db->query($sql);
        $msg = 'Cadastrado';
        return $msg;
      } if ($id_class == 'Batedor' && $idtask == 14 && $level >=1) {
        $xp_classe = $xp+$xp;
        $sql = "Insert into task_feita values (null,$idtask,'$data', $playerid, $xp_classe, $quantidade, $nchamado, null, '$descricao');";
        $this->db->query($sql);
        $msg = 'Cadastrado';
        print_r($xp_classe);
        return $msg;
      } if ($id_class == 'Batedor' && $idtask == 13 && $level >=2) {
        $xp_classe = $xp+$xp;
        $sql = "Insert into task_feita values (null,$idtask,'$data', $playerid, $xp_classe, $quantidade, $nchamado, null, '$descricao');";
        $this->db->query($sql);
        $msg = 'Cadastrado';
        return $msg;
      } if ($id_class == 'Engenheiro' && $idtask == 8 && $level >=1 ) {
        $xp_classe = $xp+50;
        $sql = "Insert into task_feita values (null,$idtask,'$data', $playerid, $xp_classe, $quantidade, $nchamado, null, '$descricao');";
        $this->db->query($sql);
        $msg = 'Cadastrado';
        return $msg;
      } 
      else {
        $sql = "Insert into task_feita values (null,$idtask,'$data', $playerid, $xp, $quantidade, $nchamado, null, '$descricao');";
        $this->db->query($sql);
        $msg = 'Cadastrado';
        return $msg;
      }
    }

    public function pegar_xp($dados){
      $idtask = $dados['task'];
      $xpTask_query = "Select t.xp From task t where t.id = $idtask;";
      $xpConvert = $this->db->query($xpTask_query);
      $xp = $xpConvert->row_array();

      $xptask = implode(",", $xp);

      return $xptask;
    }

    public function somar_xp($id_player, $zumbis, $inicio_mes, $fim_mes, $itens_comprados){
      //Pegar XP das Tarefas
      $xpSoma = "SELECT if(isnull(SUM(xp_total)),0,SUM(xp_total)) FROM task_feita tf
      Inner Join players p on tf.player_id = p.id
      where p.id = $id_player
      and tf.data_conclusao between '$inicio_mes' and '$fim_mes';";

      $xpConquista = "SELECT if(isnull(SUM(cf.xp_total)),0,SUM(cf.xp_total)) FROM winoworld.conquistas_feitas cf
      INNER JOIN winoworld.conquistas c on cf.conquista_id = c.id
      INNER JOIN winoworld.players j on cf.jogador_id = j.id
      where cf.data between '$inicio_mes' and '$fim_mes'
      and jogador_id = $id_player;";

      $xpConvert = $this->db->query($xpSoma);
      $xp = $xpConvert->row_array();
      $xpTotal = implode(",", $xp);

      $xpConvertConquista = $this->db->query($xpConquista);
      $xpCon = $xpConvertConquista->row_array();
      $xpConTotal = implode(",", $xpCon);


      $xp_tasks_zombies = $xpTotal + $zumbis + $xpConTotal;
      if($itens_comprados == null){
        $itens_comprados = 0;
      } else {
        $itens_comprados = $itens_comprados;
      }
      $xp_final = $xp_tasks_zombies + $itens_comprados;
      $sql = "Update players SET xp_atual = $xp_final WHERE id= $id_player";
      $query_soma = $this->db->query($sql);
      
      if($xpConvert!=null){
        return $xpConvert->result();
      } else {
        return null;
      }
    }

    public function quantidade_chamado($id_glpi,$id_player,$vida,$zumbis_historico, $inicio_mes, $fim_mes){
      $glpi = $this->load->database('glpi', TRUE);
      $sql = "SELECT count(*) FROM winover_chamados.glpi_tickets t
      Inner Join winover_chamados.glpi_users u on t.users_id_lastupdater = u.id
      Inner Join winover_chamados.glpi_itilcategories i on t.itilcategories_id = i.id 
      where date between '$inicio_mes' and '$fim_mes' AND u.id = $id_glpi;";
      $zombies = $glpi->query($sql);
      $zv = $zombies->row_array();
      $zombies_total = implode(",", $zv);
      if($zombies!=null){
        if($vida == 1 || $vida == 2){
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
      $sql2 = "Update players set zumbis_mortos = $zombies_total where id = $id_player;";
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

    public function somar_sla($id_glpi, $id_player, $hp, $inicio_mes, $fim_mes){
      $glpi = $this->load->database('glpi', TRUE);
      $sql = "SELECT SEC_TO_TIME(AVG(t.solve_delay_stat)) FROM winover_chamados.glpi_tickets t
      Inner Join winover_chamados.glpi_users u on t.users_id_lastupdater = u.id
      Inner Join winover_chamados.glpi_itilcategories i on t.itilcategories_id = i.id 
      where date between '$inicio_mes' and '$fim_mes' AND u.id = $id_glpi;";
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

    public function sem_categoria($id_glpi, $inicio_mes, $fim_mes){
      $glpi = $this->load->database('glpi', TRUE);
      $sql = "SELECT COUNT(*) FROM winover_chamados.glpi_tickets 
      where date between '$inicio_mes' and '$fim_mes' 
      and users_id_lastupdater = $id_glpi
      and itilcategories_id = 0;";
      $total_query = $glpi->query($sql);
      $total_array = $total_query->row_array();
      $total_sem_categoria = implode(",", $total_array);
      return $total_sem_categoria;
    }

    public function calcular_vida_semcat($id_player, $total_sem_categoria,$hp,$vida, $id_class, $level){ 
      //Pegando resultado da aux e aramazenando em variavel
      $sql_select_aux = "Select log_zumbis from zumbis_aux where id_player = $id_player;";
      $query_select_aux = $this->db->query($sql_select_aux);
      $aux_log_zumbis = $query_select_aux->row_array();
      $log_zumbis = implode(",", $aux_log_zumbis);

      if($log_zumbis  != $total_sem_categoria){

        //Armazenando AUX de Zumbis mortos
        $sql_aux = "Update zumbis_aux SET log_zumbis = $total_sem_categoria WHERE id= $id_player;";
        $query_aux = $this->db->query($sql_aux);


        //Subtraindo quantidade de Zumbis mortos anteriormente, com o atual.
        $total_atual = $total_sem_categoria - $log_zumbis;


        //Calculo perda de vida
        if($id_class == 3 && $level >= 2){
          $dano_total = $total_atual * 3;
          $vida_perdida = $hp - $dano_total;

          if($vida_perdida < 0 ){
            $vida_perdida = 0;
            $sql_update_vida = "Update players SET hp = '$vida_perdida' WHERE id= $id_player;";
        } else {
            $sql_update_vida = "Update players SET hp = '$vida_perdida' WHERE id= $id_player;";
            $query_vida = $this->db->query($sql_update_vida);
         }
        } else {
        $dano_total = $total_atual * 6;
        $vida_perdida = $hp - $dano_total;
        } if($vida_perdida < 0 ){
          $vida_perdida = 0;
          $sql_update_vida = "Update players SET hp = '$vida_perdida' WHERE id= $id_player;";
          $query_vida = $this->db->query($sql_update_vida);
        }else{
          $sql_update_vida = "Update players SET hp = '$vida_perdida' WHERE id= $id_player;";
          $query_vida = $this->db->query($sql_update_vida);
        }

      }

    }

    public function verificar_level($id_player,$level_id,$total_xp,$class, $hp_total, $hp){
      if($level_id == 0 && $total_xp>=3000){
        $vida = $hp_total + 10;

        $sql_update_vida = "UPDATE players set hp = $vida where id = $id_player";
        $query_update = $this->db->query($sql_update_vida);

        $sql_update_vida_total = "UPDATE players set hp_total = $vida where id = $id_player";
        $query_update_vida = $this->db->query($sql_update_vida_total);

        $sql_update_level = "UPDATE players set level_id = 2 where id = $id_player";
        $query_update = $this->db->query($sql_update_level);

        $sql_update_liberado = "UPDATE players set liberado = 1 where id = $id_player";
        $query_update = $this->db->query($sql_update_liberado);

        $msg = "<script>alert('Você subiu para o nivel 1, escolha sua classe.')</script>";
        return $msg;
      }
      if($level_id == 1 && $total_xp>=7000){
        $vida = $hp_total + 10;

        $sql_update_vida = "UPDATE players set hp = $vida where id = $id_player";
        $query_update = $this->db->query($sql_update_vida);

        $sql_update_level = "UPDATE players set level_id = 3 where id = $id_player";
        $query_update = $this->db->query($sql_update_level);

        $msg = "<script>alert('Você subiu para o nivel 2')</script>";
        return $msg;
      }
      if($level_id == 2 && $total_xp>=15000){
        $vida = $hp_total + 10;

        $sql_update_vida = "UPDATE players set hp = $vida where id = $id_player";
        $query_update = $this->db->query($sql_update_vida);

        $sql_update_level = "UPDATE players set level_id = 4 where id = $id_player";
        $query_update = $this->db->query($sql_update_level);

        $msg = "<script>alert('Você subiu para o nivel 3')</script>";
        return $msg;
      }
    }

    public function verificar_vida($id_player){
      $sql_verificar_vida = "select hp from players p where id = $id_player;";
      $status_vida = $this->db->query($sql_verificar_vida);
      
      $qtd_mortes = $status_vida->row_array();
      $status_hp = implode(",", $qtd_mortes);
      return $status_hp;


    }

    public function verificar_chance($id_player){

      //Verificando Chance
      $sql_verificar_chance = "Select chance from players where id = $id_player and chance != 0;";
      $status_chance = $this->db->query($sql_verificar_chance);
      if($status_chance->num_rows() != 0){
        $qtd_chance_array = $status_chance->row_array();
        $chance = implode(",", $qtd_chance_array);
        return $chance;
      }else{
        return $chance = 0;
      }
      
      
    }

    public function atualiza_chance($id_player, $status_hp, $chance){
      if($status_hp == 0 && $chance == 0){
          $sql_update_chance = "Update players set chance = 1 where id = $id_player;";
          $update_chance = $this->db->query($sql_update_chance);
          $sql_captura_chance = "Select chance from players where id = $id_player";
          $query_captura_chance = $this->db->query($sql_captura_chance);
          $array_captura_chance = $query_captura_chance->row_array();
          $chance_atual = implode(",", $array_captura_chance);
          return $chance_atual;
      } else
      if($status_hp <= 0 && $chance == 1) {
          $sql_update_chance = "Update players set chance = 2 where id = $id_player;";
          $update_chance = $this->db->query($sql_update_chance);
          $sql_captura_chance = "Select chance from players where id = $id_player";
          $query_captura_chance = $this->db->query($sql_captura_chance);
          $array_captura_chance = $query_captura_chance->row_array();
          $chance_atual = implode(",", $array_captura_chance);
    
          return $chance_atual;
      } 
      }

    public function registro_vida($id, $class_id, $name, $level_id, $xp_atual, $zumbis_mortos, $tma, $sem_categoria){
      $sql_log_vida = "INSERT INTO log_jogadores VALUES (null,'$name', $xp_atual, $level_id, '$class_id', NOW(), '$tma', $zumbis_mortos, $sem_categoria);";
      $registrando_morte = $this->db->query($sql_log_vida);
    }

    public function matar_personagem($id_player){
      $sql_matando =  "Update players set class_id = 1 where id = $id_player;"; 
      $sql_matando1 = "Update players set hp = 50 where id = $id_player; ";
      $sql_matando3 = "Update players set xp_atual = 0 where id = $id_player;";
      $sql_matando4 = "Update players set liberado = 0 where id = $id_player;";
      $sql_matando5 ="Update task_feita set id_player_log = $id_player, player_id = 0 Where player_id = $id_player";
      $sql_matando6 = "Update players set xp = 0 where id = $id_player;";

      $this->db->query($sql_matando);
      $this->db->query($sql_matando1);
      $this->db->query($sql_matando3);
      $this->db->query($sql_matando4);
      $this->db->query($sql_matando5);
      $this->db->query($sql_matando6);

    }
   
    public function somar_xp_geral($id_player, $id_glpi){
      $sql_listar_interno = "SELECT if(isnull(SUM(xp_total)),0,SUM(xp_total)) FROM task_feita tf
      Inner Join players p on tf.player_id = p.id
      where p.id = $id_player
      and tf.data_conclusao between '2019-03-01 00:00:00' and '2019-12-31 23:59:59';";
      $interno_query = $this->db->query($sql_listar_interno);
      $interno_array = $interno_query->row_array();
      $interno_total = implode(",", $interno_array);

      $glpi = $this->load->database('glpi', TRUE);
      $sql_listar_chamados = "SELECT count(*) FROM winover_chamados.glpi_tickets t
      Inner Join winover_chamados.glpi_users u on t.users_id_lastupdater = u.id
      Inner Join winover_chamados.glpi_itilcategories i on t.itilcategories_id = i.id 
      where date between '2019-03-01 00:00:00' and '2019-12-31 23:59:59' AND u.id = $id_glpi;";
      $chamados_query = $glpi->query($sql_listar_chamados);
      $chamados_array = $chamados_query->row_array();
      $chamados_total = implode(",", $chamados_array);

      $xpConquista = "SELECT if(isnull(SUM(cf.xp_total)),0,SUM(cf.xp_total)) FROM winoworld.conquistas_feitas cf
      INNER JOIN winoworld.conquistas c on cf.conquista_id = c.id
      INNER JOIN winoworld.players j on cf.jogador_id = j.id
      where jogador_id = $id_player;";
      $xpConvertConquista = $this->db->query($xpConquista);
      $xpCon = $xpConvertConquista->row_array();
      $xpConTotal = implode(",", $xpCon);

      $total_xp = $interno_total + $chamados_total + $xpConTotal;

      $sql_insert = "Update players set xp = $total_xp where id = $id_player";
      $interno_query = $this->db->query($sql_insert);

    }

    
}