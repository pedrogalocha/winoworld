<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Classes_Model extends CI_Model
{
    public function __construct()
    {
      parent::__construct();
    }

    
    public function pegar_classes(){
      $sql = "SELECT c.id, c.class_name,h.nome nome_habilidade, h.descricao desc_habilidade FROM classe_habilidade ch
      Inner Join class c on ch.id_classe = c.id
      Inner Join habilidades h on ch.id_habilidade = h.id ;";
      $heroe = $this->db->query($sql);
      if($resultado!=null){
        return $heroe->result();
      } else {
        return null;
      }
    }
}