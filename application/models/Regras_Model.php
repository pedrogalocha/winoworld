<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Regras_Model extends CI_Model
{

    public function buscar_tarefas(){
        $sql_regras = "SELECT * FROM winoworld.task;";
        $query_regras= $this->db->query($sql_regras);
        if($query_regras!=null){
            return $query_regras->result();
          } else {
            return null;
          }
    }


}