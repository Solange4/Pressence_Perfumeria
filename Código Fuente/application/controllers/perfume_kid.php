<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Perfume_kid extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->model('Perfume_kid_model');
		
	}
	public function mostrar_todo()
	{

		$data['perfumes'] = $this->Perfume_kid_model->get_perfume_kid();
		$this->load->view('templates/header.php');
		$this->load->view('perfume_kid/all_products_mostrar', $data);
		$this->load->view('templates/footer.php');

	}
	public function mostrar_agua_perfume()
	{

		$data['agua_perfumes'] = $this->Perfume_kid_model->get_agua_perfume_kid();
		// imprime los datos de la consulta: print_r($data);
		$this->load->view('templates/header.php');
		$this->load->view('perfume_kid/agua_perfume_mostrar', $data);
		$this->load->view('templates/footer.php');

	}
	public function mostrar_agua_banio()
	{

		$data['agua_banios'] = $this->Perfume_kid_model->get_agua_banio_kid();
		// imprime los datos de la consulta: print_r($data);
		$this->load->view('templates/header.php');
		$this->load->view('perfume_kid/agua_banio_mostrar', $data);
		$this->load->view('templates/footer.php');

	}
	public function mostrar_agua_colonia()
	{

		$data['agua_colonias'] = $this->Perfume_kid_model->get_agua_colonia_kid();
		// imprime los datos de la consulta: print_r($data);
		$this->load->view('templates/header.php');
		$this->load->view('perfume_kid/agua_colonia_mostrar', $data);
		$this->load->view('templates/footer.php');

	}
	public function mostrar_splash()
	{

		$data['splashs'] = $this->Perfume_kid_model->get_splash_perfume_kid();
		// imprime los datos de la consulta: print_r($data);
		$this->load->view('templates/header.php');
		$this->load->view('perfume_kid/splash_mostrar', $data);
		$this->load->view('templates/footer.php');

	}



}

/* End of file perfume_kid.php */
/* Location: ./application/controllers/perfume_kid.php */