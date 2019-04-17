<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Mercado_Model extends CI_Model
{
    public function listar_itens(){
        $sql_itens = "Select * from itens;";
        $query_itens = $this->db->query($sql_itens);
        if($query_itens != null){
            return $query_itens->result();
        }
            return null;
    }

    public function pegar_dados($id_item){
        $sql_xp_item = "SELECT * FROM itens where id = $id_item;";
        $query_item = $this->db->query($sql_xp_item);
        if($query_item!=null){
            return $query_item->row_array();
          } else {
            return null;
          }
    }

    public function comprar_item($id_player, $id_item, $xp_gasto, $data){
        $sql_compra_item = "INSERT into itens_comprados values (null, $id_item, '$data', $id_player, $xp_gasto, null);";
        $query_compra = $this->db->query($sql_compra_item);
        if($query_compra!=null){
            $msg = print_r('Compra Efetuada');
            return $msg;
          } else {
            return null;
          }
    }

    public function item_vida_bandagem($hp, $id){
        $hp = $hp + 20;
        $sql_bandagem = "UPDATE players set hp = $hp where id = $id;";
        $query_bandagem = $this->db->query($sql_bandagem);
        if($query_bandagem!=null){
           $msg = print_r('Vida Recuperada');
           return $msg;
        } else {
            return null;
        }
    }

    public function listar_itens_comprados($id_player, $inicio_mes, $fim_mes){
        $sql_itens_comprados = "Select SUM(ic.xp_gasto) from itens_comprados ic
        INNER JOIN itens i on ic.id_item = i.id 
        where ic.player_id = $id_player
        AND data_compra between '$inicio_mes' and '$fim_mes';";
        $query_itens_comprados = $this->db->query($sql_itens_comprados);
        $array_itens_comprados = $query_itens_comprados->row_array();
        if(empty($query_itens_comprados->result())){
            $xp_gasto_itens = 0;
            return $xp_gasto_itens;
         } else {
            $xp_gasto_itens = implode(",", $array_itens_comprados);
            return $xp_gasto_itens;
         }
    }
}