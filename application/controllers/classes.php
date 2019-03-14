<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Classes extends CI_Controller {
    public function __construct()
    {
        parent::__construct();
        $this->load->model('Classes_Model','classes');
        $this->load->model('Classes_Model','classes_hab');
    }

	public function index()
	{
        $dados['classes'] = $this->ranking->pegar_classes();
        $dados['classes'] = $this->ranking->pegar_habilidades($dados['classes']['id']);
        

		$this->load->view('telas/classes.php', $dados);
	}
}