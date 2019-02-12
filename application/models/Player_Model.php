<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Player_Model extends CI_Model
{
    public function __construct()
    {
      parent::__construct();
    }

    public function listar_player($login){
      $sql = "Select p.name,p.hp,p.level,c.class_name,u.username,p.avatar,p.xp,p.patent From players p 
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



    public function listar_conquistas($login){
      $sql = "Select c.nome_con, c.xp, c.descricao From conquistas c 
      Inner Join players p on c.player_id = p.id
      Inner Join users u on p.users_id = u.id
      where u.username = '$login'";
      $heroe = $this->db->query($sql);
      $resultado = $heroe->row_array();
      if($resultado!=null){
        return $resultado;
      } else {
        return null;
      }
    }
}