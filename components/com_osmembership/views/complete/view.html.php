<?php
/**
 * @version		1.5.0
 * @package		Joomla
 * @subpackage	OS Membership
 * @author  Tuan Pham Ngoc
 * @copyright	Copyright (C) 2012 Ossolution Team
 * @license		GNU/GPL, see LICENSE.php
 */
// no direct access
defined( '_JEXEC' ) or die ;
require_once JPATH_ROOT.'/administrator/components/com_osmembership/legacy/view.php';
/**
 * HTML View class for the OS Membership component
 *
 * @static
 * @package		Joomla
 * @subpackage	OS Membership
 * @since 1.0
 */
class OsMembershipViewComplete extends LegacyView
{
	function display($tpl = null)
	{	
		$this->setLayout('default') ;//Hardcoded the layout, it happens with some clients. Maybe it is a bug of Joomla core code, will find out it later
		$db = & JFactory::getDBO() ;		
		$subscriptionCode = JRequest::getVar('subscription_code') ;
		if ($subscriptionCode) {
			$sql = 'SELECT id FROM #__osmembership_subscribers WHERE subscription_code="'.$subscriptionCode.'"';
			$db->setQuery($sql) ;
			$id = (int) $db->loadResult() ;
		} else {
			$id = 0 ;	
		}
														
		$sql = 'SELECT a.id, a.title, b.payment_method FROM #__osmembership_plans  AS a '
		. ' INNER JOIN #__osmembership_subscribers AS b '
		. ' ON a.id = b.plan_id '
		. ' WHERE b.id = '.$id		
		;	 
		
		$db->setQuery($sql) ;
		$subscriber = $db->loadObject();				
		$config = OSMembershipHelper::getConfig() ;

		$sql = 'SELECT * FROM #__osmembership_subscribers WHERE id='.$id;
		$db->setQuery($sql);
		$row = $db->loadObject() ;
		
		$act = JRequest::getVar('act', '') ;
		switch ($act) {
			case 'renew' :
				$message = $config->renew_thanks_message ;
				$sql = 'SELECT to_date FROM #__osmembership_subscribers  WHERE id='.$id;
				$db->setQuery($sql);				
				$toDate = $db->loadResult();
				if ($toDate)
					$toDate = JHTML::_('date', $toDate, $config->date_format);
				else
					$toDate = '' ;
				$message = str_replace('[END_DATE]', $toDate, $message) ;
				$message = str_replace('[PLAN_TITLE]', $subscriber->title, $message) ;
				break ;
			case 'upgrade' :
				$message = $config->upgrade_thanks_message ;
				$sql = ' SELECT c.title FROM #__osmembership_subscribers AS a '
					.' INNER JOIN #__osmembership_upgraderules AS b '
					.' ON a.upgrade_option_id=b.id '
					.' INNER JOIN #__osmembership_plans AS c '
					.' ON b.from_plan_id = c.id '
					.' WHERE a.id = '.$id											
				;
				$db->setQuery($sql) ;
				$fromPlan =  $db->loadResult();
				$message = str_replace('[PLAN_TITLE]', $fromPlan, $message) ;
				$message = str_replace('[TO_PLAN_TITLE]', $subscriber->title, $message) ;
				break ;
			default :
				if ($subscriber->payment_method == 'os_offline') {
					$message = $config->thanks_message_offline ;
				} else {
					$message = $config->thanks_message ;
				}
				
				$message = str_replace('[PLAN_TITLE]', $subscriber->title, $message) ;				
				$registrationDetail = OSMembershipHelper::getEmailContent($config, $row) ;
				$message = str_replace('[SUBSCRIPTION_DETAIL]', $registrationDetail, $message) ;																	
																
				break ;				 								
		}

		$subscriptionDetail = OSMembershipHelper::getEmailContent($config, $row);
		$message = str_replace('[SUBSCRIPTION_DETAIL]', $subscriptionDetail, $message);
		
		$replaces = array() ;
		$replaces['plan_title'] = $subscriber->title ;
		$replaces['first_name'] = $row->first_name ;
		$replaces['last_name'] = $row->last_name ;
		$replaces['organization'] = $row->organization ;
		$replaces['address'] = $row->address ;
		$replaces['address2'] = $row->address2 ;
		$replaces['city'] = $row->city ;
		$replaces['state'] = $row->state ;
		$replaces['zip'] = $row->zip ;
		$replaces['country'] = $row->country ;
		$replaces['phone'] = $row->phone ;
		$replaces['fax'] = $row->phone ;
		$replaces['email'] = $row->email ;
		$replaces['comment'] = $row->comment ;
		$replaces['amount'] = number_format($row->amount, 2) ;
		$replaces['tax_amount'] = number_format($row->tax_amount, 2) ;
		$replaces['discount_amount'] = number_format($row->discount_amount, 2) ;
		$replaces['gross_amount'] = number_format($row->gross_amount, 2) ;
		foreach ($replaces as $key=>$value) {
			$key = strtoupper($key) ;
			$message = str_replace("[$key]", $value, $message) ;
		}
		
		$this->assignRef('message', $message);						
		parent::display($tpl);				
	}
}