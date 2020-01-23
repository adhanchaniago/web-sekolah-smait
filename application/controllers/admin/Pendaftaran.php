<?php
class Pendaftaran extends CI_Controller{
	function __construct(){
		parent::__construct();
		if($this->session->userdata('masuk') !=TRUE){
            $url=base_url('administrator');
            redirect($url);
        };
		$this->load->model('m_pendaftaran');
		$this->load->model('m_pengguna');
		$this->load->library('upload');
	}


	function index(){
		$x['data']=$this->m_pendaftaran->get_all_pendaftaran();
		$this->load->view('admin/v_pendaftaran',$x);
	}
	function hapus_daftar(){

		$kode=$this->input->post('kode');
		$this->m_pendaftaran->hapus_daftar($kode);
		echo $this->session->set_flashdata('msg','success-hapus');
		redirect('admin/Pendaftaran');
	}

	function update_pendaftaran(){
				
	            
	                        $kode=$this->input->post('kode');
							$petugas=strip_tags($this->input->post('petugas'));
							$status=strip_tags($this->input->post('status'));
							

							$this->m_pendaftaran->update_pendaftaran($kode,$petugas,$status);
							
							redirect('admin/pendaftaran');
	                    
	           
	}


}