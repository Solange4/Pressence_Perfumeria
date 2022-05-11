<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Perfume extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->model('Perfume_model');
		$this->load->model('Categoria_model');
		$this->load->model('Tipo_model');
		$this->load->model('Marca_model');
		$this->load->model('Opinion_model');
		$this->load->model('Favorito_model');
		$this->load->library('form_validation');
		
	}



	public function perfume_producto($id)
	{
		$data['perfumes'] = $this->Perfume_model->get_by_id($id);
		$data['opiniones'] = $this->Opinion_model->get_opinion($id);
		$data['is_fav'] = $this->Favorito_model->is_fav($this->session->userdata('id'), $id);
		$this->load->view('templates/header.php');
		$this->load->view('perfume/single_product', $data);
		$this->load->view('templates/footer.php');

	}


	public function eliminar($id = '')
	{
		$this->autorizar();
		$this->administrar();
		$query = $this->Perfume_model->delete_perfume($id);
	}

	public function autorizar()
	{
		if (!$this->session->userdata('logged_in')) 
		{
			$this->session->set_flashdata('msg', "Acceso no autorizado.");
			redirect(base_url('login_register/iniciar_sesion'));
		}
	}

	public function administrar()
	{
		if (!$this->session->userdata('is_admin')) 
		{
			$this->session->set_flashdata('msg', "Intruso :c No tienes permiso :c");
			redirect(base_url('home/mostrar'));
		}
	}

	// INSERT IN PERFUME
	// Muestra la vista de ingresar un nuevo producto
	public function crear()
	{

		$this->autorizar();
		$this->administrar();
		
		$data['categorias'] = $this->Categoria_model->getDataCategoria()->result();
		$data['tipos'] = $this->Tipo_model->getDataTipo()->result();
		$data['marcas'] = $this->Marca_model->getDataMarca()->result();
		$this->load->view('templates/header');
		$this->load->view('perfume/ingresar', $data);
		$this->load->view('templates/footer');
	}

	public function guardar()
	{
		$this->autorizar();
		$this->administrar();
		$data = array(#'id' => $this->input->post('id'),
					'id' => $this->Perfume_model->get_new_id(),
					'id_persona_administrador' => $this->session->userdata('id'),
					'id_categoria'=> $this->input->post('categoria'),	
					'id_tipo'=> $this->input->post('tipo'),
					'id_marca'=> $this->input->post('marca'),
					'nombre'=> $this->input->post('nombre'),
					'descripcion'=> $this->input->post('descripcion'),
					'precio'=> $this->input->post('precio'),
					'stock'=> $this->input->post('stock'),
					'fecha_ingreso'=> $this->input->post('fecha_ingreso'));
		################################################################

		$this->subir_imagen($data['id']);
		################################################################


		$this->Perfume_model->insert_perfume($data);
		redirect(base_url('home/mostrar'));

	}
	// END OF INSERT



	public function editar($id)
	{
		$this->autorizar();
		$this->administrar();
		$data['perfumes'] = $this->Perfume_model->get_by_id($id);
		$data['categorias'] = $this->Categoria_model->getDataCategoria()->result();
		$data['tipos'] = $this->Tipo_model->getDataTipo()->result();
		$data['marcas'] = $this->Marca_model->getDataMarca()->result();
		#print_r($data);
		$this->load->view('templates/header');
		$this->load->view('perfume/editar', $data);
		$this->load->view('templates/footer');
	}

	public function actualizar($id)
	{
		$this->autorizar();
		$this->administrar();
		$data = array(//'id' => $this->input->post('id'),
					'id_persona_administrador' => $this->session->userdata('id'),
					'id_categoria'=> $this->input->post('categoria'),	
					'id_tipo'=> $this->input->post('tipo'),
					'id_marca'=> $this->input->post('marca'),
					'nombre'=> $this->input->post('nombre'),
					'descripcion'=> $this->input->post('descripcion'),
					'precio'=> $this->input->post('precio'),
					'stock'=> $this->input->post('stock'),
					'fecha_ingreso'=> $this->input->post('fecha_ingreso'));
		
		$this->Perfume_model->update_perfume($id, $data);
		redirect(base_url('home/mostrar'));

	}

	public function subir_imagen($id) 
	{
        $this->autorizar();
		$this->administrar();
        $config['upload_path'] = './product_images/';
        $config['allowed_types'] = 'jpg|png';
        $config['max_size'] = 2000;
        $config['max_width'] = 1500;
        $config['max_height'] = 1500;
        $config['file_name'] = $id;


        $this->load->library('upload', $config);

        if (!$this->upload->do_upload('profile_image')) {
            $error = array('error' => $this->upload->display_errors());
            print_r($error);
        } 
    }




}

/* End of file perfume.php */
/* Location: ./application/controllers/perfume.php */