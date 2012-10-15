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
require_once JPATH_ROOT.'/administrator/components/com_osmembership/legacy/view.php';
/**
 * HTML View class for OS Membership component
 *
 * @static
 * @package		Joomla
 * @subpackage	OS Membership
 * @since 1.0
 */
class OSMembershipViewRegister extends LegacyView
{
	function display($tpl = null)
	{			
		$layout = $this->getLayout() ;		
		if ($layout == 'confirmation') {
			$this->_displaySubscriptionConfirmation($tpl) ;
			return ;	
		}		
		$document = & JFactory::getDocument() ;
		$document->addScript(JURI::base(true).'/components/com_osmembership/assets/js/paymentmethods.js');		
		$db = & JFactory::getDBO();
		$user = & JFactory::getUser();
		$config = OSMembershipHelper::getConfig() ;						
		$userId = $user->get('id');		
		$Itemid = JRequest::getInt('Itemid');
		if (!$Itemid) 
		    $Itemid = OSMembershipHelper::getItemid() ;						
		$planId = JRequest::getInt('id', 0) ;				
		#Check to see whether this is a valid form or not		
		if (!$planId) {
		    $app = & JFactory::getApplication('site') ;
		    $app->redirect('index.php', JText::_('OSM_INVALID_MEMBERSHIP_PLAN'));
		}
				
	    $sql = 'SELECT * FROM #__osmembership_plans WHERE id='.$planId ;
		$db->setQuery($sql) ;
		$plan = $db->loadObject();
				
		if ($plan->published == 0) {
		    $app = JFactory::getApplication('site');
		    $app->redirect('index.php', JText::_('OSM_CANNOT_ACCESS_UNPUBLISHED_PLAN'));
		    return ;		            
		}        	
		$paymentMethod = JRequest::getVar('payment_method', os_payments::getDefautPaymentMethod(), 'post');	
		if (!$paymentMethod)
		    $paymentMethod = os_payments::getDefautPaymentMethod();
		
		$renewOptionId = JRequest::getInt('renew_option_id', 0) ;
		$upgradeOptionId = JRequest::getInt('upgrade_option_id', 0);
		$fromSubscriptionId = JRequest::getInt('from_subscription_id', 0) ;
		if ($renewOptionId) {
			$action = 'renew' ;			
			$message = $config->subscription_renew_form_msg ;						
		} elseif($upgradeOptionId) {
			$action = 'upgrade' ;
			$message = $config->subscription_upgrade_form_msg ;
		} else {
			$action = 'subscribe';
			$message = $config->subscription_form_msg ;								
		}				
		###############Payment Methods parameters###############################
		
		//Creditcard payment parameters		
		$x_card_num = JRequest::getVar('x_card_num', '', 'post');
		$expMonth =  JRequest::getVar('exp_month', date('m'), 'post') ;				
		$expYear = JRequest::getVar('exp_year', date('Y'), 'post') ;		
		$x_card_code = JRequest::getVar('x_card_code', '', 'post');
		$cardHolderName = JRequest::getVar('card_holder_name', '', 'post') ;
		$lists['exp_month'] = JHTML::_('select.integerlist', 1, 12, 1, 'exp_month', ' id="exp_month" ', $expMonth, '%02d') ;
		$currentYear = date('Y') ;
		$lists['exp_year'] = JHTML::_('select.integerlist', $currentYear, $currentYear + 10 , 1, 'exp_year', ' id="exp_year" ', $expYear) ;
		$options =  array() ;
		$cardTypes = explode(',', $config->enable_cardtypes);
		if (in_array('Visa', $cardTypes)) {
			$options[] = JHTML::_('select.option', 'Visa', JText::_('OSM_VISA_CARD')) ;			
		}
		if (in_array('MasterCard', $cardTypes)) {
			$options[] = JHTML::_('select.option', 'MasterCard', JText::_('OSM_MASTER_CARD')) ;
		}
		
		if (in_array('Discover', $cardTypes)) {
			$options[] = JHTML::_('select.option', 'Discover', JText::_('OSM_DISCOVER')) ;
		}		
		if (in_array('Amex', $cardTypes)) {
			$options[] = JHTML::_('select.option', 'Amex', JText::_('OSM_AMEX')) ;
		}		
		$lists['card_type'] = JHTML::_('select.genericlist', $options, 'card_type', ' class="inputbox" ', 'value', 'text') ;
		//Echeck
				
		$x_bank_aba_code = JRequest::getVar('x_bank_aba_code', '', 'post') ;
		$x_bank_acct_num = JRequest::getVar('x_bank_acct_num', '', 'post') ;
		$x_bank_name = JRequest::getVar('x_bank_name', '', 'post') ;
		$x_bank_acct_name = JRequest::getVar('x_bank_acct_name', '', 'post') ;				
		$options = array() ;
		$options[] = JHTML::_('select.option', 'CHECKING', JText::_('OSM_BANK_TYPE_CHECKING')) ;
		$options[] = JHTML::_('select.option', 'BUSINESSCHECKING', JText::_('OSM_BANK_TYPE_BUSINESSCHECKING')) ;
		$options[] = JHTML::_('select.option', 'SAVINGS', JText::_('OSM_BANK_TYPE_SAVINGS')) ;
		$lists['x_bank_acct_type'] = JHTML::_('select.genericlist', $options, 'x_bank_acct_type', ' class="inputbox" ', 'value', 'text', JRequest::getVar('x_bank_acct_type')) ;
								
		//IDEAL Mollie payment plugin support
		$idealEnabled = OSMembershipHelper::idealEnabled() ;
				
		if ($idealEnabled) {
			$bankLists = OSMembershipHelper::getBankLists() ;
			$options = array() ;
			foreach ($bankLists as $bankId => $bankName) {
				$options[] = JHTML::_('select.option', $bankId, $bankName) ;
			}
			$lists['bank_id'] = JHTML::_('select.genericlist', $options, 'bank_id', ' class="inputbox" ', 'value', 'text', JRequest::getInt('bank_id'));
		}				
		//Form Fields
		if (JRequest::getVar('first_name', '', 'post')) {			
			$loadFromProfile = false ;						
		} else {
			$loadFromProfile = true ;
		}								
		$jcFields = new OSMFields($planId, $loadFromProfile);										
		list($fields, $fieldsOutput) = $jcFields->getFields();
		$validations = $jcFields->renderJSValidation();									
		$this->assignRef('validations', $validations) ;
		$this->assignRef('fields', $fields) ;			
		$this->assignRef('fieldsOutput', $fieldsOutput) ;					
		//Coupon processing
		$enableCoupon = $config->enable_coupon ;
		$errorCoupon = JRequest::getVar('error_coupon', 0);				
		$couponCode = JRequest::getVar('coupon_code') ;				
		//Registration Information		
		$registrationErrorCode = JRequest::getVar('registration_error_code', 0);
		$username = JRequest::getVar('username') ;
		$password = JRequest::getVar('password');		
		if ($plan->recurring_subscription) {
			$onlyRecurring = 1 ;
		} else {
			$onlyRecurring = 0 ;
		}
		if ($action == 'renew' || $action =='upgrade') {
			$methods = os_payments::getPaymentMethods(false, $onlyRecurring) ;
		} else {
			$methods = os_payments::getPaymentMethods(true, $onlyRecurring) ;
		}															
		if ($action == 'renew') {
			if ($renewOptionId == OSM_DEFAULT_RENEW_OPTION_ID) {
				$sql = 'SELECT b.price FROM #__osmembership_subscribers AS a INNER JOIN #__osmembership_plans AS b '
					.  'ON a.plan_id = b.id '
					.  'WHERE a.id='.$fromSubscriptionId								
				;
				$db->setQuery($sql);
				$amount = $db->loadResult() ;
			} else {
				$sql = 'SELECT * FROM #__osmembership_renewrates WHERE id='.$renewOptionId ;
				$db->setQuery($sql) ;
				$rate = $db->loadObject();
				$amount = $rate->price ;
			}	
			
			if ($renewOptionId == OSM_DEFAULT_RENEW_OPTION_ID) {
				$numberDays = $plan->subscription_length ;
			} else {
				$sql = 'SELECT number_days FROM #__osmembership_renewrates WHERE id='.$renewOptionId ;
				$db->setQuery($sql);
				$numberDays = $db->loadResult();
			}
			$message = str_replace('[PLAN_TITLE]', $plan->title, $message) ;
			$message = str_replace('[AMOUNT]', OSMembershipHelper::formatCurrency($amount, $config), $message) ;
			$message = str_replace('[NUMBER_DAYS]', $numberDays, $message) ;						
		} elseif ($action == 'upgrade') {
			$sql = 'SELECT * FROM #__osmembership_upgraderules WHERE id='.$upgradeOptionId ;
			$db->setQuery($sql) ;
			$upgradeRule = $db->loadObject() ;
			$amount = $upgradeRule->price ;
			
			$sql = 'SELECT b.title FROM #__osmembership_upgraderules AS a INNER JOIN #__osmembership_plans AS b ON a.from_plan_id=b.id WHERE a.id='.$upgradeOptionId ;
			$db->setQuery($sql);
			$fromPlan = $db->loadResult();
			$message = str_replace('[PLAN_TITLE]', $plan->title, $message) ;
			$message = str_replace('[AMOUNT]', OSMembershipHelper::formatCurrency($amount, $config), $message) ;
			$message = str_replace('[FROM_PLAN_TITLE]', $fromPlan, $message) ;
			
		} else {
			$amount = $plan->price ;
			$message = str_replace('[PLAN_TITLE]', $plan->title, $message) ;
			$message = str_replace('[AMOUNT]', OSMembershipHelper::formatCurrency($amount, $config), $message) ;
		}																		
		//Assign variables to template
		$this->assignRef('userId', $userId) ;				
		$this->assignRef('paymentMethod', $paymentMethod);
		$this->assignRef('amount', $amount);		
		$this->assignRef('lists', $lists);		
		$this->assignRef('Itemid', $Itemid);
		$this->assignRef('config', $config);								
		$this->assignRef('x_card_num', $x_card_num);
		$this->assignRef('x_card_code', $x_card_code);
		$this->assignRef('cardHolderName', $cardHolderName) ;

		$this->assignRef('x_bank_aba_code', $x_bank_aba_code) ;
		$this->assignRef('x_bank_acct_num', $x_bank_acct_num) ;
		$this->assignRef('x_bank_name', $x_bank_name) ;
		$this->assignRef('x_bank_acct_name', $x_bank_acct_name) ;
				
		$this->assignRef('planId', $planId) ;				
		$this->assignRef('plan', $plan) ;											
		$this->assignRef('methods', $methods) ;
		$this->assignRef('idealEnabled', $idealEnabled) ;
		
		
		$this->assignRef('enableCoupon', $enableCoupon) ;	
		$this->assignRef('errorCoupon', $errorCoupon) ;	
		$this->assignRef('couponCode', $couponCode) ;
		
		$this->assignRef('username', $username) ;
		$this->assignRef('password', $password) ;
		$this->assignRef('registrationErrorCode', $registrationErrorCode) ;
		
		
		//Incase upgrade
		$this->assignRef('action', $action) ;
		$this->assignRef('fromSubscriptionId', $fromSubscriptionId) ;
		$this->assignRef('renewOptionId', $renewOptionId) ;
		$this->assignRef('upgradeOptionId', $upgradeOptionId) ;	
		$this->assignRef('message', $message) ;	
							
		parent::display($tpl);					
	}	
	/**
	 * Display subscription confirmation page
	 * @param string $tpl
	 */
		
