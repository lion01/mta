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

require_once JPATH_ROOT.'/administrator/components/com_osmembership/legacy/controller.php';
/**
 * OS Membership controller
 *
 * @package		Joomla
 * @subpackage	OS Membership
 * @since 1.5
 */
class OSMembershipControllerLanguage extends LegacyController
{
	function save() {
		$model =  $this->getModel('language');
		$data = JRequest::get('post', JREQUEST_ALLOWHTML) ;
		$model->save($data);
		$lang = $data['lang'] ;
		$item = $data['item'];
		$url = 'index.php?option=com_osmembership&view=language&lang='.$lang.'&item='.$item;
		$msg = JText::_('Traslation saved') ;
		$this->setRedirect($url, $msg);
	}
}