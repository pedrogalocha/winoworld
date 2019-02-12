<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Login extends CI_Controller {

	
	public function index()
	{
		$this->load->view('login/login_v');
	}

	
	public function logar(){

		//Carregar Helps para trabalhar com formularios
		$this ->load->helper('form');
		$this ->load->library('form_validation');

		// Recuperamos os dados digitados pelo usuário no formulário via POST
		$login = $this->input->post('login');
		$senha = $this->input->post('senha');

		if($login && $senha){

			//Carregar Model do Login
			$this->load->model('Login_Model');

			//Função que verifica a permisão do usuário
			$permissao = $this->Login_Model->getPermissao($login);

			//Função para verificar login e senha existe no BD	
			$verifica = $this->Login_Model->verifica($login, $senha);

				// Caso o usuario exista no BD
				if($verifica === true){

					//Faz todo processo de verificação
						if($permissao == "Administrador"){
							$this->session->set_userdata('nome', $login);
							$this->session->set_userdata('adm', 1);
							redirect(base_url('Administrativo'));
						} else if($permissao == "Jogador"){
							$this->session->set_userdata('nome', $login);
							$this->session->set_userdata('adm', 1);
							redirect(base_url('Jogador'));
						}

				}else{
					echo "<script> 
					alert('Você não tem permissão para acessar esta area'); window.location.href = '../login';
					</script>";
				}


		}

	}

	public function logout(){
		$this->session->unset_userdata("adm");
		$this->session->unset_userdata("jogador");
			 redirect(base_url('login'));
	}
}