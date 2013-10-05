<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/* Author: Jorge Torres
 * Description: Register controller class
 */
class Register extends CI_Controller{
	
	function __construct(){
		parent::__construct();
		$this->load->helper('url');
	}
	
	public function page1($msg = null){

			$data['msg'] = $msg;
            $data['heading'] = "Page 1";
            $data['css1'] = "StyleSheet1";
			$data['css2'] = "p1";
			$data['css3'] = "";
            $this->load->view('common/header',$data);
            $this->load->view('common/mynav',$data);
			
            $this->load->view('page1/page1', $data);
        
        $this->load->view('common/footer1',$data);
	}

	public function process(){
		// Load the model
		$this->load->model('register_model');
		$result = $this->register_model->register_user();

		if($result['value'] == false)
		{
			$msg = '<font style=bold color=red>Email already exists.</font><br />';
			$this->page1($msg);
			//redirect('common/page/page1','refresh');
		}
		else
		{
			$this->format_email($result,'txt');
			$msg = 'registered';
			//redirect('register/register/page1','refresh');
			$this->page1($msg);
			//return true;
			
			
		}
	}

	public function format_email($info, $format){  
  
    //set the root  
    $root = $_SERVER['DOCUMENT_ROOT'].'webprogramming-linkedin';  
  
    //grab the template content  
    $template = file_get_contents($root.'/signup_template.'.$format);  
              
    //replace all the tags  
    $template = preg_replace('/{USERNAME}/', $info['username'], $template);  
    $template = preg_replace('/{EMAIL}/', $info['username'], $template);  
    $template = preg_replace('/{KEY}/', $info['key'], $template);  
    $template = preg_replace('/{SITEPATH}/','http://localhost/webprogramming-linkedin/index.php/register/register/', $template);  
          
            $var_str = var_export($template, true);
			/*$var = "<?php\n\n\$$template = $var_str;\n\n?>";*/
			file_put_contents('filename.txt', $var_str);
    //return the html of the template  
   //return $template;
  
	}  

	/*function send_email($info){  
          
    //format each email  
    $body = format_email($info,'html');  
    $body_plain_txt = format_email($info,'txt');  
  
    //setup the mailer  
    $transport = Swift_MailTransport::newInstance();  
    $mailer = Swift_Mailer::newInstance($transport);  
    $message = Swift_Message::newInstance();  
    $message ->setSubject('Welcome to Site Name');  
    $message ->setFrom(array('noreply@sitename.com' => 'Site Name'));  
    $message ->setTo(array($info['email'] => $info['username']));  
      
    $message ->setBody($body_plain_txt);  
    $message ->addPart($body, 'text/html');  
              
    $result = $mailer->send($message);    
      
      $var_str = var_export($body_plain_txt, true);
	$var = "<?php\n\n\$$body_plain_txt = $var_str;\n\n?>";
	file_put_contents('filename.txt', $var);
	return $result;
	}  */

}


?>
