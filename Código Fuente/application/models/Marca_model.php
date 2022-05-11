<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Marca_model extends CI_Model {

	public function getDataMarca()
	{
		$query = $this->db->get('marca');
		return $query;
	}

}

/* End of file Marca_model.php */
/* Location: ./application/models/Marca_model.php */