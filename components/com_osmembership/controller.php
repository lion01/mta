<?php
/**
* @version		1.0.0
* @package		Joomla
* @subpackage	OSMembership
* @author  Tuan Pham Ngoc
* @copyright	Copyright (C) 2012 Ossolution Team
* @license		GNU/GPL, see LICENSE.php
*/
// no direct access
defined( '_JEXEC' ) or die ;
require_once JPATH_ROOT.'/administrator/components/com_osmembership/legacy/controller.php';
/**
 * OS Membership controller
 * @package		Joomla
 * @subpackage	OSMembership
 * @since 1.5
 */
class OSMembershipController extends LegacyController
{
	/**
	 * Constructor function
	 *
	 * @param array $config
	 */
	function __construct($config = array())
	{
		parent::__construct($config);	
	}
	/**
	 * Display information
	 *
	 */
	function display( )
	{				
		$task = $this->getTask();
		$document = & JFactory::getDocument();
		$styleUrl = JURI::base(true).'/components/com_osmembership/assets/css/style.css';		
		$document->addStylesheet( $styleUrl, 'text/css', null, null );				
		switch ($task) {			
			case 'subscription_confirmation' :
				JRequest::setVar('view', 'register') ;
				JRequest::setVar('layout', 'confirmation') ;
				break ;
			default:
				$view = JRequest::getVar('view', '') ;
				if (!$view) {
					JRequest::setVar('view', 'plans') ;
					JRequest::setVar('layout', 'default') ;
				}
				break ;
		}

		
		parent::display();
	}
	/**
	 *Perform renew membership 
	 */	
	function renew_membership() {		
		$renewOptionId = JRequest::getInt('renew_option_id') ;	
		$fromSubscriptionId = JRequest::getInt('from_subscription_id', 0) ;	
		$ret = OSMembershipHelper::canRenewMembership($renewOptionId, $fromSubscriptionId);
		if ($ret) {
			$db  = & JFactory::getDbo() ;
			if ($renewOptionId == OSM_DEFAULT_RENEW_OPTION_ID) {
				$sql = 'SELECT b.id FROM #__osmembership_subscribers AS a INNER JOIN #__osmembership_plans AS b '
				.  'ON a.plan_id = b.id '
				.  'WHERE a.id='.$fromSubscriptionId
				;
				$db->setQuery($sql);
				$planId = (int) $db->loadResult() ;
				JRequest::setVar('id', $planId) ;
			} else {
				$sql = 'SELECT * FROM #__osmembership_renewrates WHERE id='.$renewOptionId;
				$db->setQuery($sql) ;
				$rate = $db->loadObject() ;
				//Set Plan ID
				JRequest::setVar('id', $rate->plan_id) ;
			}			
			JRequest::setVar('view', 'register') ;
			JRequest::setVar('layout', 'default') ;
			$this->display() ;			
		} else {
			JFactory::getApplication()->redirect('index.php', JText::_('OSM_INVALID_RENEW_MEMBERSHIP_OPTION'));
		}				
	}
		
