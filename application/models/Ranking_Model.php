<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Ranking_Model extends CI_Model
{

    public function ranking_mes(){
        $sql_ranking = "SELECT p.name, p.hp, l.level, c.class_name, p.xp,p.xp_atual, p.tma, p.zumbis_mortos, p.chance FROM players p
                        INNER JOIN level l on p.level_id = l.id
                        INNER JOIN class c on p.class_id = c.id
                        ORDER BY xp_atual desc;";
        $query_ranking = $this->db->query($sql_ranking);
        if($query_ranking!=null){
            return $query_ranking->result();
          } else {
            return null;
          }
    }


}