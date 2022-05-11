<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Pedido_model extends CI_Model {

	public function new_pedido($data)
	{
		return $this->db->insert('pedido', $data);
	}

	public function get_new_id()
    {
    	$this->db->select_max('id');
    	$query = $this->db->get('pedido');
    	$new_id = $query->result_array()[0]['id'] + 1;
    	return $new_id;
    	#print_r($new_id);
    }

    public function add_pedido_perfume($data)
    {
    	return $this->db->insert('pedido_perfume', $data);
    }

    public function update_pedido_perfume($data)
    {
    	$this->db->set('cantidad', $data['cantidad']);
    	$this->db->where('id_pedido', $data['id_pedido']);
    	$this->db->where('id_perfume', $data['id_perfume']);
    	$this->db->where('id_persona_cliente', $data['id_persona_cliente']);
    	$this->db->update('pedido_perfume');


    }

    public function get_id_pedido($id)
    {
    	$this->db->select('p.id');
    	$this->db->from('pedido p');
    	$this->db->where('id_persona_cliente', $id)->where('id_pago', NULL);

    	$query = $this->db->get()->result_array();
    	if (empty($query)) {
    		#echo 'Carrito vacio';
    		return 0;
    	}
    	else
    	{
    		return $query[0]['id'];
    	}

    }

    public function comprobar_cantidad_producto($data)
    {
    	
    	$this->db->select('pp.cantidad');
    	$this->db->from('pedido_perfume pp');
    	$this->db->where('id_pedido', $data['id_pedido']);
    	$this->db->where('id_perfume', $data['id_perfume']);
    	$this->db->where('id_persona_cliente', $data['id_persona_cliente']);

    	$query = $this->db->get()->row();

    	if(empty($query))
    	{
    		return 0;
    	}
    	else
    	{
    		return $query->cantidad;
    	}
    }
    /*
    public function get_id_pedido($id)
    {
    	$this->db->select('id');
    	$this->db->from('pedido');
    	$this->db->where('id_persona_cliente', $id);

    	$query = $this->db->get()->row();
    	if(empty($query))
    	{
    		
    		return 0;
    	}
    	else
    	{
    		return $query->id;
    	}

    }*/

    public function get_pedido_productos($id)
    {
    	$this->db->select('pp.*, p.id as perfume_id, p.nombre as producto, p.precio as precio, m.nombre as marca, t.nombre as tipo');
    	$this->db->from('pedido_perfume pp');
    	$this->db->join('perfume p', 'p.id = pp.id_perfume');
    	$this->db->join('marca m', 'm.id = p.id_marca');
    	$this->db->join('tipo t', 't.id = p.id_tipo');
    	$this->db->where('id_pedido', $id);

    	$query = $this->db->get()->result_array();
    	return $query;
    }



    public function get_pedido_montos($id)
    {
        $this->db->select('p.id as perfume_id, p.nombre as producto, (p.precio*pp.cantidad) as monto');
        $this->db->from('pedido_perfume pp');
        $this->db->join('perfume p', 'p.id = pp.id_perfume');
        $this->db->where('id_pedido', $id);

        $query = $this->db->get()->result_array();
        return $query;
    }

    public function get_pedido_monto_total($id)
    {
        $this->db->select('SUM(p.precio*pp.cantidad) as total');
        $this->db->from('pedido_perfume pp');
        $this->db->join('perfume p', 'p.id = pp.id_perfume');
        $this->db->where('id_pedido', $id);

        $query = $this->db->get()->row();
        return $query;
    }

    public function get_cuentas($id)
    {
        $this->db->select('id, CONCAT(calle," ",provincia, " ", pais, " ", ciudad) as info');
        $this->db->from('cuenta');
        $this->db->where('id_persona_cliente', $id);
        $query = $this->db->get()->result_array();
        return $query;

    }

    public function get_new_id_pago()
    {
        $this->db->query("ALTER TABLE pago AUTO_INCREMENT = 1");
        $result = $this->db->query("select auto_increment from information_schema.tables where table_schema = 'pressence_perfume' AND table_name ='pago'");
        return $result->row()->auto_increment;
        #print_r($new_id);
    }

    public function get_new_id_tarjeta()
    {
        $this->db->query("ALTER TABLE pago AUTO_INCREMENT = 1");
        $result = $this->db->query("select auto_increment from information_schema.tables where table_schema = 'pressence_perfume' AND table_name ='tarjeta'");
        return $result->row()->auto_increment;
        #print_r($new_id);
    }

    public function delete_producto_carrito($id_pedido, $id_perfume)
    {
        $this->db->where('id_pedido', $id_pedido);
        $this->db->where('id_perfume', $id_perfume);
        $this->db->delete('pedido_perfume');
    }

	public function insert_detalles($data)
    { 	#var_dump($data);
    	#print_r($data);
    	return $this->db->insert('cuenta', $data);
    }

    public function insert_tarjeta($data)
    { 	#var_dump($data);
    	#print_r($data);
    	return $this->db->insert('tarjeta', $data);
    }

    public function update_tarjeta($numero, $id_pago)
    {
        $this->db->set('id_pago', $id_pago);
        $this->db->where('numero', $numero);
        $this->db->update('tarjeta');
    }

    public function update_pedido_pago($id, $id_pago)
    {
        $this->db->set('id_pago', $id_pago);
        $this->db->where('id', $id);
        $this->db->update('pedido');
    }
    public function insert_pago($data)
    { 	#var_dump($data);
    	#print_r($data);
    	return $this->db->insert('pago', $data);
    }



}

/* End of file Pedido_model.php */
/* Location: ./application/models/Pedido_model.php */