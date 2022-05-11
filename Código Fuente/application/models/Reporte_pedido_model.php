<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Reporte_pedido_model extends CI_Model {

	public function monto_total()
	{
		$this->db->select('COUNT(p.id) as nro_clientes, SUM(p.total_precio) as precio_total');
		$this->db->from('pago p');
        
		$query = $this->db->get();
	    return $query->result_array();
    }
    
    public function pedido_ultimos_siete_dias()
	{
        $this->db->select('p.id as id_pago, per.id as id_cliente, p.fecha_pago as fecha, per.nombre_completo as nombre, p.total_precio costo');
        $this->db->from('pago p');
        $this->db->join('persona per', 'per.id = p.id_persona_cliente');
        $this->db->where('p.fecha_pago BETWEEN NOW() - INTERVAL 7 DAY AND NOW()');

		$query = $this->db->get();
	    return $query->result_array();
    }


    public function meses_ganancias()
    {
    	$this->db->query("SET lc_time_names = 'es_PE'");
    	$this->db->select("date_format(p.fecha_pago, '%M') as mes
    						, SUM(p.total_precio) as ganancia");
    	$this->db->from('pago p');
    	$this->db->group_by('mes');
    	$this->db->order_by('MONTH(p.fecha_pago)');

    	$query = $this->db->get()->result_array();
    	return $query;

    }


}

/* End of file Reporte_pedido_model.php */
/* Location: ./application/models/Reporte_pedido_model.php */