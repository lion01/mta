<?php
/**
* @version		1.1.1
* @package		Joomla
* @subpackage	OS Membership
* @author  Tuan Pham Ngoc
* @copyright	Copyright (C) 2012 Ossolution Team
* @license		GNU/GPL, see LICENSE.php
*/
// no direct access
defined( '_JEXEC' ) or die ;

class OSMembershipHelper {
	/**
	 * Get configuration data and store in config object
	 *
	 * @return object
	 */
	function getConfig() {
		static $config ;
		if (!$config) {
			$db = & JFactory::getDBO();
			$config = new stdClass ;
			$sql = 'SELECT * FROM #__osmembership_configs';
			$db->setQuery($sql);
			$rows = $db->loadObjectList();
			for ($i = 0 , $n = count($rows); $i < $n; $i++) {
				$row = $rows[$i];
				$key = $row->config_key;
				$value = stripslashes($row->config_value);				
				$config->$key = $value;	
			}
		}		
		return $config;
	}					
	/**
	 * Get specify config value
	 *
	 * @param string $key
	 */
	function getConfigValue($key) {
		$db = & JFactory::getDBO() ;
		$sql = 'SELECT config_value FROM #__osmembership_configs WHERE config_key="'.$key.'"';
		$db->setQuery($sql) ;		
		return $db->loadResult();
	}	
	/**
	 * Load bootstrap lib
	 */
	public static function loadBootstrap($loadJs = true) {
		$document = JFactory::getDocument();
		if ($loadJs) {
			$document->addScript(JUri::root().'administrator/components/com_osmembership/assets/bootstrap/js/jquery.min.js') ;
			$document->addScript(JUri::root().'administrator/components/com_osmembership/assets/bootstrap/js/jquery-noconflict.js') ;
			$document->addScript(JUri::root().'administrator/components/com_osmembership/assets/bootstrap/js/bootstrap.min.js') ;
		}		
		$document->addStyleSheet(JURI::root().'administrator/components/com_osmembership/assets/bootstrap/css/bootstrap.css');
	}
	/**
	 * Get Itemid of OS Membership Componnent
	 *
	 * @return int
	 */
	function getItemid() {
		$db = & JFactory::getDBO();
		$user = & JFactory::getUser() ;
		$sql = "SELECT id FROM #__menu WHERE link LIKE '%index.php?option=com_osmembership%' AND published=1 AND `access` IN (".implode(',', $user->getAuthorisedViewLevels()).") ORDER BY `access`";			
		$db->setQuery($sql) ;
		$itemId = $db->loadResult();		
		if (!$itemId) {
			$Itemid = JRequest::getInt('Itemid');
			if ($Itemid == 1)
				$itemId = 999999 ;
			else 
				$itemId = $Itemid ;	
		}			
		return $itemId ;	
	}		
	/**
	 * Check to see whether the ideal payment plugin installed and activated
	 * @return boolean
	 */
	function idealEnabled() {
		$db = & JFactory::getDBO();
		$sql = 'SELECT COUNT(id) FROM #__osmembership_plugins WHERE name="os_ideal" AND published=1';
		$db->setQuery($sql) ;
		$total = $db->loadResult() ;
		if ($total) {
			require_once JPATH_ROOT.'/components/com_osmembership/plugins/ideal/ideal.class.php';
			return true ;
		} else {
			return false ;
		}
	}
	/**
	 * Get list of banks for ideal payment plugin
	 * @return array
	 */
	function getBankLists() {
		$idealPlugin = os_payments::loadPaymentMethod('os_ideal');		
		$params = new JRegistry($idealPlugin->params) ;		
		$partnerId = $params->get('partner_id');
		$ideal = new iDEAL_Payment($partnerId) ;
		$bankLists = $ideal->getBanks();
		return $bankLists ;
	}
	/**
	 * Get country code
	 *
	 * @param string $countryName
	 * @return string
	 */
	function getCountryCode($countryName) {
		$db = & JFactory::getDBO() ;
		$sql = 'SELECT country_2_code FROM #__osmembership_countries WHERE LOWER(name)="'.JString::strtolower($countryName).'"';
		$db->setQuery($sql) ;
		$countryCode = $db->loadResult();
		if (!$countryCode)
			$countryCode = 'US' ;
		return $countryCode ;
	}	
	/**
	 * Load language from main component
	 *
	 */
	function loadLanguage() {
		static $loaded ;
		if (!$loaded) {
			$lang = & JFactory::getLanguage() ;
			$tag = $lang->getTag();
			if (!$tag)
				$tag = 'en-GB' ;			
			$lang->load('com_osmembership', JPATH_ROOT, $tag);
			$loaded = true ;	
		}		
	}		
	/**
	 * Display copy right information
	 *
	 */
	function displayCopyRight() {		
		echo '<div class="copyright" style="text-align:center;margin-top: 5px;"><a href="http://joomdonation.com/components/membership-pro.html" target="_blank"><strong>Membership Pro</strong></a> version 1.5.0, Copyright (C) 2010-2012 <a href="http://joomdonation.com" target="_blank"><strong>Ossolution Team</strong></a></div>' ;
	}
	/**
	 * Get active membership plans
	 */		
	function getActiveMembershipPlans($userId = 0) {
		$activePlans = array();
		$activePlans[] = 0 ;
		if (!$userId) {
			$user = & JFactory::getUser() ;
			$userId = $user->get('id');
		}		
		if ($userId > 0) {			
			$db = & JFactory::getDBO() ;
			$sql = 'SELECT plan_id FROM #__osmembership_subscribers WHERE user_id='.$userId.' AND DATE(from_date) <= CURDATE() AND DATE(to_date) >= CURDATE() and published=1';
			$db->setQuery($sql);
			if (version_compare(JVERSION, '3.0', 'ge'))
				$activePlans = array_merge($activePlans, $db->loadColumn()) ;
			else
				$activePlans = array_merge($activePlans, $db->loadResultArray()) ;
		}					
						
		return $activePlans ;
	}	
	/**
	 * Get total subscribers of a subscription plan based on status
	 * @param int $planId
	 * @param int $status
	 */	
	function countSubscribers($planId, $status = -1) {
		$db = & JFactory::getDBO() ;
		$where = array() ;
		$where[] = 'plan_id='.$planId ;
		if ($status != -1) {
			$where[] = 'published='.$status ;
		} 		
		$sql = 'SELECT COUNT(*) FROM #__osmembership_subscribers WHERE '.implode(' AND ', $where);
		$db->setQuery($sql) ;
		return (int) $db->loadResult();		
	}	
	/**
	 * Check to see whether the current user can renew his membership using the given option
	 * @param int $renewOptionId
	 * @return boolean
	 */		
	function canRenewMembership($renewOptionId, $fromSubscriptionId) {
		return true ;
	}
	/**
	 * Check to see whether the current user can upgrade his membership using the upgraded option
	 * @param int $upgradeOptionId
	 * @return boolean
	 */
	function canUpgradeMembership($upgradeOptionId, $fromSubscriptionId) {		
		return true ;	
	}	
	/**
	 * Upgrade a membership
	 * @param Object $row
	 */
	function processUpgradeMembership($row) {
		$rowSubscription = JTable::getInstance('OsMembership', 'Subscriber');
		$rowSubscription->load($row->from_subscription_id);
		$rowSubscription->to_date = date('Y-m-d H:i:s') ;
		$rowSubscription->published = 2 ;
		$rowSubscription->store();
		//Trigger plugins
		JPluginHelper::importPlugin( 'osmembership' );
		$dispatcher =& JDispatcher::getInstance();
		$dispatcher->trigger( 'onMembershipExpire', array($rowSubscription));
	}	
	/**
	 * Get next membership id for this subscriber
	 */
	function getMembershipId() {
		$db = JFactory::getDbo() ;
		$sql = 'SELECT MAX(membership_id) FROM #__osmembership_subscribers';
		$db->setQuery($sql);
		$membershipId = (int) $db->loadResult() ;
		if (!$membershipId) {
			$membershipId = (int) OSMembershipHelper::getConfigValue('membership_id_start_number');
			if (!$membershipId)
				$membershipId = 1000 ;
		} else {
			$membershipId++ ;
		}	
		
		return $membershipId ;
	}
	/**
	 * Send email to super administrator and user
	 *
	 * @param object $row
	 * @param object $config
	 */
	function sendEmails($row, $config) {
		if ($row->act == 'upgrade') {
			OSMembershipHelper::sendMembershipUpgradeEmails($row, $config) ;
			return ;
		} elseif ($row->act == 'renew') {
			OSMembershipHelper::sendMembershipRenewalEmails($row, $config) ;
			return ;
		}
		$jconfig = new JConfig();
		$db = & JFactory::getDBO();
		$fromEmail =  $jconfig->mailfrom;
		$fromName = $jconfig->fromname;
		$sql = "SELECT * FROM #__osmembership_plans WHERE id=".$row->plan_id ;
		$db->setQuery($sql) ;
		$plan = $db->loadObject();
		//Need to over-ridde some config options
		$emailContent = OSMembershipHelper::getEmailContent($config, $row);
		$replaces = array() ;
		$replaces['plan_title'] = $plan->title ;
		$replaces['first_name'] = $row->first_name ;
		$replaces['last_name'] = $row->last_name ;
		$replaces['organization'] = $row->organization ;
		$replaces['address'] = $row->address ;
		$replaces['address2'] = $row->address ;
		$replaces['city'] = $row->city ;
		$replaces['state'] = $row->state ;
		$replaces['zip'] = $row->zip ;
		$replaces['country'] = $row->country ;
		$replaces['phone'] = $row->phone ;
		$replaces['fax'] = $row->phone ;
		$replaces['email'] = $row->email ;
		$replaces['comment'] = $row->comment ;
		$replaces['amount'] = number_format($row->amount, 2) ;
		$replaces['discount_amount'] = number_format($row->discount_amount, 2) ;
		$replaces['tax_amount'] = number_format($row->tax_amount, 2) ;
		$replaces['gross_amount'] = number_format($row->gross_amount, 2) ;
								
		$replaces['from_date'] = JHTML::_('date', $row->from_date, $config->date_format);
		$replaces['to_date'] = JHTML::_('date', $row->to_date, $config->date_format);
		
		$replaces['transaction_id'] = $row->transaction_id ;
		if ($row->payment_method) {
			$replaces['payment_method'] = JText::_(os_payments::loadPaymentMethod($row->payment_method)->title) ;
		}		
		//Should we create map to custom fields
		$sql = 'SELECT field_id, field_value FROM #__osmembership_field_value WHERE subscriber_id = '.$row->id;
		$db->setQuery($sql) ;
		$rowValues = $db->loadObjectList();
		$sql = 'SELECT a.id, a.name FROM #__osmembership_fields AS a WHERE a.published=1 AND  (a.plan_id = 0 OR a.plan_id='.$row->plan_id.')';
		$db->setQuery($sql) ;
		$rowFields = $db->loadObjectList();
		$fields = array() ;
		for ($i = 0 , $n = count($rowFields) ; $i < $n ; $i++) {
			$rowField = $rowFields[$i] ;
			$fields[$rowField->id] = $rowField->name ;
		}
		for ($i = 0 , $n = count($rowValues) ; $i < $n ; $i++) {
			$rowValue = $rowValues[$i] ;
			$replaces[$fields[$rowValue->field_id]] = $rowValue->field_value ;
		}
		//Over-ridde email message		
		$subject = $config->user_email_subject;
		if ($row->payment_method == 'os_offline') {
			$body = $config->user_email_body_offline ;
		} else {
			$body = $config->user_email_body ;
		}
		$subject = str_replace('[PLAN_TITLE]', $plan->title, $subject) ;
		$body = str_replace('[SUBSCRIPTION_DETAIL]', $emailContent, $body) ;
		foreach ($replaces as $key=>$value) {
			$key = strtoupper($key) ;
			$body = str_replace("[$key]", $value, $body) ;
		}		
		if (version_compare(JVERSION, '3.0', 'ge')) {
			$j3 = true ;
			$mailer = new JMail() ;
		} else {
			$j3 = false ;
		}
		if ($j3)
			$mailer->sendMail($fromEmail, $fromName, $row->email, $subject, $body, 1);
		else
			JUtility::sendMail($fromEmail, $fromName, $row->email, $subject, $body, 1);
		//Send emails to notification emails
		if ($config->notification_emails == '')
			$notificationEmails = $fromEmail;
		else
			$notificationEmails = $config->notification_emails;
		$notificationEmails = str_replace(' ', '', $notificationEmails);
		$emails = explode(',', $notificationEmails);		
		$subject = $config->admin_email_subject ;
		$subject = str_replace('[PLAN_TITLE]', $plan->title, $subject) ;
		$body = $config->admin_email_body ;
		$body = str_replace('[SUBSCRIPTION_DETAIL]', $emailContent, $body);
		foreach ($replaces as $key=>$value) {
			$key = strtoupper($key) ;
			$body = str_replace("[$key]", $value, $body) ;
		}
		for ($i = 0, $n  = count($emails); $i < $n ; $i++) {
			$email = $emails[$i];
			if ($j3)
				$mailer->sendMail($fromEmail, $fromName, $email, $subject, $body, 1);
			else
				JUtility::sendMail($fromEmail, $fromName, $email, $subject, $body, 1);
		}
	}			
	/**
	 * Send emails when somone process membership renewal
	 * @param object $row
	 * @param object $config
	 */
	function sendMembershipRenewalEmails($row, $config) {
		$jconfig = new JConfig();
		$db = & JFactory::getDBO();
		$fromEmail =  $jconfig->mailfrom;
		$fromName = $jconfig->fromname;
		$sql = "SELECT * FROM #__osmembership_plans WHERE id=".$row->plan_id ;
		$db->setQuery($sql) ;
		$plan = $db->loadObject();
		if ($row->renew_option_id) {
			$numberDays = $row->subscription_length ;
		} else {
			$sql = 'SELECT number_days FROM #__osmembership_renewrates WHERE id='.$row->renew_option_id ;
			$db->setQuery($sql) ;
			$numberDays = $db->loadResult();
		}		
		//Need to over-ridde some config options
		$emailContent = OSMembershipHelper::getEmailContent($config, $row);
		$replaces = array() ;
		$replaces['plan_title'] = $plan->title ;
		$replaces['first_name'] = $row->first_name ;
		$replaces['last_name'] = $row->last_name ;
		$replaces['organization'] = $row->organization ;
		$replaces['address'] = $row->address ;
		$replaces['address2'] = $row->address ;
		$replaces['city'] = $row->city ;
		$replaces['state'] = $row->state ;
		$replaces['zip'] = $row->zip ;
		$replaces['country'] = $row->country ;
		$replaces['phone'] = $row->phone ;
		$replaces['fax'] = $row->phone ;
		$replaces['email'] = $row->email ;
		$replaces['comment'] = $row->comment ;
		$replaces['amount'] = number_format($row->amount, 2) ;
		$replaces['discount_amount'] = number_format($row->discount_amount, 2) ;
		$replaces['tax_amount'] = number_format($row->tax_amount, 2) ;
		$replaces['gross_amount'] = number_format($row->gross_amount, 2) ;
		$replaces['end_date'] = JHTML::_('date', $row->to_date, $config->date_format);
		$replaces['number_days'] = $numberDays ;
			
		$replaces['transaction_id'] = $row->transaction_id ;
		if ($row->payment_method) {
			$replaces['payment_method'] = JText::_(os_payments::loadPaymentMethod($row->payment_method)->title) ;
		}
		//Should we create map to custom fields
		$sql = 'SELECT field_id, field_value FROM #__osmembership_field_value WHERE subscriber_id = '.$row->id;
		$db->setQuery($sql) ;
		$rowValues = $db->loadObjectList();
		$sql = 'SELECT a.id, a.name FROM #__osmembership_fields AS a WHERE a.published=1 AND  (a.plan_id = 0 OR a.plan_id='.$row->plan_id.')';
		$db->setQuery($sql) ;
		$rowFields = $db->loadObjectList();
		$fields = array() ;
		for ($i = 0 , $n = count($rowFields) ; $i < $n ; $i++) {
			$rowField = $rowFields[$i] ;
			$fields[$rowField->id] = $rowField->name ;
		}
		for ($i = 0 , $n = count($rowValues) ; $i < $n ; $i++) {
			$rowValue = $rowValues[$i] ;
			$replaces[$fields[$rowValue->field_id]] = $rowValue->field_value ;
		}				
		$subject = $config->user_renew_email_subject ;				
		$subject = str_replace('[PLAN_TITLE]', $plan->title, $subject) ;
		$body = $config->user_renew_email_body ;
		$body = str_replace('[SUBSCRIPTION_DETAIL]', $emailContent, $body) ;

		
		foreach ($replaces as $key=>$value) {
			$key = strtoupper($key) ;
			$body = str_replace("[$key]", $value, $body) ;
		}
		
		if (version_compare(JVERSION, '3.0', 'ge')) {
			$j3 = true ;
			$mailer = new JMail() ;
		} else {
			$j3 = false ;
		}
		if ($j3) {
			$mailer->sendMail($fromEmail, $fromName, $row->email, $subject, $body, 1);
		} else {
			JUtility::sendMail($fromEmail, $fromName, $row->email, $subject, $body, 1);
		}				
		//Send emails to notification emails
		if ($config->notification_emails == '')
			$notificationEmails = $fromEmail;
		else
			$notificationEmails = $config->notification_emails;
		$notificationEmails = str_replace(' ', '', $notificationEmails);
		$emails = explode(',', $notificationEmails);
		$subject = $config->admin_renw_email_subject ;		
		$subject = str_replace('[PLAN_TITLE]', $plan->title, $subject) ;
		$body = $config->admin_renew_email_body ;
		$body = str_replace('[SUBSCRIPTION_DETAIL]', $emailContent, $body);
		foreach ($replaces as $key=>$value) {
			$key = strtoupper($key) ;
			$body = str_replace("[$key]", $value, $body) ;
		}
		for ($i = 0, $n  = count($emails); $i < $n ; $i++) {
			$email = $emails[$i];
			if ($j3) {
				$mailer->sendMail($fromEmail, $fromName, $email, $subject, $body, 1);
			} else {
				JUtility::sendMail($fromEmail, $fromName, $email, $subject, $body, 1);
			}			
		}
	}
	/**
	 * Send email when someone upgrade their membership 
	 * @param object $row
	 * @param object $config
	 */		
	function sendMembershipUpgradeEmails($row, $config) {
		$jconfig = new JConfig();
		$db = & JFactory::getDBO();
		$fromEmail =  $jconfig->mailfrom;
		$fromName = $jconfig->fromname;
		$sql = "SELECT * FROM #__osmembership_plans WHERE id=".$row->plan_id ;
		$db->setQuery($sql) ;
		$plan = $db->loadObject();
		
		//Get from plan title
		$sql = 'SELECT b.title FROM #__osmembership_upgraderules AS a INNER JOIN #__osmembership_plans AS b '
			.' ON a.from_plan_id = b.id '
			.' WHERE a.id='.$row->upgrade_option_id
				
		;
		$db->setQuery($sql) ;
		$planTitle = $db->loadResult();
		
		
		//Need to over-ridde some config options
		$emailContent = OSMembershipHelper::getEmailContent($config, $row);
		$replaces = array() ;
		$replaces['plan_title'] = $planTitle ;
		$replaces['to_plan_title'] = $plan->title ;
		$replaces['first_name'] = $row->first_name ;
		$replaces['last_name'] = $row->last_name ;
		$replaces['organization'] = $row->organization ;
		$replaces['address'] = $row->address ;
		$replaces['address2'] = $row->address ;
		$replaces['city'] = $row->city ;
		$replaces['state'] = $row->state ;
		$replaces['zip'] = $row->zip ;
		$replaces['country'] = $row->country ;
		$replaces['phone'] = $row->phone ;
		$replaces['fax'] = $row->phone ;
		$replaces['email'] = $row->email ;
		$replaces['comment'] = $row->comment ;
		$replaces['amount'] = number_format($row->amount, 2) ;
		$replaces['discount_amount'] = number_format($row->discount_amount, 2) ;
		$replaces['tax_amount'] = number_format($row->tax_amount, 2) ;
		$replaces['gross_amount'] = number_format($row->gross_amount, 2) ;
		
		
	
		$replaces['transaction_id'] = $row->transaction_id ;
		if ($row->payment_method) {
			$replaces['payment_method'] = JText::_(os_payments::loadPaymentMethod($row->payment_method)->title) ;
		}
	
	
		//Should we create map to custom fields
		$sql = 'SELECT field_id, field_value FROM #__osmembership_field_value WHERE subscriber_id = '.$row->id;
		$db->setQuery($sql) ;
		$rowValues = $db->loadObjectList();
		$sql = 'SELECT a.id, a.name FROM #__osmembership_fields AS a WHERE a.published=1 AND  (a.plan_id = 0 OR a.plan_id='.$row->plan_id.')';
		$db->setQuery($sql) ;
		$rowFields = $db->loadObjectList();
		$fields = array() ;
		for ($i = 0 , $n = count($rowFields) ; $i < $n ; $i++) {
			$rowField = $rowFields[$i] ;
			$fields[$rowField->id] = $rowField->name ;
		}
		for ($i = 0 , $n = count($rowValues) ; $i < $n ; $i++) {
			$rowValue = $rowValues[$i] ;
			$replaces[$fields[$rowValue->field_id]] = $rowValue->field_value ;
		}
				
		$subject = $config->user_upgrade_email_subject;		
		$subject = str_replace('[TO_PLAN_TITLE]', $plan->title, $subject) ;
		$subject = str_replace('[PLAN_TITLE]', $planTitle, $subject) ;
		
		$body = $config->user_upgrade_email_body ;
		$body = str_replace('[SUBSCRIPTION_DETAIL]', $emailContent, $body) ;
		foreach ($replaces as $key=>$value) {
			$key = strtoupper($key) ;
			$body = str_replace("[$key]", $value, $body) ;
		}
		if (version_compare(JVERSION, '3.0', 'ge')) {
			$j3 = true ;
			$mailer = new JMail() ;
		} else {
			$j3 = false ;
		}
		if ($j3) 
			$mailer->sendMail($fromEmail, $fromName, $row->email, $subject, $body, 1);
		else	
			JUtility::sendMail($fromEmail, $fromName, $row->email, $subject, $body, 1);
		//Send emails to notification emails
		if ($config->notification_emails == '')
			$notificationEmails = $fromEmail;
		else
			$notificationEmails = $config->notification_emails;
		$notificationEmails = str_replace(' ', '', $notificationEmails);
		$emails = explode(',', $notificationEmails);
		$subject = $config->admin_upgrade_email_subject ;
		$subject = str_replace('[TO_PLAN_TITLE]', $plan->title, $subject) ;
		$subject = str_replace('[PLAN_TITLE]', $planTitle, $subject) ;
		$body = $config->admin_upgrade_email_body ;
		$body = str_replace('[SUBSCRIPTION_DETAIL]', $emailContent, $body);
		foreach ($replaces as $key=>$value) {
			$key = strtoupper($key) ;
			$body = str_replace("[$key]", $value, $body) ;
		}
		for ($i = 0, $n  = count($emails); $i < $n ; $i++) {
			$email = $emails[$i];
			if ($j3) 
				$mailer->sendMail($fromEmail, $fromName, $email, $subject, $body, 1);
			else	
				JUtility::sendMail($fromEmail, $fromName, $email, $subject, $body, 1);
		}
	}		
	/**
	 * Send email to subscriber to inform them that their membership approved (and activated)
	 * @param object $row
	 */
	function sendMembershipApprovedEmail($row) {
		$jconfig = new JConfig();
		$db = & JFactory::getDBO();
		$config = OSMembershipHelper::getConfig();
		$fromEmail =  $jconfig->mailfrom;
		$fromName = $jconfig->fromname;
		$sql = "SELECT * FROM #__osmembership_plans WHERE id=".$row->plan_id ;
		$db->setQuery($sql) ;
		$plan = $db->loadObject();
		//Need to over-ridde some config options
		$emailContent = OSMembershipHelper::getEmailContent($config, $row);
		$replaces = array() ;
		$replaces['plan_title'] = $plan->title ;
		$replaces['first_name'] = $row->first_name ;
		$replaces['last_name'] = $row->last_name ;
		$replaces['organization'] = $row->organization ;
		$replaces['address'] = $row->address ;
		$replaces['address2'] = $row->address ;
		$replaces['city'] = $row->city ;
		$replaces['state'] = $row->state ;
		$replaces['zip'] = $row->zip ;
		$replaces['country'] = $row->country ;
		$replaces['phone'] = $row->phone ;
		$replaces['fax'] = $row->phone ;
		$replaces['email'] = $row->email ;
		$replaces['comment'] = $row->comment ;
		$replaces['amount'] = number_format($row->amount, 2) ;
		$replaces['discount_amount'] = number_format($row->discount_amount, 2) ;
		$replaces['tax_amount'] = number_format($row->tax_amount, 2) ;
		$replaces['gross_amount'] = number_format($row->gross_amount, 2) ;
		
		$replaces['transaction_id'] = $row->transaction_id ;
		if ($row->payment_method) {
			$replaces['payment_method'] = JText::_(os_payments::loadPaymentMethod($row->payment_method)->title) ;
		}
						
		//Should we create map to custom fields
		$sql = 'SELECT field_id, field_value FROM #__osmembership_field_value WHERE subscriber_id = '.$row->id;
		$db->setQuery($sql) ;
		$rowValues = $db->loadObjectList();
		$sql = 'SELECT a.id, a.name FROM #__osmembership_fields AS a WHERE a.published=1 AND  (a.plan_id = 0 OR a.plan_id='.$row->plan_id.')';
		$db->setQuery($sql) ;
		$rowFields = $db->loadObjectList();
		$fields = array() ;
		for ($i = 0 , $n = count($rowFields) ; $i < $n ; $i++) {
			$rowField = $rowFields[$i] ;
			$fields[$rowField->id] = $rowField->name ;
		}
		for ($i = 0 , $n = count($rowValues) ; $i < $n ; $i++) {
			$rowValue = $rowValues[$i] ;
			$replaces[$fields[$rowValue->field_id]] = $rowValue->field_value ;
		}
		//Over-ridde email message
		$subject = $config->subscription_approved_email_subject;		
		$body = $config->subscription_approved_email_body ;		
		$subject = str_replace('[PLAN_TITLE]', $plan->title, $subject) ;
		$body = str_replace('[SUBSCRIPTION_DETAIL]', $emailContent, $body) ;
		foreach ($replaces as $key=>$value) {
			$key = strtoupper($key) ;
			$body = str_replace("[$key]", $value, $body) ;
		}
		if (version_compare(JVERSION, '3.0', 'ge')) {
			$j3 = true ;
			$mailer = new JMail() ;
		} else {
			$j3 = false ;
		}
		if ($j3) {
			$mailer->sendMail($fromEmail, $fromName, $row->email, $subject, $body, 1);
		} else {
			JUtility::sendMail($fromEmail, $fromName, $row->email, $subject, $body, 1);
		}				
	}	
	/**
	 * Send first reminder emails to registrants
	 *
	 * @param object $rows	 
	 */
	function sendFirstReminderEmails($rows) {		
		$config = OSMembershipHelper::getConfig() ;
		$jconfig = new JConfig();
		$db = & JFactory::getDBO();
		$fromEmail =  $jconfig->mailfrom;
		$fromName = $jconfig->fromname;
		$planTitles = array() ;
		$subscriberIds = array();
		if (version_compare(JVERSION, '3.0', 'ge')) {
			$j3 = true ;
			$mailer = new JMail() ;
		} else {
			$j3 = false ;
		}
		for ($i = 0 , $n = count($rows) ; $i < $n ; $i++) {
			$row = $rows[$i] ;
			if(!isset($planTitles[$row->plan_id])) {
				$sql = "SELECT title FROM #__osmembership_plans WHERE id=".$row->plan_id ;
				$db->setQuery($sql) ;
				$planTitle = $db->loadResult();
				$planTitles[$row->plan_id] = $planTitle ;				
			}			
			$replaces = array() ;
			$replaces['plan_title'] = $planTitles[$row->plan_id] ;
			$replaces['first_name'] = $row->first_name ;
			$replaces['last_name'] = $row->last_name ;
			$replaces['number_days'] = $row->number_days ;
			$replaces['expire_date'] = JHTML::_('date', $row->to_date, $config->date_format);

			
			//Over-ridde email message
			$subject = $config->first_reminder_email_subject ;			
			$body = $config->first_reminder_email_body ;									
			foreach ($replaces as $key=>$value) {
				$key = strtoupper($key) ;
				$body = str_replace("[$key]", $value, $body) ;
				$subject = str_replace("[$key]", $value, $subject) ;
			}			
			if ($j3)
				$mailer->sendMail($fromEmail, $fromName, $row->email, $subject, $body, 1);
			else			
				JUtility::sendMail($fromEmail, $fromName, $row->email, $subject, $body, 1);			
			$subscriberIds[] = $row->id ;
		}
		if (count($subscriberIds)) {
			$sql = 'UPDATE #__osmembership_subscribers SET first_reminder_sent=1 WHERE id IN ('.implode(',', $subscriberIds).')';
			$db->setQuery($sql) ;
			$db->query();	
		}
		
		return true ;					
	}
	/**
	 * Format currency based on config parametters
	 * @param Float $amount
	 * @param Object $config
	 * @param string $currencySymbol
	 * @return string
	 */
	function formatCurrency($amount, $config, $currencySymbol = null) {
		$decimals = isset($config->decimals) ?  $config->decimals : 2 ;
		$dec_point = isset($config->dec_point) ? $config->dec_point : '.' ;
		$thousands_sep = isset($config->thousands_sep) ? $config->thousands_sep : ',' ;
		$symbol = $currencySymbol ? $currencySymbol : $config->currency_symbol ;
	
		return $config->currency_position ? (number_format($amount, $decimals, $dec_point, $thousands_sep).$symbol) : ($symbol.number_format($amount, $decimals, $dec_point, $thousands_sep))  ;
	}
	/**
	 * Send second reminder emails to subscribers
	 *
	 * @param object $rows
	 */
	function sendSecondReminderEmails($rows) {
		$config = OSMembershipHelper::getConfig() ;
		$jconfig = new JConfig();
		$db = & JFactory::getDBO();
		$fromEmail =  $jconfig->mailfrom;
		$fromName = $jconfig->fromname;
		$planTitles = array() ;
		$subscriberIds = array();
		if (version_compare(JVERSION, '3.0', 'ge')) {
			$j3 = true ;
			$mailer = new JMail() ;
		} else {
			$j3 = false ;
		}
		for ($i = 0 , $n = count($rows) ; $i < $n ; $i++) {
			$row = $rows[$i] ;
			if(!isset($planTitles[$row->plan_id])) {
				$sql = "SELECT title FROM #__osmembership_plans WHERE id=".$row->plan_id ;
				$db->setQuery($sql) ;
				$planTitle = $db->loadResult();
				$planTitles[$row->plan_id] = $planTitle ;				
			}			
			$replaces = array() ;
			$replaces['plan_title'] = $planTitles[$row->plan_id] ;
			$replaces['first_name'] = $row->first_name ;
			$replaces['last_name'] = $row->last_name ;
			$replaces['number_days'] = $row->number_days ;
			$replaces['expire_date'] = JHTML::_('date', $row->to_date, $config->date_format);

			
			//Over-ridde email message
			$subject = $config->second_reminder_email_subject ;			
			$body = $config->second_reminder_email_body ;									
			foreach ($replaces as $key=>$value) {
				$key = strtoupper($key) ;
				$body = str_replace("[$key]", $value, $body) ;
				$subject = str_replace("[$key]", $value, $subject) ;
			}		
			if ($j3) {
				$mailer->sendMail($fromEmail, $fromName, $row->email, $subject, $body, 1);
			} else {
				JUtility::sendMail($fromEmail, $fromName, $row->email, $subject, $body, 1);
			}								
			$subscriberIds[] = $row->id ;
		}
		if (count($subscriberIds)) {
			$sql = 'UPDATE #__osmembership_subscribers SET second_reminder_sent=1 WHERE id IN ('.implode(',', $subscriberIds).')';
			$db->setQuery($sql) ;
			$db->query();	
		}
		
		return true ;	
	}	
	/**
	 * Get detail information of the subscription
	 * @param object $config
	 * @param object $row
	 * @return string
	 */
	function getEmailContent($config, $row) {
		require_once JPATH_ROOT.'/administrator/components/com_osmembership/legacy/view.php';
		$db = & JFactory::getDBO() ;
		$viewConfig['name'] = 'form' ;
		$viewConfig['base_path'] = JPATH_ROOT.'/components/com_osmembership/emailtemplates' ;
		$viewConfig['template_path'] = JPATH_ROOT.'/components/com_osmembership/emailtemplates' ;
		$viewConfig['layout'] = 'email' ;
		$view =  new LegacyView($viewConfig) ;
		$sql = 'SELECT title FROM #__osmembership_plans WHERE id='.$row->plan_id ;
		$db->setQuery($sql) ;
		$planTitle = $db->loadResult();
		$view->assignRef('planTitle', $planTitle) ;
		$view->assign('config', $config) ;
		$view->assignRef('row', $row) ;
		ob_start();
		$view->display() ;
		$text = ob_get_contents() ;
		ob_end_clean();
	
		return $text ;
	}	
	/**
	 * Get recurring frequency from subscription length
	 * @param Object $rowPlan
	 */	
	function getRecurringSettingOfPlan($subscriptionLength) {
		if (($subscriptionLength >= 365) && ($subscriptionLength % 365 == 0)) {
			$frequency = 'Y' ;
			$lenth = $subscriptionLength / 365 ;
		} elseif (($subscriptionLength >= 30) && ($subscriptionLength % 30 == 0)) {
			$frequency = 'M' ;
			$lenth = $subscriptionLength / 30 ;
		} elseif (($subscriptionLength >= 7) && ($subscriptionLength % 7 == 0)) {
			$frequency = 'W' ;
			$lenth = $subscriptionLength / 7 ;
		} else {
			$frequency = 'D' ;
			$lenth = $subscriptionLength ;
		}

		return array($frequency, $lenth);
	}	
	/**
	 * Create an useraccount based on the entered data
	 * @param array $data
	 * @return number|boolean|mixed
	 */
	function saveRegistration($data) {
		//Need to load com_users language file
		$lang = & JFactory::getLanguage() ;
		$tag = $lang->getTag();
		if (!$tag)
			$tag = 'en-GB' ;
		$lang->load('com_users', JPATH_ROOT, $tag);
		$data['name'] = $data['first_name'].' '.$data['last_name'] ;
		$data['password'] = $data['password2'] = $data['password'] = $data['password1'];
		$data['email1'] = $data['email2'] = $data['email'] ;
		
		$user = new JUser  ;
		$params	= JComponentHelper::getParams('com_users');
		$data['groups'] = array() ;
		$data['groups'][]= $params->get('new_usertype', 2) ;
		$data['block'] = 1 ;
		if (!$user->bind($data)) {
			$this->setError(JText::sprintf('COM_USERS_REGISTRATION_BIND_FAILED', $user->getError()));
			return false;
		}
		// Store the data.
		if (!$user->save()) {
			$this->setError(JText::sprintf('COM_USERS_REGISTRATION_SAVE_FAILED', $user->getError()));
			return false;
		}
		
		$db = & JFactory::getDbo() ;
		//Need to get the user ID based on username
		$sql = 'SELECT id FROM #__users WHERE username="'.$data['username'].'"';
		$db->setQuery($sql) ;
			
		return (int) $db->loadResult() ;		
	}	
    /**
     * Add submenus, only used for Joomla 1.6 and newer version
     * 
     * @param string $vName
     */
    function addSubMenus($vName = 'plans') {			
		JSubMenuHelper::addEntry(
			JText::_('OSM_CONFIGURATION'),
			'index.php?option=com_osmembership&view=configuration',
			$vName == 'configuration'
		);
		JSubMenuHelper::addEntry(
			JText::_('OSM_PLAN_CATEGORIES'),
			'index.php?option=com_osmembership&view=categories',
			$vName == 'categories'
		);
		JSubMenuHelper::addEntry(
			JText::_('OSM_SUBSCRIPTION_PLANS'),
			'index.php?option=com_osmembership&view=plans',
			$vName == 'plans'
		);
		JSubMenuHelper::addEntry(
			JText::_('OSM_SUBSCRIBERS'),
			'index.php?option=com_osmembership&view=subscribers',
			$vName == 'subscribers'
		);
						
		JSubMenuHelper::addEntry(
				JText::_('OSM_UPGRADE_RULES'),
				'index.php?option=com_osmembership&view=rules',
				$vName == 'rules'
		);
		
		JSubMenuHelper::addEntry(
				JText::_('OSM_CUSTOM_FIELDS'),
				'index.php?option=com_osmembership&view=fields',
				$vName == 'fields'
		);
					
		JSubMenuHelper::addEntry(
				JText::_('OSM_COUPONS'),
				'index.php?option=com_osmembership&view=coupons',
				$vName == 'coupons'
		);
		
		JSubMenuHelper::addEntry(
				JText::_('OSM_PAYMENT_PLUGINS'),
				'index.php?option=com_osmembership&view=plugins',
				$vName == 'plugins'
		);
								
		JSubMenuHelper::addEntry(
				JText::_('OSM_TRANSLATION'),
				'index.php?option=com_osmembership&view=language',
				$vName == 'language'
		);							
	}   	
}
?>