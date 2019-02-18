<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class player extends CI_Controller {

  public function __construct()
  {
    parent::__construct();
    $this->load->model('Login_Model','permissao');
    $this->load->model('Player_Model','playerInfo');
    $this->load->model('Player_Model','conquistas');
    $this->load->model('Player_Model','tarefas');
    $this->load->model('Player_Model','tasks');
    $this->load->model('Player_Model','xpTotal');
    $this->load->model('Player_Model','zumbis');
    $this->load->model('Player_Model','missoes_concluidas');
    $this->load->model('Player_Model','atualizando_zumbis_banco');
    $this->load->model('Player_Model','soma_sla');
    $this->load->model('Player_Model','sla_correto');
  }

  public function index()
	{
    $login = $this->session->userdata('nome');
    $dados['pemissao'] = $this->permissao->getPermissao($login);
    $dados['playerInfo'] = $this->playerInfo->listar_player($login);
    $dados['conquistas'] = $this->conquistas->listar_conquistas($dados['playerInfo']['id']);
    $dados['tarefas'] = $this->tarefas->listar_tarefas_feitas($dados['playerInfo']['id']);
    $dados['tasks'] = $this->tasks->listar_tarefas();
    $dados['xpTotal'] = $this->xpTotal->somar_xp($dados['playerInfo']['id']);
    $dados['zumbis'] = $this->zumbis->quantidade_chamado($dados['playerInfo']['glpi_id'],$dados['playerInfo']['id']);
    $dados['missoes_concluidas'] = $this->missoes_concluidas->missoes_concluidas($dados['playerInfo']['id']);
    $dados['atualizando_zumbis_banco'] = $this->atualizando_zumbis_banco->atualizando_banco($dados['zumbis'],$dados['playerInfo']['id']);
    $dados['soma_sla'] = $this->soma_sla->somar_sla($dados['playerInfo']['glpi_id']);

    if($dados['pemissao'] != "Jogador"){
      echo "<script> 
              alert('Você não tem permissão para acessar esta area'); window.location.href = 'Login';
            </script>";
    }else{
      $this->load->view('restrito/player.php', $dados);
    }
  }

  public function cadastrar_acionamento(){

    date_default_timezone_set('America/Sao_Paulo');
    $datatime1 = new DateTime();

    $data1  = $datatime1->format('Y-m-d H:i:s');

    $dados_form = $this->input->post();
    $dados_insert['task'] = $dados_form['name_task'];
    $dados_insert['playerid'] = $dados_form['playerid'];
    $dados_insert['quantidade'] = $dados_form['quantidade'];
    if($dados_form['nchamado'] <=0){
     $dados_insert['nchamado'] = 0;
    }else{
      $dados_insert['nchamado'] = $dados_form['nchamado'];
    }
    $dados_insert['data'] = $data1;
    
    $xp_task = $this->tarefas->pegar_xp($dados_insert);

    $dados_insert['xp'] = $xp_task*$dados_insert['quantidade'];
    
    $prints = $this->tarefas->add_tarefas($dados_insert);
    
    if($prints == "Cadastrado"){
      echo "<script> 
      alert('Cadastro efetuado com sucesso.');
    </script>";
    redirect(base_url('Jogador'));
    }else{
      echo "<script> 
      alert('Houve um erro ao tentar cadastar.'); window.location.href = 'Jogador';
    </script>";
    }
    
  }

}