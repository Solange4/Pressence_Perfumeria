<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Reportes extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->model('Reporte_producto_model');
		$this->load->model('Reporte_cliente_model');
		$this->load->model('Reporte_pedido_model');
	}


	public function administrar()
	{
		if (!$this->session->userdata('is_admin')) 
		{
			$this->session->set_flashdata('msg', "Intruso :c No tienes permiso :c");
			redirect(base_url('home/mostrar'));
		}
	}

	public function mostrar()
	{
		$this->administrar();
		$this->load->view('templates/header.php');
		$this->load->view('reportes/reporte_index');
		$this->load->view('templates/footer.php');
	}


	public function mostrar_reporte_producto()
	{
		$this->administrar();
		$data['producto_mes'] = $this->Reporte_producto_model->producto_mes();
		$data['productos1'] = $this->Reporte_producto_model->marca_producto_cantidad();
		$data['productos2'] = $this->Reporte_producto_model->categoria_producto_cantidad();
		$data['productos3'] = $this->Reporte_producto_model->tipo_producto_cantidad();
		$data['productos4'] = $this->Reporte_producto_model->producto_ultimas_dos_semanas();
		$data['productos5'] = $this->Reporte_producto_model->producto_barato();
		#print_r($data);
		$this->load->view('templates/header.php');
		$this->load->view('reportes/reporte_producto', $data);
		$this->load->view('templates/footer.php');
	}

	public function mostrar_reporte_cliente()
	{
		
		$this->administrar();
		$data['clientes1'] = $this->Reporte_cliente_model->cantidad_cliente();
		#print_r($data);
		//agregado total de pedidos por cliente
		$data['clientes'] = $this->Reporte_cliente_model->total_de_pedidos_por_cliente();
		//agregado cliente con mas pedidos
		$data['cliente'] = $this->Reporte_cliente_model->cliente_estrella();
		#print_r($data);
		$this->load->view('templates/header.php');
		$this->load->view('reportes/reporte_cliente', $data);
		$this->load->view('templates/footer.php');
	}

	//agregado
	public function pedidos_cliente(){
		
		$this->administrar();
		$data['clientes'] = $this->Reporte_cliente_model->pedidos_cliente($this->input->post('id'));
		#print_r($data);

		$this->load->view('templates/header.php');
		$this->load->view('reportes/pedidos_cliente', $data);
		$this->load->view('templates/footer.php');
	}
	//agregado
	public function pedido_cliente(){
		
		$this->administrar();
		$data['perfumes'] = $this->Reporte_cliente_model->pedido_cliente($this->input->post('id'));
		#print_r($data);
		$this->load->view('templates/header.php');
		$this->load->view('reportes/pedido_cliente', $data);
		$this->load->view('templates/footer.php');
	}
	public function mostrar_reporte_pedido()
	{
		$this->administrar();
		$data['monto_generado'] = $this->Reporte_pedido_model->monto_total();
		$data['reporte_siete_dias'] = $this->Reporte_pedido_model->pedido_ultimos_siete_dias();
		$data['meses_ganancias'] = $this->Reporte_pedido_model->meses_ganancias();
		$this->load->view('templates/header.php');
		$this->load->view('reportes/reporte_pedido', $data);
		$this->load->view('templates/footer.php');
	}


}

/* End of file reportes.php */
/* Location: ./application/controllers/reportes.php */