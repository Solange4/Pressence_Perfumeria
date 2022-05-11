<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Reporte_cliente_model extends CI_Model {

	public function cantidad_cliente()
	{
		$this->db->select('COUNT(c.id_persona) as nroclientes');
		$this->db->from('cliente c');

		$query = $this->db->get();
	    return $query->result_array();
	}
	
	//agregado
	public function total_de_pedidos_por_cliente()
	{
		$this->db->select('c.nombre_completo as nombre,a.id_persona as id, COUNT(b.id) as total');
		$this->db->from('cliente a');
		$this->db->join('pedido b','b.id_persona_cliente = a.id_persona','left');
		$this->db->join('persona c','c.id=a.id_persona');
		$this->db->group_by('a.id_persona');
		$this->db->order_by('c.nombre_completo','ASC');


		$query = $this->db->get();
	    return $query->result_array();
	}
	//agregado
	public function pedidos_cliente($id)
	{
		$this->db->select('p.id as id,p.fecha_pedido as fecha, pa.total_precio as total');
		$this->db->from('pedido p');
		$this->db->join('pago pa','pa.id = p.id_pago');
		$this->db->where('p.id_persona_cliente',$id);



		$query = $this->db->get();
	    return $query->result_array();
	}

	//agregado
	public function pedido_cliente($id)
	{
		$this->db->select('per.nombre as perfume, m.nombre as marca, per.precio as precio, id_persona_cliente as cliente');
		$this->db->from('pedido_perfume');
		$this->db->join('perfume per','per.id = id_perfume');
		$this->db->join('marca m','per.id_marca = m.id');
		$this->db->where('id_pedido',$id);
	
		$query = $this->db->get();
		return $query->result_array();
	}
	//agregado
	public function cliente_estrella()
	{
		$this->db->select('c.nombre_completo as nombre,a.id_persona as id, COUNT(b.id) as total');
		$this->db->from('cliente a');
		$this->db->join('pedido b','b.id_persona_cliente = a.id_persona','left');
		$this->db->join('persona c','c.id=a.id_persona');
		$this->db->group_by('a.id_persona');
		$this->db->order_by('COUNT(b.id)','DESC');
		$this->db->limit(1);
	
		$query = $this->db->get();
		return $query->result_array();
	}

}

/* End of file Reporte_cliente_model.php */
/* Location: ./application/models/Reporte_cliente_model.php */