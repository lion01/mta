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

OSFactory::loadLibrary('model') ;
/**
 * OSemmbership Component Plan Model
 *
 * @package		Joomla
 * @subpackage	OSMembership
 * @since 1.5
 */
class OSMembershipModelPlan extends OSModel
{
	function store(&$data) {
		if (!$data['id'])
			$isNew = true ;
		else
			$isNew = false ;				
		$ret = parent::store($data) ;
		if ($ret) {
			$row = & $this->getTable('Osmembership', 'Plan');
			$row->load($data['id']);
			//Trigger plugin
			JPluginHelper::importPlugin( 'osmembership' );
			$dispatcher =& JDispatcher::getInstance();
			//Trigger plugins
			$dispatcher->trigger( 'onAfterSaveSubscriptionPlan', array($row, $data, $isNew));
		}				
		
		$db = & JFactory::getDbo() ;
		if (!$isNew) {
			$sql = 'DELETE FROM #__osmembership_renewrates WHERE plan_id='.$data['id'];
			$db->setQuery($sql) ;
			$db->query();
		}
		//Store the renewal options		
		if (isset($data['number_days'])) {
			for ($i  = 0 , $n = count($data['number_days']) ; $i < $n ; $i++) {
				$numberDays = (int) $data['number_days'][$i] ;
				$price = $data['renew_price'][$i] ;
				if ($numberDays > 0 && $price > 0) {
					$sql = "INSERT INTO #__osmembership_renewrates(plan_id, number_days, price) VALUES(".$data['id'].", $numberDays, $price)";
					$db->setQuery($sql);
					$db->query();
				}
			}
		}
					
		return $ret ;
	}
	/**
	 * Copy a subscription plan
	 * @see OSModel::copy()
	 */
	function copy($id) {
		$copiedPlanId = parent::copy($id) ;
		//Insert data into renew options table
		$sql = 'INSERT INTO #__osmembership_renewrates(plan_id, number_days, price)'
		." SELECT $copiedPlanId, number_days, price FROM #__osmembership_renewrates WHERE plan_id=".$id
			
		;		
		$this->_db->setQuery($sql) ;
		$this->_db->query();
						
		return $copiedPlanId ;
	}	
}