	function upgrade_membership() {
		$upgradeOptionId = JRequest::getInt('upgrade_option_id') ;
		$fromSubscriptionId = JRequest::getInt('from_subscription_id', 0) ;
		$ret = OSMembershipHelper::canUpgradeMembership($upgradeOptionId, $fromSubscriptionId);
		if ($ret) {
			$db  = & JFactory::getDbo() ;
			$sql = 'SELECT * FROM #__osmembership_upgradeRules WHERE id='.$upgradeOptionId;
			$db->setQuery($sql) ;
			$upgradeRule = $db->loadObject() ;
			//Set Plan ID
			JRequest::setVar('id', $upgradeRule->to_plan_id) ;
			JRequest::setVar('view', 'register') ;
			JRequest::setVar('layout', 'default') ;
			$this->display() ;
		} else {
			JFactory::getApplication()->redirect('index.php', JText::_('OSM_INVALID_RENEW_MEMBERSHIP_OPTION'));
		}
	}	
	/**
	 * Subscription confirmation
	 */		
	function subscription_confirmation() {
		$session = & JFactory::getSession() ;
		$db = & JFactory::getDbo() ;
		//Check data to make sure
		$couponCode = JRequest::getVar('coupon_code');
		$username =  JRequest::getVar('username', '', 'post', 'string');
		$password = JRequest::getVar('password1', '', 'post');
		$email = JRequest::getVar('email', '', 'post');
		$errorCoupon = false ;
		$errorRegistration = false ;
		$registrationErrorCode = 0 ;
	
		if ($couponCode) {
			$where = array() ;
			$planId = JRequest::getInt('plan_id', 0);
			$where[] = 'published = 1' ;
			$where[] = ' code="'.$couponCode.'" ' ;
			$where[] = ' (valid_from="'.$db->getNullDate().'" OR DATE(valid_from) <= CURDATE()) ' ;
			$where[] = ' (valid_to="'.$db->getNullDate().'" OR DATE(valid_to) >= CURDATE()) ';
			$where[] = ' (times = 0 OR times > used)' ;
			$where[] = ' (plan_id=0 OR plan_id='.$planId.')' ;
			$sql = 'SELECT * FROM #__osmembership_coupons WHERE '.implode(' AND ', $where);
			$db->setQuery($sql) ;
			$rowCoupon = $db->loadObject();
			if ($rowCoupon) {
				$session->set('osm_coupon_id', $rowCoupon->id) ;
			} else {
				$errorCoupon = true ;
			}
		} else {
			$session->set('osm_coupon_id', 0);
		}
	
	
		if (strlen($username) && strlen($password)) {
			//This user want to register for a new account
			$sql = 'SELECT COUNT(id) FROM #__users WHERE username="'.$username.'"';
			$db->setQuery($sql) ;
			$total = $db->loadResult();
			if ($total) {
				$errorRegistration = true ;
				$registrationErrorCode = 1 ;
			} else {
				//Check email
				$sql = 'SELECT COUNT(id) FROM #__users WHERE email="'.$email.'"';
				$db->setQuery($sql) ;
				$total = $db->loadResult();
				if ($total) {
					$errorRegistration = true ;
					$registrationErrorCode = 2 ;
				}
			}
		}
			
		if ($errorCoupon || $errorRegistration) {			
			JRequest::setVar('error_coupon', $errorCoupon);
			JRequest::setVar('error_registration', $errorRegistration);
			JRequest::setVar('registration_error_code', $registrationErrorCode);
			JRequest::setVar('view', 'register');
			JRequest::setVar('layout', 'default');
			JRequest::setVar('id', JRequest::getInt('plan_id'));
			$this->execute('display') ;
			return ;
		} else {
			$this->display() ;
		}
	}		
	/**
	 * Process subscription
	 */		
	function process_subscription() {
		JRequest::checkToken() or jexit( 'Invalid Token' );
		$db = & JFactory::getDbo() ;
		//We will need to check
		$config = OSMembershipHelper::getConfig() ;
		if ($config->enable_captcha) {
			$session = & JFactory::getSession() ;
			$securityCode = JRequest::getVar('security_code', '', 'post');			
			if ($securityCode != $session->get('osm_security_code')) {
				JRequest::setVar('view', 'register');
				JRequest::setVar('layout', 'confirmation');
				JRequest::setVar('captcha_invalid', 1);
								
				$this->display() ;
				return ;
			}
		}		
						
		$post = JRequest::get('post', JREQUEST_ALLOWHTML) ;
		$model = & $this->getModel('Register') ;
		$model->processSubscription($post) ;		
	}	
	
	function payment_confirm() {		
		$model = & $this->getModel('Register');
		$model->paymentConfirm();
	}
	
	function recurring_payment_confirm() {
		$model = & $this->getModel('register');
		$model->recurringPaymentConfirm();
	}
	/**
	 * Show captcha image, using in the captcha form
	 */
	function show_captcha_image() {
		header("Cache-Control: no-cache, must-revalidate"); // HTTP/1.1
		header("Expires: Sat, 26 Jul 1997 05:00:00 GMT"); //
		while (@ob_end_clean());
		require_once JPATH_COMPONENT.'/helper/captcha.php';
		$captcha = new CaptchaSecurityImages();
		
		JFactory::getApplication()->close();		
	}	
}