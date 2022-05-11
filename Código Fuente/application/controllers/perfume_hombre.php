<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Perfume_hombre extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->model('Perfume_men_model');
		
	}
	public function mostrar_todo()
	{

		$data['perfumes'] = $this->Perfume_men_model->get_perfume_hombre();
		// imprime los datos de la consulta: print_r($data);
		$this->load->view('templates/header.php');
		$this->load->view('perfume_hombre/all_products_mostrar', $data);
		$this->load->view('templates/footer.php');

	}
	public function mostrar_agua_perfume()
	{

		$data['agua_perfumes'] = $this->Perfume_men_model->get_agua_perfume_hombre();
		// imprime los datos de la consulta: print_r($data);
		$this->load->view('templates/header.php');
		$this->load->view('perfume_hombre/agua_perfume_mostrar', $data);
		$this->load->view('templates/footer.php');

	}
	public function mostrar_agua_banio()
	{

		$data['agua_banios'] = $this->Perfume_men_model->get_agua_banio_hombre();
		// imprime los datos de la consulta: print_r($data);
		$this->load->view('templates/header.php');
		$this->load->view('perfume_hombre/agua_banio_mostrar', $data);
		$this->load->view('templates/footer.php');

	}
	public function mostrar_agua_colonia()
	{

		$data['agua_colonias'] = $this->Perfume_men_model->get_agua_colonia_hombre();
		// imprime los datos de la consulta: print_r($data);
		$this->load->view('templates/header.php');
		$this->load->view('perfume_hombre/agua_colonia_mostrar', $data);
		$this->load->view('templates/footer.php');

	}
	public function mostrar_splash()
	{

		$data['splashs'] = $this->Perfume_men_model->get_splash_perfume_hombre();
		// imprime los datos de la consulta: print_r($data);
		$this->load->view('templates/header.php');
		$this->load->view('perfume_hombre/splash_mostrar', $data);
		$this->load->view('templates/footer.php');

	}

}

/* End of file perfume_hombre.php */
/* Location: ./application/controllers/perfume_hombre.php */