<?php
/**
 * @version		1.5.0
 * @package		Joomla
 * @subpackage	OS Membership
 * @author  Tuan Pham Ngoc
 * @copyright	Copyright (C) 2012 Ossolution Team
 * @license		GNU/GPL, see LICENSE.php
 */
// Check to ensure this file is included in Joomla!
defined('_JEXEC') or die ;

require_once JPATH_ROOT.'/administrator/components/com_osmembership/legacy/model.php';
/**
 * OS Membership Component Register Model
 *
 * @package		Joomla
 * @subpackage	OS Membership
 * @since 1.5
 */
class OSMembershipModelRegister extends LegacyModel
{					
	/**
	 * Constructor
	 *
	 * @since 1.5
	 */
	function __construct()
	{
		parent::__construct();				
	}	
	/**
	 * Process Subscription 
	 *
	 * @param array $data
	 */
	function processSubscription($data) {		
		jimport('joomla.user.helper') ;				
		$db = & JFactory::getDBO();	
		$config = OSMembershipHelper::getConfig() ;		
		$user = & JFactory::getUser();
		$userId = $user->get('id');
		if (!$userId && $config->registration_integration) {
			//Store user account into Joomla users database
			$userId = OSMembershipHelper::saveRegistration($data);
		}						
		$data['transaction_id'] = strtoupper(JUserHelper::genRandomPassword(16));
		$row = JTable::getInstance('OsMembership', 'Subscriber');
		$row->bind($data);
		$row->published = 0;		
		$row->created_date = date('Y-m-d H:i:s') ;
		$row->user_id = $userId ; 		
		while(true) {
			$subscriptionCode = JUserHelper::genRandomPassword(10) ;
			$sql = 'SELECT COUNT(*) FROM #__osmembership_subscribers WHERE subscription_code="'.$subscriptionCode.'"';
			$this->_db->setQuery($sql) ;
			$total = $this->_db->loadResult();
			if (!$total)
				break ;
		}
		$row->subscription_code = $subscriptionCode ;
		$sql = 'SELECT * FROM #__osmembership_plans WHERE id='.(int)$data['plan_id'];
		$db->setQuery($sql) ;
		$rowPlan = $db->loadObject() ;					
				
		$action = $data['act'] ;				
		if ($action == 'renew') {
			$renewOptionId = (int) $data['renew_option_id'];
			if ($renewOptionId == OSM_DEFAULT_RENEW_OPTION_ID) {
				$amount = $rowPlan->price ;
				$length = $rowPlan->subscription_length ;				
			} else {
				$sql = 'SELECT number_days, price  FROM #__osmembership_renewrates WHERE id='.(int)$data['renew_option_id'] ;
				$db->setQuery($sql) ;
				$rate = $db->loadObject();
				$amount = $rate->price ;								
				$length = $rate->number_days ;
			}								
			$sql = 'SELECT MAX(to_date) FROM #__osmembership_subscribers WHERE user_id='.$row->user_id.' AND plan_id='.$row->plan_id.' AND published=1';
			$db->setQuery($sql);
			$maxDate = $db->loadResult();
			if ($maxDate) {
				$fromTime = strtotime($maxDate) + 24*3600 ;
				$toTime = $fromTime + $length*24*3600;
				$row->from_date = date('Y-m-d H:i:s', $fromTime);
				$row->to_date = date('Y-m-d H:i:s', $toTime);
			} else {
				$row->from_date = date('Y-m-d H:i:s');
				$row->to_date = date('Y-m-d H:i:s', time() + $length*24*3600);
			}			
		} elseif ($action == 'upgrade') {
			$sql = 'SELECT price FROM #__osmembership_upgraderules WHERE id='.(int)$data['upgrade_option_id'] ;
			$db->setQuery($sql) ;			
			$amount = $db->loadResult() ;
			$length = $rowPlan->subscription_length ;
						
			$sql = 'SELECT MAX(to_date) FROM #__osmembership_subscribers WHERE user_id='.$row->user_id.' AND plan_id='.$row->plan_id.' AND published=1';
			$db->setQuery($sql);
			$maxDate = $db->loadResult();
			if ($maxDate) {
				$fromTime = strtotime($maxDate) + 24*3600 ;
				$toTime = $fromTime + $length*24*3600;
				$row->from_date = date('Y-m-d H:i:s', $fromTime);
				$row->to_date = date('Y-m-d H:i:s', $toTime);
			} else {
				$row->from_date = date('Y-m-d H:i:s');
				$row->to_date = date('Y-m-d H:i:s', time() + $length*24*3600);
			}			
		} else {
			$amount = $rowPlan->price ;
			$length = $rowPlan->subscription_length ;			
			if ($row->user_id > 0) {
				$sql = 'SELECT MAX(to_date) FROM #__osmembership_subscribers WHERE user_id='.$row->user_id.' AND plan_id='.$row->plan_id.' AND published=1';
				$db->setQuery($sql);				
				$maxDate = $db->loadResult();								
				if ($maxDate) {
					$fromTime = strtotime($maxDate) + 24*3600 ;
					$toTime = $fromTime + $length*24*3600;
					$row->from_date = date('Y-m-d H:i:s', $fromTime);
					$row->to_date = date('Y-m-d H:i:s', $toTime);
				} else {
					$row->from_date = date('Y-m-d H:i:s');
					$row->to_date = date('Y-m-d H:i:s', time() + $length*24*3600);
				}
			} else {
				$row->from_date = date('Y-m-d H:i:s');
				$row->to_date = date('Y-m-d H:i:s', time() + $length*24*3600);
			}						
		}		
		//Canculate tax amount, gross amount...		
		$session = & JFactory::getSession() ;
		$couponId = $session->get('osm_coupon_id', 0);
		$discount = 0 ;
		
		if ($couponId) {
			$sql = 'SELECT * FROM #__osmembership_coupons WHERE id='.$couponId;
			$db->setQuery($sql) ;
			$coupon = $db->loadObject();
			if ($coupon) {
				if ($coupon->coupon_type == 0) {
					$discount = $discount + $amount*$coupon->discount/100 ;
				} else {
					$discount = $discount + $coupon->discount ;
				}
			}
		}
		
		if ($config->enable_tax && $config->tax_rate > 0)
			$tax = round(($amount - $discount)*$config->tax_rate/100, 2) ;
		else
			$tax = 0 ;

		$grossAmount = $amount - $discount + $tax ;
		$row->amount = $amount ;
		$row->discount_amount = $discount ;
		$row->tax_amount = $tax ;
		$row->coupon_id = $couponId ;
		$row->gross_amount = $grossAmount ;				
		$row->store();																																			
		$data['amount'] = $grossAmount ;
		//Clear the session
		$session->clear('osm_coupon_id');					
		$jcFields = new OSMFields($row->plan_id);
		$jcFields->saveFieldValues($row->id) ;
		JPluginHelper::importPlugin( 'osmembership' );
		$dispatcher =& JDispatcher::getInstance();
		$dispatcher->trigger( 'onAfterStoreSubscription', array($row));
		
		if ($data['amount'] > 0) {		    			    			    		    		    	
    		switch ($action) {
    			case 'renew' :
    				$itemName = JText::_('OSM_PAYMENT_FOR_RENEW_SUBSCRIPTION');
    				$itemName = str_replace('[PLAN_TITLE]', $rowPlan->title, $itemName);
    				break ;
    			case 'upgrade' :
    				$itemName = JText::_('OSM_PAYMENT_FOR_UPGRADE_SUBSCRIPTION');
    				$itemName = str_replace('[PLAN_TITLE]', $rowPlan->title, $itemName);
    				//Get from Plan Title
    				$sql = ' SELECT b.title FROM #__osmembership_subscribers AS a '
    					.' INNER JOIN #__osmembership_plans AS b '
    					.' ON a.plan_id = b.id '
    					.' WHERE a.id = '.$row->from_subscription_id     				    				
    				;
    				$db->setQuery($sql) ;
    				$fromPlanTitle = $db->loadResult() ;
    				$itemName = str_replace('[FROM_PLAN_TITLE]', $fromPlanTitle, $itemName);    				    				    				    			
    				break ;
    			default :    				
    				$itemName = JText::_('OSM_PAYMENT_FOR_SUBSCRIPTION');
    				$itemName = str_replace('[PLAN_TITLE]', $rowPlan->title, $itemName);
    				break ;    				
    		}    		
    		$data['item_name'] = $itemName ;
    		$paymentMethod = $data['payment_method'];
    		require_once JPATH_COMPONENT.'/plugins/'.$paymentMethod.'.php';
    		$sql = 'SELECT params, support_recurring_subscription FROM #__osmembership_plugins WHERE name="'.$paymentMethod.'"';
    		$this->_db->setQuery($sql) ;
    		$plugin = $this->_db->loadObject();
    		$params = $plugin->params ;
    		$supportRecurring = $plugin->support_recurring_subscription ;    		    		    				  
    		$params = new JRegistry($params) ;    		   
    		$paymentClass = new $paymentMethod($params) ;  
    		if ($rowPlan->recurring_subscription && $supportRecurring) {
    			if ($paymentMethod == 'os_authnet') {
    				$paymentMethod = 'os_authnet_arb';
    				require_once JPATH_COMPONENT.'/plugins/'.$paymentMethod.'.php';
    				$paymentClass = new $paymentMethod($params) ;    				
    			}    			    			    			
    			$paymentClass->processRecurringPayment($row, $data);
    		} else {
    			$paymentClass->processPayment($row, $data);
    		}    		    		    		    		    		    		    			      		    
    	} else {
    	    $mainframe = & JFactory::getApplication() ;    	    
    	    $Itemid = JRequest::getInt('Itemid') ;
    	    $row->published = 1 ;
    	    $row->store();    	    
    	    if ($row->act == 'upgrade') {    	    	
    	    	OSMembershipHelper::processUpgradeMembership($row);
    	    }
    	    OSMembershipHelper::sendEmails($row, $config);
    	    JPluginHelper::importPlugin( 'osmembership' );
    	    $dispatcher =& JDispatcher::getInstance();
    	    $dispatcher->trigger( 'onMembershipActive', array($row));    	    	        	    			   			   			
    		$url = JRoute::_('index.php?option=com_osmembership&view=complete&act='.$row->act.'&subscription_code='.$row->subscription_code.'&Itemid='.$Itemid, false);    		    		    	
    		$mainframe->redirect($url);				
    	}										
	}
	/**
	 * Payment verification
	 */
	function paymentConfirm() {		
		$paymentMethod =  JRequest::getVar('payment_method', '');
		$method = os_payments::getPaymentMethod($paymentMethod) ;
		$method->verifyPayment();		 
	}

	function recurringPaymentConfirm() {
		$paymentMethod =  JRequest::getVar('payment_method', '');
		$method = os_payments::getPaymentMethod($paymentMethod) ;
		if ($method)
			$method->verifyRecurringPayment();
	}
} 