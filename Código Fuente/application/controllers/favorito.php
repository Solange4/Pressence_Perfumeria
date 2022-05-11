<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Favorito extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->model('Favorito_model');
			
	}
	public function autorizar()
	{
		if (!$this->session->userdata('logged_in')) 
		{
			$this->session->set_flashdata('msg', "Acceso no autorizado.");
			redirect(base_url('login_register/iniciar_sesion'));
		}
	}
	public function mostrar_favs()
	{
		$this->autorizar();
		$data['favoritos']=$this->Favorito_model->get_favs($this->session->userdata('id'));
		$this->load->view('templates/header');
		$this->load->view('favorito/favorito', $data);
		$this->load->view('templates/footer');
	}


	public function ingresar($id)
	{
		$this->autorizar();
		$data = array('id_persona_cliente' => $this->session->userdata('id'),
						'id_perfume' => $id);

		$this->Favorito_model->insert($data);
		redirect(base_url('perfume/perfume_producto/'.$id));
	}


	public function eliminar($id)
	{
		$this->autorizar();
		$data = array('id_persona_cliente' => $this->session->userdata('id'),
						'id_perfume' => $id);
		$this->Favorito_model->delete($data);
		redirect(base_url('perfume/perfume_producto/'.$id));
	}
}

/* End of file favoritos.php */
/* Location: ./application/controllers/favoritos.php */