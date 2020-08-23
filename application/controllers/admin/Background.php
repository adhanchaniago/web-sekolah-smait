<?php
class Background extends CI_Controller{
	function __construct(){
		parent::__construct();
		if($this->session->userdata('masuk') !=TRUE){
            $url=base_url('administrator');
            redirect($url);
        };
		$this->load->model('m_background');
		
		$this->load->model('m_pengguna');
		$this->load->library('upload');
	}


	function index(){
		
		$x['data']=$this->m_background->get_all_background();
		
		$this->load->view('admin/v_background',$x);
	}
	
	function simpan_background(){
	
				$config['upload_path'] = './assets/images/'; //path folder
	            $config['allowed_types'] = 'gif|jpg|png|jpeg|bmp'; //type yang dapat diakses bisa anda sesuaikan
	            $config['encrypt_name'] = TRUE; //nama yang terupload nantinya

	            $this->upload->initialize($config);
	            if(!empty($_FILES['filebg']['name']))
	            {
	                if ($this->upload->do_upload('filebg'))
	                {
	                        $gbr = $this->upload->data();
	                        //Compress Image
	                        $config['image_library']='gd2';
	                        $config['source_image']='./assets/images/'.$gbr['file_name'];
	                        $config['create_thumb']= FALSE;
	                        $config['maintain_ratio']= FALSE;
	                        $config['quality']= '60%';
	                        $config['width']= 500;
	                        $config['height']= 400;
	                        $config['new_image']= './assets/images/'.$gbr['file_name'];
	                        $this->load->library('image_lib', $config);
	                        $this->image_lib->resize();

	                        $gambar=$gbr['file_name'];
	                        $judul=strip_tags($this->input->post('xjudul'));
							
							$kode=$this->session->userdata('idadmin');
							$this->m_background->simpan_background($judul,$gambar);
							echo $this->session->set_flashdata('msg','success');
							redirect('admin/background');
					}else{
	                    echo $this->session->set_flashdata('msg','warning');
	                    redirect('admin/background');
	                }
	                 
	            }else{
					redirect('admin/background');
				}
				
	}
	
	function update_background(){
				
	            $config['upload_path'] = './assets/images/'; //path folder
	            $config['allowed_types'] = 'gif|jpg|png|jpeg|bmp'; //type yang dapat diakses bisa anda sesuaikan
	            $config['encrypt_name'] = TRUE; //nama yang terupload nantinya

	            $this->upload->initialize($config);
	            if(!empty($_FILES['filebg']['name']))
	            {
	                if ($this->upload->do_upload('filebg'))
	                {
	                        $gbr = $this->upload->data();
	                        //Compress Image
	                        $config['image_library']='gd2';
	                        $config['source_image']='./assets/images/'.$gbr['file_name'];
	                        $config['create_thumb']= FALSE;
	                        $config['maintain_ratio']= FALSE;
	                        $config['quality']= '60%';
	                        $config['width']= 500;
	                        $config['height']= 400;
	                        $config['new_image']= './assets/images/'.$gbr['file_name'];
	                        $this->load->library('image_lib', $config);
	                        $this->image_lib->resize();

	                        $gambar=$gbr['file_name'];
	                        $bg_id=$this->input->post('kode');
	                        $judul=strip_tags($this->input->post('xjudul'));
							
							$images=$this->input->post('gambar');
							$path='./assets/images/'.$images;
							unlink($path);
							$kode=$this->session->userdata('idadmin');
							
							
							$this->m_background->update_background($bg_id,$judul,$gambar);
							echo $this->session->set_flashdata('msg','info');
							redirect('admin/background');
	                    
	                }else{
	                    echo $this->session->set_flashdata('msg','warning');
	                    redirect('admin/background');
	                }
	                
	            }
	}

	function hapus_background(){
		$kode=$this->input->post('kode');
		
		$gambar=$this->input->post('gambar');
		$path='./assets/images/'.$gambar;
		unlink($path);
		$this->m_background->hapus_background($kode);
		echo $this->session->set_flashdata('msg','success-hapus');
		redirect('admin/background');
	}

}