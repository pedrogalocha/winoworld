<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class adm extends CI_Controller {

  public function __construct(){
    parent::__construct();
    $this->load->model('Login_Model','permissao');
  }

  public function index()
	{
    $login = $this->session->userdata('nome');
    $dados['pemissao'] = $this->permissao->getPermissao($login);

    if($dados['pemissao'] != "Administrador"){
      echo "<script> 
              alert('Você não tem permissão para acessar esta area'); window.location.href = 'Login';
            </script>";
    }else{
      $this->load->view('restrito/area_adm.php');
    }
  }
}