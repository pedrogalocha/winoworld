<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Login_Model extends CI_Model
{
    public function __construct()
    {
      parent::__construct();
    }

    public function getPermissao($login){
      $this->db->where('username', $login);
      $query = $this->db->get('users', 1);
      if($query->num_rows() == 1){
        $row = $query->row();
        return $row->adm;
      }
    }

    public function verifica($login = '', $senha = ''){
      if( !$login && !$senha){
        return false;
      } else {
        $this->db->where(array('username'=>$login, 'password'=>$senha));
        $res = $this->db->get('users');

        if ($res-> num_rows() == 1){
          return true;
        }else{
          return false;
        }
      }
    }


}
