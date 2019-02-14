<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class player extends CI_Controller {

  public function __construct()
  {
    parent::__construct();
    $this->load->model('Login_Model','permissao');
    $this->load->model('Player_Model','playerInfo');
    $this->load->model('Player_Model','conquistas');
    $this->load->model('Player_Model','tarefas');
  }

  public function index()
	{
    $login = $this->session->userdata('nome');
    $dados['pemissao'] = $this->permissao->getPermissao($login);
    $dados['playerInfo'] = $this->playerInfo->listar_player($login);
    $dados['conquistas'] = $this->conquistas->listar_conquistas($dados['playerInfo']['id']);
    $dados['tarefas'] = $this->conquistas->listar_tarefas($dados['playerInfo']['id']);

    if($dados['pemissao'] != "Jogador"){
      echo "<script> 
              alert('Você não tem permissão para acessar esta area'); window.location.href = 'Login';
            </script>";
    }else{
      $this->load->view('restrito/player.php', $dados);
    }
  }
}