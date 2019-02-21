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
      $class_id = $_POST['id_class'];
      echo $class_id;
      $sql = "SELECT c.id, c.class_name,h.nome, h.desc, h.efeito FROM class c
      Inner Join habilidades_kit hk on c.id_habilidade = hk.id
      Inner Join habilidades h on hk.hab1 = h.id 
      or hk.hab2 = h.id 
      or hk.hab3 = h.id
      where c.id = $class_id;";
      $heroe = $this->db->query($sql);
      
      return $heroe->result();
    }
}