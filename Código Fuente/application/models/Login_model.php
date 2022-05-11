<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Login_model extends CI_Model {

	public function checking($username, $contrasenia)
	{
		$this->db->select();
		$this->db->from('persona');
		$this->db->where('username', $username);
		//$this->db->where('password', $password);
		$this->db->limit(1);
		$query = $this->db->get();
		
		if ($query->num_rows() == 1) {
			//return true;
			$row  = $query->row();
			#if (password_verify($contrasenia, $row->contrasenia)) {
			if ($contrasenia == $row->contrasenia) {
				return true;
			}
			else
			{
				return false;
			}
		}
		else 
		{
			return false;
		}

	}

	public function infopersona($username)
	{
		$this->db->select('p.id, p.username, p.nombre_completo');
		$this->db->from('persona p');
		$this->db->where('p.username', $username);
		$this->db->limit(1);
		$query = $this->db->get();
		return $query->result_array();


				/*
		$this->db->select('p*, c.id as cliente_id, c.correo as cliente_correo, 
			c.telefono as cliente_telefono, c.direccion as cliente_direccion, 
			c.genero as cliente_genero, c.fecha_nacmiento as cliente_fecha_nacimiento');
		$this->db->from('persona p');
		$this->db->join('cliente c', 'c.id_persona = p.id');*/
	}	

	// Se obtiene un nuevo id para que pueda ser guardado automáticamente 
	// en la tabla persona y cliente
	public function get_new_id()
    {
    	$this->db->select_max('id');
    	$query = $this->db->get('persona');
    	$new_id = $query->result_array()[0]['id'] + 1;
    	return $new_id;
    	#print_r($new_id);
    }

    
    // Obtiene usuario por id
    public function get_by_id($id)
	{
	    $this->db->select('p.*, c.id_persona as cliente_id, c.correo as cliente_correo, 
			c.telefono as cliente_telefono, 
			c.genero as cliente_genero, c.fecha_nacimiento as cliente_fecha_nacimiento');
	    $this->db->from('persona p'); 
	    $this->db->join('cliente c', 'c.id_persona=p.id', 'left');
	    $this->db->where('p.id =',$id);   

	    $query = $this->db->get();
	    return $query->row();
	}

	public function get_persona_by_id($id)
	{
		$this->db->select('*');
		$this->db->from('persona');
		$this->db->where('id', $id);

		$query = $this->db->get();
	    return $query->row();
	}


	public function insert_persona($data)
    { 	#var_dump($data);
    	#print_r($data);
    	return $this->db->insert('persona', $data);
    }

    public function insert_cliente($data)

    { 	#var_dump($data);
    	#print_r($data);
    	return $this->db->insert('cliente', $data);
    }

    public function update_persona($id, $data) {
       $this->db->where('id', $id);
       $this->db->update('persona', $data);
    }

    public function update_cliente($id, $data) {
       $this->db->where('id_persona', $id);
       $this->db->update('cliente', $data);
    }

	public function getadmin($id)
	{
		$this->db->select('p*');
		$this->db->from('persona p');
		$this->db->join('administrador a', 'a.id_persona = p.id');
		$this->db->where('p.id =',$id);
		
		$query = $this->db->get();
		return $query->row();
	}

	public function is_administrador($id)
	{
		$this->db->select('COUNT(*) as isadmin');
		$this->db->from('administrador');
		$this->db->where('id_persona', $id);
		$query = $this->db->get();
		
		return $query->result_array()[0]['isadmin'];
		//$query = $this->db->get();
		//return $query;
	}
}

/* End of file Login_model.php */
/* Location: ./application/models/Login_model.php */