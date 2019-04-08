<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Regras extends CI_Controller {
    public function __construct()
    {
        parent::__construct();
    	$this->load->model('Regras_Model','tarefas');
    }

	public function index()
	{
		$dados['tarefas'] = $this->tarefas->buscar_tarefas();
		$this->load->view('telas/regras.php', $dados);
	}
}