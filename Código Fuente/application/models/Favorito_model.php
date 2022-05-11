<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Favorito_model extends CI_Model {

	public function insert($data)
	{
		$this->db->insert('cliente_gusta_perfume', $data);
	}

	public function is_fav($id_cliente, $id_perfume)
	{
		$this->db->select('*');
		$this->db->from('cliente_gusta_perfume');
		$this->db->where('id_persona_cliente', $id_cliente);
		$this->db->where('id_perfume', $id_perfume);
		$query = $this->db->get()->row();
		if (empty($query)) {
			return FALSE;
		}
		else
		{
			return TRUE;
		}
	}

	public function delete($data)
	{
		$this->db->where('id_persona_cliente', $data['id_persona_cliente']);
		$this->db->where('id_perfume', $data['id_perfume']);
		$this->db->delete('cliente_gusta_perfume');
	}


	public function get_favs($id_cliente)
	{
		$this->db->select('p.*, m.id as marca_id, m.nombre as marca_nombre');
	    $this->db->from('perfume p'); 
	    $this->db->join('cliente_gusta_perfume cgp', 'cgp.id_perfume = p.id');
	    $this->db->join('cliente c', 'c.id_persona = cgp.id_persona_cliente');
	    $this->db->join('marca m', 'm.id=p.id_marca');
	    $this->db->where('c.id_persona =',$id_cliente);   

	    $query = $this->db->get();
	    return $query->result_array();
	}

}

/* End of file Favorito_model.php */
/* Location: ./application/models/Favorito_model.php */