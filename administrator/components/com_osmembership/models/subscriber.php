<?php
/**
* @version		1.0.0
 * @package		Joomla
 * @subpackage	OS Membership
 * @author  Tuan Pham Ngoc
 * @copyright	Copyright (C) 2012 Ossolution Team
 * @license		GNU/GPL, see LICENSE.php
 */
// no direct access
defined( '_JEXEC' ) or die ;

OSFactory::loadLibrary('model') ;
/**
 * OS Membership Component Subscriber Model
 *
 * @package		Joomla
* @subpackage	OS Membership
 * @since 1.5
 */
class OSMembershipModelSubscriber extends OSModel
{
	/**
	 * Override store function to perform specific saving
	 * @see OSModel::store()
	 */
	function store(&$data) {
		$row = & $this->getTable('OsMembership', 'Subscriber');
		if ($data['id']) {
			$row->load($data['id']);
			$published = $row->published ;
		} else {
			$published = 0 ;//Default is pending
		}		
		
		if (!$row->bind($data)) {
			$this->setError($this->_db->getErrorMsg());
			return false;
		}
		
		if (!$row->check()) {
			$this->setError($this->_db->getErrorMsg());
			return false;
		}
								
		if (!$row->store()) {
			$this->setError($this->_db->getErrorMsg());
			return false;
		}
		
		if ($published == 0) {
			if ($row->published == 1) {
				//Membership active, trigger plugin								
				JPluginHelper::importPlugin( 'osmembership' );
				$dispatcher =& JDispatcher::getInstance();								
				$dispatcher->trigger( 'onMembershipActive', array($row));
								
				OSMembershipHelper::sendMembershipApprovedEmail($row) ;				
			}	
		} elseif ($published == 1) {
			if ($row->published != 1) {
				//De-active membership, call plugin function
				JPluginHelper::importPlugin( 'osmembership' );
				$dispatcher =& JDispatcher::getInstance();							
				//Trigger plugins
				$dispatcher->trigger( 'onMembershipExpire', array($row));
			}
		} 
		
								
		$data['id'] = $row->id ;
		if ($row->plan_id) {
			if ($data['id']) {
				//Delete old data
				$sql = 'DELETE FROM #__osmembership_field_value WHERE subscriber_id='.$row->id;
				$this->_db->setQuery($sql) ;
				$this->_db->query();
			}			
			$jcFields = new OSMFields($row->plan_id) ;
			if ($jcFields->getTotal()) {				
				$jcFields->saveFieldValues($row->id) ;
			}
		}				
				
		return true;
	}	
}