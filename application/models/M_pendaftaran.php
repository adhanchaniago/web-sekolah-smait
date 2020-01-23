<?php
class M_pendaftaran extends CI_Model{

	function kirim_pesan($nama,$email,$phone,$jurusan){
		$hsl=$this->db->query("INSERT INTO tbl_pendaftaran(nama,email,phone,jurusan) VALUES ('$nama','$email','$phone','$jurusan')");
		return $hsl;
	}
	function get_all_pendaftaran(){
		$hsl=$this->db->query("SELECT * FROM tbl_pendaftaran");
		return $hsl;
	}

	function hapus_daftar($kode){
		$hsl=$this->db->query("DELETE FROM tbl_pendaftaran WHERE id_pendaftaran='$kode'");
		return $hsl;
	}
	function update_daftar($id_pendaftaran, $status){
		$hsl=$this->db->query("update tbl_pendaftaran set iscalling='$status' where id_pendaftaran='$id_pendaftaran'");
		return $hsl;
	}
	function update_pendaftaran($kode,$petugas,$status){
		$hsl=$this->db->query("UPDATE tbl_pendaftaran SET petugas='$petugas',status='$status'WHERE id_pendaftaran='$kode'");
		return $hsl;
	}


}