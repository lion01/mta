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

OSFactory::loadLibrary('model');
class OSMembershipModelPlan extends OSModel {
	function __construct($config) {

		parent::__construct($config) ;
		
		$this->setId(JRequest::getInt('id')) ;
	}
}