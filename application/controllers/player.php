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
    $this->load->model('Player_Model','validar_xp');
    $this->load->model('Classes_Model','pegar_classes');
    $this->load->model('Classes_Model','pegar_habilidade');
    $this->load->model('Player_Model','sem_categoria');
    $this->load->model('Player_Model','perde_vida_sem_categoria');
    $this->load->model('Player_Model','verifica_vida');
    $this->load->model('Player_Model','registra_morte');
    $this->load->model('Player_Model','nova_vida');
    $this->load->model('Player_Model','matar_personagem');
    $this->load->model('Player_Model','listar_historico');
  }

  public function index()
	{
    $login = $this->session->userdata('nome');
    $dados['pemissao'] = $this->permissao->getPermissao($login);
    $dados['playerInfo'] = $this->playerInfo->listar_player($login);
    $dados['sem_categoria'] = $this->sem_categoria->sem_categoria($dados['playerInfo']['glpi_id'],$dados['playerInfo']['id']);
    $dados['verifica_vida'] = $this->verifica_vida->veriricar_vivo($dados['playerInfo']['id']);
    $dados['playerHistorico'] = $this->playerInfo->listar_historico($dados['playerInfo']['name'], $dados['verifica_vida']);
    $dados['conquistas'] = $this->conquistas->listar_conquistas($dados['playerInfo']['id']);
    $dados['tarefas'] = $this->tarefas->listar_tarefas_feitas($dados['playerInfo']['id']);
    $dados['tasks'] = $this->tasks->listar_tarefas();
    $dados['zumbis'] = $this->zumbis->quantidade_chamado($dados['playerInfo']['glpi_id'],$dados['playerInfo']['id'], $dados['verifica_vida'], $dados['playerHistorico']['zumbis_mortos']);
    $dados['xpTotal'] = $this->xpTotal->somar_xp($dados['playerInfo']['id'], $dados['zumbis']);
    $dados['missoes_concluidas'] = $this->missoes_concluidas->missoes_concluidas($dados['playerInfo']['id']);
    $dados['atualizando_zumbis_banco'] = $this->atualizando_zumbis_banco->atualizando_banco($dados['playerInfo']['id'],$dados['zumbis']);
    $dados['soma_sla'] = $this->soma_sla->somar_sla($dados['playerInfo']['glpi_id'],$dados['playerInfo']['id'], $dados['playerInfo']['hp']);
    $dados['pegar_classes'] = $this->pegar_classes->pegar_classes();
    $dados['perde_vida_sem_categoria'] = $this->perde_vida_sem_categoria->calcular_vida_semcat($dados['playerInfo']['id'],$dados['sem_categoria'], $dados['playerInfo']['hp'],$dados['verifica_vida'], $dados['playerHistorico']['sem_categoria']) ;
    

    if($dados['pemissao'] != "Jogador"){
      echo "<script> 
              alert('Você não tem permissão para acessar esta area'); window.location.href = 'Login';
            </script>";
    }else{
      if($dados['verifica_vida'] == 1 && $dados['playerInfo']['hp'] <= 0){
        $dados['nova_vida'] = $this->nova_vida->registro_vida($dados['playerInfo']['id'],$dados['playerInfo']['class_name'],$dados['playerInfo']['name'],$dados['playerInfo']['level'], $dados['playerInfo']['xp'],$dados['zumbis'],$dados['soma_sla'],$dados['sem_categoria']);

        echo "<script> 
          alert('Seu Personagem Morreu, você tem mais uma chance, com novo personagem. ');
        </script>";
        $this->load->view('restrito/player.php', $dados);
      } if($dados['verifica_vida'] == 2) {
        echo "<script> 
                alert('Você é um pessimo sobrevivente, morreu duas vezes em 2 encarnações? Bem tente jogar novamente mês que vem.');
              </script>";
      }else {
        $this->load->view('restrito/player.php', $dados);
      }
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

  public function carregar_habilidades($class_id){
    $dados['pegar_habilidades'] = $this->pegar_habilidade->pegar_habilidades($class_id);

    echo $dados['pegar_habilidades'][1]->desc;
  }

  public function atualizar_level($id_player,$xp_total, $liberado, $level_id){
      $dados['classes'] = $this->validar_xp->verificar_level($id_player,$level_up);

      if($xp_total>=1000 && $level=0 && $liberado=1){
        $level_id = 2;
        $dados['subir_level'] = $this->validar_xp->verificar_level($id_player,$level_up);
      }
  }
}