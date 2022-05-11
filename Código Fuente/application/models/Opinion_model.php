<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Opinion_model extends CI_Model {

	
	public function get_opinion($id)
  {
      $this->db->select('e.id_persona_cliente as id_cliente , per.nombre_completo as cliente, e.puntuacion as puntuacion, e.opinion as opinion');
      $this->db->from('cliente_evalua_perfume e'); 
      $this->db->join('perfume p', 'p.id = e.id_perfume');
      $this->db->join('cliente c', 'e.id_persona_cliente = c.id_persona');
      $this->db->join('persona per', 'c.id_persona = per.id');
      $this->db->where('p.id',$id);   

      $query = $this->db->get();
      return $query->result_array();
  }


  public function insert_opinion($data)
  {   #var_dump($data);

      #print_r($da);
      return $this->db->insert('cliente_evalua_perfume', $data);
  }


  public function is_opinion($id_cliente, $id_perfume)
  {
    $this->db->select('*');
    $this->db->from('cliente_evalua_perfume');
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

  public function update_opinion($data)
  {
    $this->db->set('opinion', $data['opinion']);
    $this->db->set('puntuacion', $data['puntuacion']);
    $this->db->where('id_persona_cliente', $data['id_persona_cliente']);
    $this->db->where('id_perfume', $data['id_perfume']);
    $this->db->update('cliente_evalua_perfume');

  }

}

/* End of file Opinion_model.php */
/* Location: ./application/models/Opinion_model.php */