<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class mercado extends CI_Controller {
    public function __construct()
    {
        parent::__construct();
        $this->load->model('Mercado_Model','xp_item');
        $this->load->model('Mercado_Model','compra_efetuada');
        $this->load->model('Mercado_Model','recuperar_vida');
    }

	public function index()
	{

    }
    
    public function comprar_item(){
     
    $dados_form = $this->input->post();

    date_default_timezone_set('America/Sao_Paulo');
    $datatime1 = new DateTime();

    $data1  = $datatime1->format('Y-m-d H:i:s');
    $dados_form = $this->input->post();
    $dados_insert['item_id'] = $dados_form['name_item'];
    $dados_insert['playerid'] = $dados_form['playerid'];
    $dados_insert['xp_atual'] = $dados_form['xp_atual'];
    $hp = $dados_form['hp'];
    
    $dados_item['item'] = $this->xp_item->pegar_dados($dados_insert['item_id']);

    if($dados_insert['xp_atual'] < abs($dados_item['item']['custo_xp'])){
        echo "<script> 
        alert('Você não pode comprar mais nada!'); window.location.href = 'Jogador';
      </script>";
        //redirect(base_url('Jogador'));
    } else {
        if($dados_item['item']['nome_item'] == 'Bandagem'){
            $recuperar_vida = $this->recuperar_vida->item_vida_bandagem($hp, $dados_insert['playerid']);
            $compra_efetuada = $this->compra_efetuada->comprar_item($dados_insert['playerid'], $dados_insert['item_id'],$dados_item['item']['custo_xp'], $data1);
            print_r($compra_efetuada);
            if($compra_efetuada == "Compra Efetuada"){
                echo "<script> 
                alert('Recuperado 20 de vida!'); window.location.href = 'Jogador';
              </script>";
              }else{
                echo "<script> 
                alert('Houve um erro ao tentar cadastar.'); window.location.href = 'Jogador';
              </script>";
              } 
        }
    }
    
    }

}