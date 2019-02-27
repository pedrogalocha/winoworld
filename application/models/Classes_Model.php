<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Classes_Model extends CI_Model
{
    public function __construct()
    {
      parent::__construct();
    }

    
    public function pegar_classes(){
      $sql = "SELECT c.id, c.class_name, c.descricao, c.avatar  FROM class c where id != 1;";
      $heroe = $this->db->query($sql);
      
      return $heroe->result();
    }

    public function pegar_habilidades($class_id){

      $sql = "SELECT h.id,c.id, c.class_name,h.nome, h.desc, h.efeito FROM class c
      Inner Join habilidades_kit hk on c.id_habilidade = hk.id
      Inner Join habilidades h on hk.hab1 = h.id 
      or hk.hab2 = h.id 
      or hk.hab3 = h.id
      or hk.hab4 = h.id 
      or hk.hab5 = h.id
      where c.id = $class_id;";
      $heroe = $this->db->query($sql);
      $class = $heroe->result();
      echo json_encode($class, JSON_UNESCAPED_UNICODE);

    }

    public function atualizar_classe($id_player, $id_class, $id_level, $liberado){

      $sql_update_classe = "UPDATE players set class_id = $id_class where id = $id_player;";
      $query_update_classe = $this->db->query($sql_update_classe);

      $sql_update_liberado = "UPDATE players set liberado = 0 where id = $id_player;";
      $query_update_liberado = $this->db->query($sql_update_liberado);


      if($id_class == 2 && $id_level == 1){
        $vida = 80;

        $sql_update_vida_total = "UPDATE players set hp_total = $vida where id = $id_player;";
        $query_update_total = $this->db->query($sql_update_vida_total);

        $sql_update_vida = "UPDATE players set hp = $vida where id = $id_player";
        $query_update = $this->db->query($sql_update_vida);
      }

      $msg = "<script>alert('Classe escolhida com sucesso!')<script>";

      return $query_update;
    }
}