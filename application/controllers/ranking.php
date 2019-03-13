<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Ranking extends CI_Controller {
    public function __construct()
    {
        parent::__construct();
    	$this->load->model('Ranking_Model','ranking');
    }

	public function index()
	{
		$dados['ranking'] = $this->ranking->ranking_mes();
		$this->load->view('ranking/ranking.php', $dados);
	}
}