	function _displaySubscriptionConfirmation($tpl) {					
		$db = & JFactory::getDBO();
		$user = & JFactory::getUser();
		$userId = $user->get('id');
		$config = OSMembershipHelper::getConfig() ;
		$Itemid = JRequest::getInt('Itemid') ;
		$planId = JRequest::getInt('plan_id', 0) ;
		$action = JRequest::getVar('act', '') ;
		$fromSubscriptionId = JRequest::getInt('from_subscription_id', 0) ;
		$renewOptionId = JRequest::getInt('renew_option_id') ;
		$upgradeOptionId = JRequest::getInt('upgrade_option_id') ; 
		

		#Payment method parameters
		$paymentMethod = JRequest::getVar('payment_method', '', 'post');
		$method = os_payments::getPaymentMethod($paymentMethod) ;
		
		#Creditcard payment methods				
		$x_card_num = JRequest::getVar('x_card_num', '', 'post');
		$expMonth = JRequest::getVar('exp_month', '', 'post') ;
		$expYear = JRequest::getVar('exp_year', '', 'post') ;
		$x_card_code = JRequest::getVar('x_card_code', '', 'post');
		$cardHolderName =  JRequest::getVar('card_holder_name', '') ;
		$cardType =  JRequest::getVar('card_type', '') ;
		$x_exp_date = str_pad($expMonth, 2, '0', STR_PAD_LEFT).'/'.substr($expYear, 2, 2) ;
		#Echeck		
		$x_bank_aba_code = JRequest::getVar('x_bank_aba_code', '', 'post') ;
		$x_bank_acct_num = JRequest::getVar('x_bank_acct_num', '', 'post') ;
		$x_bank_name = JRequest::getVar('x_bank_name', '', 'post') ;
		$x_bank_acct_name = JRequest::getVar('x_bank_acct_name', '', 'post') ;
		$x_bank_acct_type = JRequest::getVar('x_bank_acct_type', '', 'post') ;		
		#Ideal Mollie
		$bankId = JRequest::getVar('bank_id');
		
		
		$sql = 'SELECT * FROM #__osmembership_plans WHERE id='.$planId ;
		$db->setQuery($sql) ;
		$plan = $db->loadObject();
		
		
		if ($action == 'renew') {
			if ($renewOptionId == OSM_DEFAULT_RENEW_OPTION_ID) {
				$sql = 'SELECT b.price FROM #__osmembership_subscribers AS a INNER JOIN #__osmembership_plans AS b '
				.  'ON a.plan_id = b.id '
				.  'WHERE a.id='.$fromSubscriptionId
				;
				$db->setQuery($sql);
				$amount = $db->loadResult() ;
			} else {
				$sql = 'SELECT * FROM #__osmembership_renewrates WHERE id='.$renewOptionId ;
				$db->setQuery($sql) ;
				$rate = $db->loadObject();
				$amount = $rate->price ;
			}			
		} elseif ($action == 'upgrade') {
			$sql = 'SELECT * FROM #__osmembership_upgraderules WHERE id='.$upgradeOptionId ;
			$db->setQuery($sql) ;
			$upgradeRule = $db->loadObject() ;
			$amount = $upgradeRule->price ;
		} else {
			$amount = $plan->price ;
		}										
		//Coupon discount
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
				
		$jcFields = new OSMFields($planId);					
		$confirmation = $jcFields->renderConfirmation();
		$hidden = $jcFields->renderHiddenFields();
		$this->assignRef('confirmation', $confirmation);
		$this->assignRef('hidden', $hidden);		
		$grossAmount = $amount - $discount + $tax ;
				
		//Replace messages
		switch ($action) {
			case 'upgrade' :
				$sql = 'SELECT b.title FROM #__osmembership_subscribers AS a INNER JOIN #__osmembership_plans AS b ON a.plan_id = b.id WHERE a.id='.$fromSubscriptionId;
				$db->setQuery($sql) ;
				$planTitle = $db->loadResult() ;
				$message = $config->subscription_upgrade_confirmation_message ;
				$message = str_replace('[TO_PLAN_TITLE]', $plan->title, $message) ;
				$message = str_replace('[PLAN_TITLE]', $planTitle, $message) ;
				break ;
			case 'renew' :
				if ($renewOptionId == OSM_DEFAULT_RENEW_OPTION_ID) {
					$numberDays = $plan->subscription_length ;	
				} else {
					$sql = 'SELECT number_days FROM #__osmembership_renewrates WHERE id='.$renewOptionId ;
					$db->setQuery($sql);
					$numberDays = $db->loadResult();
				}				
				$message = $config->subscription_renew_confirmation_message ;
				$message = str_replace('[PLAN_TITLE]', $plan->title, $message) ;
				$message = str_replace('[AMOUNT]', OSMembershipHelper::formatCurrency($grossAmount, $config), $message) ;
				$message = str_replace('[NUMBER_DAYS]', $numberDays, $message) ;
				break ;
			default :
				$message = $config->subscription_confirmation_message ;
				$message = str_replace('[PLAN_TITLE]', $plan->title, $message) ;
				$message = str_replace('[AMOUNT]', OSMembershipHelper::formatCurrency($grossAmount, $config), $message) ;
				break ;
		}
		
		
		$captchaInvalid = JRequest::getInt('captcha_invalid', 0);		
		$couponCode = JRequest::getVar('coupon_code', '') ;
		$username = JRequest::getVar('username', '', 'post') ;
		$password = JRequest::getVar('password1', '', 'post') ;
				
		//Assign these parameters
		$this->assignRef('userId', $userId) ;		
		$this->assignRef('amount', $amount);		
		$this->assignRef('discount', $discount) ;
		$this->assignRef('tax', $tax) ;
		$this->assignRef('grossAmount', $grossAmount) ;
				
		$this->assignRef('Itemid', $Itemid);
		$this->assignRef('config', $config);		
		$this->assignRef('plan', $plan) ;
		$this->assignRef('action', $action) ;
		$this->assignRef('fromSubscriptionId', $fromSubscriptionId) ;		
		$this->assignRef('renewOptionId', $renewOptionId) ;
		$this->assignRef('upgradeOptionId', $upgradeOptionId) ;		
		
		$this->assignRef('paymentMethod', $paymentMethod);
		$this->assignRef('method', $method) ;
		$this->assignRef('x_card_num', $x_card_num);
		$this->assignRef('x_card_code', $x_card_code);
		$this->assignRef('x_exp_date', $x_exp_date) ;
		$this->assignRef('expMonth', $expMonth) ;
		$this->assignRef('expYear', $expYear) ;
		$this->assignRef('cardType', $cardType) ;
		$this->assignRef('cardHolderName', $cardHolderName) ;
		$this->assignRef('bankId', $bankId) ;
		
		//Echeck support
		$this->assignRef('x_bank_aba_code', $x_bank_aba_code) ;
		$this->assignRef('x_bank_acct_num', $x_bank_acct_num) ;
		$this->assignRef('x_bank_name', $x_bank_name) ;
		$this->assignRef('x_bank_acct_name', $x_bank_acct_name) ;
		$this->assignRef('x_bank_acct_type', $x_bank_acct_type) ;
								
		$this->assignRef('captchaInvalid', $captchaInvalid) ;
		$this->assignRef('couponCode', $couponCode) ;
		$this->assignRef('username', $username) ;
		$this->assignRef('password', $password) ;		
		$this->assignRef('message', $message) ;

		parent::display($tpl);
	}
}