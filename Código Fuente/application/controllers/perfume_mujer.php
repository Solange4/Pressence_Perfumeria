<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Perfume_mujer extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->model('Perfume_women_model');
		
	}
	public function mostrar_todo()
	{

		$data['perfumes'] = $this->Perfume_women_model->get_perfume_mujer();
		// imprime los datos de la consulta: print_r($data);
		$this->load->view('templates/header.php');
		$this->load->view('perfume_mujer/all_products_mostrar', $data);
		$this->load->view('templates/footer.php');

	}
	public function mostrar_agua_perfume()
	{

		$data['agua_perfumes'] = $this->Perfume_women_model->get_agua_perfume_mujer();
		// imprime los datos de la consulta: print_r($data);
		$this->load->view('templates/header.php');
		$this->load->view('perfume_mujer/agua_perfume_mostrar', $data);
		$this->load->view('templates/footer.php');

	}
	public function mostrar_agua_banio()
	{

		$data['agua_banios'] = $this->Perfume_women_model->get_agua_banio_mujer();
		// imprime los datos de la consulta: print_r($data);
		$this->load->view('templates/header.php');
		$this->load->view('perfume_mujer/agua_banio_mostrar', $data);
		$this->load->view('templates/footer.php');

	}
	public function mostrar_agua_colonia()
	{

		$data['agua_colonias'] = $this->Perfume_women_model->get_agua_colonia_mujer();
		// imprime los datos de la consulta: print_r($data);
		$this->load->view('templates/header.php');
		$this->load->view('perfume_mujer/agua_colonia_mostrar', $data);
		$this->load->view('templates/footer.php');

	}
	public function mostrar_splash()
	{

		$data['splashs'] = $this->Perfume_women_model->get_splash_perfume_mujer();
		// imprime los datos de la consulta: print_r($data);
		$this->load->view('templates/header.php');
		$this->load->view('perfume_mujer/splash_mostrar', $data);
		$this->load->view('templates/footer.php');

	}


}

/* End of file perfume_mujer.php */
/* Location: ./application/controllers/perfume_mujer.php */