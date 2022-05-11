<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Perfume_model extends CI_Model {

	public function get_by_id($id)
	{
	    $this->db->select('p.*, c.id as categoria_id, c.nombre as categoria_nombre, m.id as marca_id, m.nombre as marca_nombre, t.id as tipo_id, t.nombre as tipo_nombre, t.descripcion as tipo_descripcion');
	    $this->db->from('perfume p'); 
	    $this->db->join('categoria c', 'c.id=p.id_categoria');
	    $this->db->join('marca m', 'm.id=p.id_marca');
	    $this->db->join('tipo t', 't.id=p.id_tipo');
	    $this->db->where('p.id =',$id);   

	    $query = $this->db->get();
	    return $query->row();
	}


	public function delete_perfume($id)
    {
    	$this->db->where('id',$id);
    	$this->db->delete('perfume');
    }	

    public function insert_perfume($data)
    { 	#var_dump($data);
    	#print_r($data);
    	return $this->db->insert('perfume', $data);
    }

    public function update_perfume($id, $data) {
       $this->db->where('id', $id);
       $this->db->update('perfume', $data);
    }

    public function get_new_id()
    {
    	$this->db->select_max('id');
    	$query = $this->db->get('perfume');
    	$new_id = $query->result_array()[0]['id'] + 1;
    	return $new_id;
    	#print_r($new_id);
    }

    public function getDataPerfume()
    {
        $query = $this->db->get('perfume');
        return $query;
    }

}


/* End of file Perfume_model.php */
/* Location: ./application/models/Perfume_model.php */