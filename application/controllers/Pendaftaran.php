<?php
class Pendaftaran extends CI_Controller{
  function __construct(){
		parent::__construct();
      $this->load->model('m_pendaftaran');
      $this->load->model('m_pengunjung');
  		$this->m_pengunjung->count_visitor();
	}
	function index(){
		  $this->load->view('depan/v_pendaftaran');
	}

  function kirim_pesan(){
      $nama=htmlspecialchars($this->input->post('nama',TRUE),ENT_QUOTES);
      $email=htmlspecialchars($this->input->post('email',TRUE),ENT_QUOTES);
      $phone=htmlspecialchars($this->input->post('phone',TRUE),ENT_QUOTES);
      $jurusan=htmlspecialchars($this->input->post('jurusan',TRUE),ENT_QUOTES);
      $this->m_pendaftaran->kirim_pesan($nama,$email,$phone,$jurusan);
      echo $this->session->set_flashdata('msg','<p><strong> NB: </strong> Selamat anda telah melakukan Pendaftaran.</p>');
      redirect('pendaftaran');
  }
}
