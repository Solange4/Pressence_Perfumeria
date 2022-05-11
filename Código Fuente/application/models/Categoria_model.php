<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Categoria_model extends CI_Model{

	public function getDataCategoria()
	{
		$query = $this->db->get('categoria');
		return $query;
	}

}

/* End of file Categoria_model.php */
/* Location: ./application/models/Categoria_model.php */