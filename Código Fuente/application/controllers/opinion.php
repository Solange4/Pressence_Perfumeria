<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Opinion extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->model('Opinion_model');
		$this->load->model('Perfume_model');
		$this->load->library('form_validation');
		//Do your magic here
	}
	public function autorizar()
	{
		if (!$this->session->userdata('logged_in')) 
		{
			$this->session->set_flashdata('msg', "Acceso no autorizado.");
			redirect(base_url('login_register/iniciar_sesion'));
		}
	}

	public function crear()
	{
		$this->autorizar();
		$data['perfumes'] = $this->Perfume_model->getDataPerfume()->result();
		$this->load->view('templates/header');
		$this->load->view('opinion/ingresar',$data);
		$this->load->view('templates/footer');
	}

	public function guardar($id_perfume)
	{
		$this->autorizar();
		$data = array(#'id' => $this->input->post('id'),
					'id_persona_cliente' => $this->session->userdata('id'),
					'id_perfume' => $id_perfume,
					'puntuacion'=> $this->input->post('puntuacion'),
					'opinion'=> $this->input->post('opinion'));

		if ($this->Opinion_model->is_opinion($this->session->userdata('id'), $id_perfume)) {
			$this->Opinion_model->update_opinion($data);
		}
		else {
			$this->Opinion_model->insert_opinion($data);
		}
		redirect(base_url('perfume/perfume_producto/'.$id_perfume));
	}



}

/* End of file opinion.php */
/* Location: ./application/controllers/opinion.php */