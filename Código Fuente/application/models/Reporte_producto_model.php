<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Reporte_producto_model extends CI_Model {

	public function producto_mes()
	{
		$this->db->select('p.id,p.nombre, SUM(cep.puntuacion) as puntaje, p.precio, p.descripcion as perfume_descripcion,
		 m.nombre as marca, t.nombre as tipo, t.descripcion as tipo_descripcion, c.nombre as categoria');
		$this->db->from('perfume p');
		$this->db->join('cliente_evalua_perfume cep', 'cep.id_perfume = p.id');
		$this->db->join('marca m', 'm.id = p.id_marca');
		$this->db->join('tipo t', 't.id = p.id_tipo');
		$this->db->join('categoria c', 'c.id = p.id_categoria');
		$this->db->group_by('p.id');
		$this->db->order_by('puntaje', 'desc');
		$this->db->limit(1);

		$query = $this->db->get();
	    return $query->row();
	}

	public function  marca_producto_cantidad()
	{
		$this->db->select('m.id, m.nombre, COUNT(p.id_marca) AS nroproductos');
		$this->db->from('marca m');
		$this->db->join('perfume p', 'p.id_marca = m.id', 'left');
		$this->db->group_by('p.id_marca');
		$this->db->order_by('m.nombre');

		$query = $this->db->get();
	    return $query->result_array();
	}

	public function  categoria_producto_cantidad()
	{
		$this->db->select('c.id, c.nombre, COUNT(p.id_categoria) AS nroproductos');
		$this->db->from('categoria c');
		$this->db->join('perfume p', 'p.id_categoria = c.id', 'left');
		$this->db->group_by('p.id_categoria');
		$this->db->order_by('c.nombre');

		$query = $this->db->get();
	    return $query->result_array();
	}

	public function  tipo_producto_cantidad()
	{
		$this->db->select('t.id, t.nombre, COUNT(p.id_tipo) AS nroproductos');
		$this->db->from('tipo t');
		$this->db->join('perfume p', 'p.id_tipo = t.id', 'left');
		$this->db->group_by('p.id_tipo');
		$this->db->order_by('t.nombre');

		$query = $this->db->get();
	    return $query->result_array();
	}

	public function producto_ultimas_dos_semanas()
	{
		$this->db->select("date_format(p.fecha_ingreso, '%d/%m/%Y' ) AS fecha_ingreso, p.id, p.nombre, p.precio, p.stock, m.nombre as marca, t.nombre as tipo, c.nombre as categoria");
		$this->db->from('perfume p');
		$this->db->join('marca m', 'm.id = p.id_marca', 'left');
		$this->db->join('tipo t', 't.id = p.id_marca', 'left');
		$this->db->join('categoria c', 'c.id = p.id_marca', 'left');
		$this->db->where('p.fecha_ingreso BETWEEN NOW() - INTERVAL 14 DAY AND NOW()');
		$this->db->order_by('p.fecha_ingreso', 'desc');

		$query = $this->db->get();
	    return $query->result_array();	
	}

	public function productos_recientes()
	{
		$this->db->select("date_format(p.fecha_ingreso, '%d/%m/%Y' ) AS fecha_ingreso, p.id, p.nombre, p.precio, p.stock, m.nombre as marca, t.nombre as tipo, c.nombre as categoria");
		$this->db->from('perfume p');
		$this->db->join('marca m', 'm.id = p.id_marca', 'left');
		$this->db->join('tipo t', 't.id = p.id_marca', 'left');
		$this->db->join('categoria c', 'c.id = p.id_marca', 'left');
		$this->db->where('p.fecha_ingreso BETWEEN NOW() - INTERVAL 14 DAY AND NOW()');
		$this->db->order_by('p.id');

		$query = $this->db->get();
	    return $query->result_array();	
	}

	public function producto_barato()
	{
		$this->db->select('p.nombre, p.precio, m.nombre as marca, t.nombre as tipo, c.nombre as categoria');
		$this->db->from('perfume p');
		$this->db->join('marca m', 'm.id = p.id_marca');
		$this->db->join('tipo t', 't.id = p.id_tipo');
		$this->db->join('categoria c', 'c.id = p.id_categoria');
		$this->db->where('p.precio <=', 20);
		$this->db->order_by('p.precio');

		$query = $this->db->get();
	    return $query->result_array();
	}

}

/* End of file Reporte_producto_model.php */
/* Location: ./application/models/Reporte_producto_model.php */