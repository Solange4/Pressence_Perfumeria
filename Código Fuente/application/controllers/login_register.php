<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Login_register extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		
		$this->load->model('Login_model');
		$this->load->library('form_validation');
		
	}

	public function about()
	{
		
		$this->load->view('templates/header.php');
		$this->load->view('index/about.php');
		$this->load->view('templates/footer.php');
	}
	// Carga la vista del formulario a llenar
	public function registrar()
	{
		$this->load->view('templates/header');
		$this->load->view('login_register/register');
		$this->load->view('templates/footer');
	}
	public function perfil()
	{
		$this->autorizar();
		$data['cliente'] = $this->Login_model->get_by_id($this->session->userdata('id'));

		$this->load->view('templates/header');
		$this->load->view('login_register/perfil', $data);
		$this->load->view('templates/footer');
	}


	// Realiza el proceso de guardar todos los datos que se ingresen en el formulario
	public function nuevo_usuario()
	{
		// Validación
		$this->form_validation->set_rules('username', 'username', 'trim|required|is_unique[persona.username]', array('required' => 'El ingreso de nombre de usuario es obligatorio', 'is_unique' => 'El usuario ya se encuentra registrado'));
		$this->form_validation->set_rules('telefono', 'telefono', 'trim|required|numeric', array('required' => 'El ingreso de su número es obligatorio', 'numeric'=> 'El ingreso de su teléfono es con números'));
		$this->form_validation->set_rules('correo', 'correo', 'trim|required|valid_email', array('required' => 'Ingreso de Correo obligatorio', 'valid_email' => 'Correo no válido'));
		if ($this->form_validation->run() == FALSE) 
		{
		    	$this->load->view('templates/header');
				$this->load->view('login_register/register');
				$this->load->view('templates/footer');
		} 
		else 
		{
			// arreglo con todos los campos de la tabla
			$data_persona = array('id' => $this->Login_model->get_new_id(),
						'username' => $this->input->post('username'),
						'contrasenia'=> $this->input->post('contrasenia'),	
						'nombre_completo'=> $this->input->post('nombre_completo'));

			// al momento de ingresar un usuario en tabla persona el id del usuario será añadido 
			// inmediatamente a tabla cliente
			$data_cliente = array('id_persona' => $data_persona['id'],
			#'id_persona' => $data_persona['id'],
						'correo' => $this->input->post('correo'),
						'telefono'=> $this->input->post('telefono'),
						'genero' => $this->input->post('genero'),
						'fecha_nacimiento'=> $this->input->post('fecha_nacimiento'));

			// Llama a las funciones del modelo
			$this->Login_model->insert_persona($data_persona);
			$this->Login_model->insert_cliente($data_cliente);
			redirect(base_url('login_register/perfil'));
		}
	}


	public function editar_usuario()
	{
		$this->autorizar();
		$data['usuarios'] = $this->Login_model->get_by_id($this->session->userdata('id'));
		/*$data['categorias'] = $this->Categoria_model->getDataCategoria()->result();
		$data['tipos'] = $this->Tipo_model->getDataTipo()->result();
		$data['marcas'] = $this->Marca_model->getDataMarca()->result();
		#print_r($data);*/
		$this->load->view('templates/header');
		$this->load->view('login_register/perfil_editar', $data);
		$this->load->view('templates/footer');
	}


	public function editar_admin()
	{
		$this->autorizar();
		$this->administrar();
		$data['admin'] = $this->Login_model->get_persona_by_id($this->session->userdata('id'));
		#print_r($data);*/
		$this->load->view('templates/header');
		$this->load->view('login_register/perfil_admin_editar', $data);
		$this->load->view('templates/footer');
	}

	public function actualizar_usuario()
	{
		$this->autorizar();
			// arreglo con todos los campos de la tabla
			$data_persona = array('id' => $this->session->userdata('id'),
						'username' => $this->input->post('username'),
						'contrasenia'=> $this->input->post('contrasenia'),	
						'nombre_completo'=> $this->input->post('nombre_completo'));

			// al momento de ingresar un usuario en tabla persona el id del usuario será añadido 
			// inmediatamente a tabla cliente
			$data_cliente = array('id_persona' => $data_persona['id'],
						'correo' => $this->input->post('correo'),
						'telefono'=> $this->input->post('telefono'),
						'genero' => $this->input->post('genero'),
						'fecha_nacimiento'=> $this->input->post('fecha_nacimiento'));

			// Llama a las funciones del modelo
			$this->Login_model->update_persona($this->session->userdata('id'), $data_persona);
			$this->Login_model->update_cliente($this->session->userdata('id'), $data_cliente);

			$this->session->set_userdata('nombre_completo', $data_persona['nombre_completo']);
			$this->session->set_userdata('username', $data_persona['username']);


			redirect(base_url('login_register/perfil'));
	}

	public function actualizar_admin()
	{
		$this->autorizar();
		$this->administrar();
			// arreglo con todos los campos de la tabla
			$data_persona = array('id' =>$this->session->userdata('id'),
						'username' => $this->input->post('username'),
						'contrasenia'=> $this->input->post('contrasenia'),	
						'nombre_completo'=> $this->input->post('nombre_completo'));

			// Llama a las funciones del modelo
			$this->Login_model->update_persona($this->session->userdata('id'), $data_persona);

			$this->session->set_userdata('nombre_completo', $data_persona['nombre_completo']);
			$this->session->set_userdata('username', $data_persona['username']);


			redirect(base_url('login_register/perfil'));
	}

	public function iniciar_sesion()
	{
		$this->load->view('templates/header');
		$this->load->view('login_register/login');
		$this->load->view('templates/footer');
	}


	public function verificar()
	{
		$username = $this->input->post('username');
		$contrasenia = $this->input->post('contrasenia');
		//echo contrasenia_hash('director', PASSWORD_DEFAULT);
		//$this->Login_model->checking($username, $contrasenia);
		

		if($this->Login_model->checking($username, $contrasenia))
		{
			$info = $this->Login_model->infopersona($username);
			$array = array(
				'id' => $info[0]['id'],
				'username' => $info[0]['username'],
				'nombre_completo' => $info[0]['nombre_completo'],
				'logged_in' => TRUE,
				//'is_admin' => $is_admin
			);

			if($this->Login_model->is_administrador($array['id']))
			{
				$array['is_admin'] = TRUE;
			}
			else 
			{
				$array['is_admin'] = FALSE;
			}
			
			$this->session->set_userdata( $array );
			redirect(base_url('home/mostrar'));
			
		}
		else
		{
			$this->session->set_flashdata('msg', "Usuario o contraseña no han coincidido");
			redirect(base_url('login_register/iniciar_sesion'));

		}
		
	}

	public function autorizar($page)
	{
		if (!$this->session->userdata('logged_in')) 
		{
			$this->session->set_flashdata('msg', "Acceso no autorizado.");
			redirect(base_url('login_register/iniciar_sesion'));
		}
	}

	public function administrar($page)
	{
		if (!$this->session->userdata('is_admin')) 
		{
			$this->session->set_flashdata('msg', "Intruso :c No tienes permiso :c");
			redirect(base_url('home/mostrar'));
		}
	}

	public function logout()
	{
		$this->session->unset_userdata('id');
		$this->session->unset_userdata('username');
		$this->session->unset_userdata('nombre_completo');
		$this->session->unset_userdata('is_admin');
		$this->session->unset_userdata('logged_in');
		$this->session->sess_destroy();
		redirect(base_url('login_register/iniciar_sesion'));
	}

}

/* End of file login_register.php */
/* Location: ./application/controllers/login_register.php */