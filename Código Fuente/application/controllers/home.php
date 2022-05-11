<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends CI_Controller {
	public function __construct()
	{
		parent::__construct();
		$this->load->model('Reporte_producto_model');
		$this->load->model('Opinion_model');
		$this->load->model('Perfume_model');
	}


	public function mostrar()
	{

		$data['productos_recientes'] = $this->Reporte_producto_model->productos_recientes();
		$data['producto_mes'] = $this->Reporte_producto_model->producto_mes();
		$this->load->view('templates/header.php');
		$this->load->view('index/index.php', $data);
		$this->load->view('templates/footer.php');
	}



	

}

/* End of file home.php */
/* Location: ./application/controllers/home.php */