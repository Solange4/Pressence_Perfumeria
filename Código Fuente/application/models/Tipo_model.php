<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Tipo_model extends CI_Model {

	public function getDataTipo()
	{
		$query = $this->db->get('tipo');
		return $query;
	}

}

/* End of file Tipo_model.php */
/* Location: ./application/models/Tipo_model.php */