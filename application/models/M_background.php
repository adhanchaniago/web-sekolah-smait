<?php
class M_background extends CI_Model{

	function get_all_background(){
		$hsl=$this->db->query("SELECT * FROM tbl_bg ORDER BY bg_id DESC");
		return $hsl;
	}
	function get_gambar_1(){
		$hsl=$this->db->query("SELECT * FROM tbl_bg where bg_judul = 'gambar 1'");
		return $hsl;
	}
	function get_gambar_2(){
		$hsl=$this->db->query("SELECT * FROM tbl_bg where bg_judul = 'gambar 2'");
		return $hsl;
	}
	function get_gambar_3(){
		$hsl=$this->db->query("SELECT * FROM tbl_bg where bg_judul = 'gambar 3'");
		return $hsl;
	}
	function simpan_background($judul,$gambar){
		$this->db->trans_start();
            $this->db->query("insert into tbl_bg (bg_judul,bg_gambar) values ('$judul','$gambar')");
        $this->db->trans_complete();
        if($this->db->trans_status()==true)
        return true;
        else
        return false;
	}
	
	function update_background ($bg_id,$judul,$gambar){
		$hsl=$this->db->query("update tbl_bg set bg_judul='$judul',bg_gambar='$gambar' where bg_id='$bg_id'");
		return $hsl;
	}
	function hapus_background($kode){
		$this->db->trans_start();
            $this->db->query("delete from tbl_bg where bg_id='$kode'");
         
        $this->db->trans_complete();
        if($this->db->trans_status()==true)
        return true;
        else
        return false;
	}



	//Front-End

}