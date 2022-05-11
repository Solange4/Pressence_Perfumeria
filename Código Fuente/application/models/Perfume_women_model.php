<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Perfume_women_model extends CI_Model {

	public function get_perfume_mujer()
	{
	    $this->db->select('p.*, c.id as categoria_id, c.nombre as categoria_nombre, m.id as marca_id, m.nombre as marca_nombre, t.id as tipo_id, t.nombre as tipo_nombre, t.descripcion as tipo_descripcion');
	    $this->db->from('perfume p'); 
	    $this->db->join('categoria c', 'c.id=p.id_categoria');
	    $this->db->join('marca m', 'm.id=p.id_marca');
	    $this->db->join('tipo t', 't.id=p.id_tipo');
	    $this->db->where('p.id_categoria',10);
	    $this->db->order_by('id');    

	    $query = $this->db->get();

	    return $query->result_array();
	}

	public function get_agua_perfume_mujer()
	{
	    $this->db->select('p.*, c.id as categoria_id, c.nombre as categoria_nombre, m.id as marca_id, m.nombre as marca_nombre, t.id as tipo_id, t.nombre as tipo_nombre, t.descripcion as tipo_descripcion');
	    $this->db->from('perfume p'); 
	    $this->db->join('categoria c', 'c.id=p.id_categoria');
	    $this->db->join('marca m', 'm.id=p.id_marca');
	    $this->db->join('tipo t', 't.id=p.id_tipo');
	    $this->db->where('p.id_categoria',10)->where('t.id',2);
	    $this->db->order_by('id');     

	    $query = $this->db->get();

	    return $query->result_array();
	}
	public function get_agua_banio_mujer()
	{
	    $this->db->select('p.*, c.id as categoria_id, c.nombre as categoria_nombre, m.id as marca_id, m.nombre as marca_nombre, t.id as tipo_id, t.nombre as tipo_nombre, t.descripcion as tipo_descripcion');
	    $this->db->from('perfume p'); 
	    $this->db->join('categoria c', 'c.id=p.id_categoria');
	    $this->db->join('marca m', 'm.id=p.id_marca');
	    $this->db->join('tipo t', 't.id=p.id_tipo');
	    $this->db->where('p.id_categoria',10)->where('t.id',1);
	    $this->db->order_by('id');    

	    $query = $this->db->get();

	    return $query->result_array();
	}
	public function get_agua_colonia_mujer()
	{
	    $this->db->select('p.*, c.id as categoria_id, c.nombre as categoria_nombre, m.id as marca_id, m.nombre as marca_nombre, t.id as tipo_id, t.nombre as tipo_nombre, t.descripcion as tipo_descripcion');
	    $this->db->from('perfume p'); 
	    $this->db->join('categoria c', 'c.id=p.id_categoria');
	    $this->db->join('marca m', 'm.id=p.id_marca');
	    $this->db->join('tipo t', 't.id=p.id_tipo');
	    $this->db->where('p.id_categoria',10)->where('t.id',4); 
	    $this->db->order_by('id');   

	    $query = $this->db->get();

	    return $query->result_array();
	}

	public function get_splash_perfume_mujer()
	{
	    $this->db->select('p.*, c.id as categoria_id, c.nombre as categoria_nombre, m.id as marca_id, m.nombre as marca_nombre, t.id as tipo_id, t.nombre as tipo_nombre, t.descripcion as tipo_descripcion');
	    $this->db->from('perfume p'); 
	    $this->db->join('categoria c', 'c.id=p.id_categoria');
	    $this->db->join('marca m', 'm.id=p.id_marca');
	    $this->db->join('tipo t', 't.id=p.id_tipo');
	    $this->db->where('p.id_categoria',10)->where('t.id',3);
	    $this->db->order_by('id');    

	    $query = $this->db->get();

	    return $query->result_array();
	}

}

/* End of file Perfume_women.php */
/* Location: ./application/models/Perfume_women.php */