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

OSFactory::loadLibrary('viewform') ;
/**
 * HTML View class for OS Membership component
 *
 * @static
 * @package		Joomla
 * @subpackage	OS Membership
 * @since 1.5
 */
class OSMembershipViewField extends OSViewForm
{
	function _buildListArray(&$lists, $item) {
		$db = & JFactory::getDbo() ;
		$fieldTypes = array(
				0 => 'Textbox' ,
				1 => 'Textarea' ,
				2 => 'Dropdown' ,
				3 => 'Checkbox List' ,
				4 => 'Radio List' ,
				5 => 'Date Time',
				6 => 'Heading',
				7 => 'Message',
				8 => 'MultiSelect',
				9 => 'File Upload'
		);
		$options = array() ;
		$options[] = JHTML::_('select.option', -1, JText::_('OSM_FIELD_TYPE')) ;
		foreach ($fieldTypes As $value => $text) {
			$options[] = JHTML::_('select.option', $value, $text ) ;
		}
		if ($item->is_core)
			$readOnly = ' readonly="true" ' ;
		else
			$readOnly = '';
				
		$lists['field_type'] = JHTML::_('select.genericlist', $options, 'field_type',' class="inputbox" '.$readOnly, 'value', 'text', $item->field_type);
		$sql = 'SELECT id, title FROM #__osmembership_plans WHERE published = 1 ORDER BY ordering ';
		$db->setQuery($sql) ;
		$options = array();
		$options[] = JHTML::_('select.option', 0, JText::_('OSM_ALL_PLANS'), 'id', 'title');
		$options = array_merge($options, $db->loadObjectList()) ;
		$lists['plan_id'] = JHTML::_('select.genericlist', $options, 'plan_id', ' class="inputbox" ', 'id', 'title', $item->plan_id);
		$options = array() ;
		$options[] = JHTML::_('select.option', 1, JText::_('Yes'));
		$options[] = JHTML::_('select.option', 2, JText::_('No'));		
		$lists['required'] = JHTML::_('select.booleanlist', 'required', ' class="inputbox" ', $item->required) ;				
		$options = array() ;
		$options[] = JHTML::_('select.option', 0, JText::_('None')) ;
		$options[] = JHTML::_('select.option', 1, JText::_('Integer Number')) ;
		$options[] = JHTML::_('select.option', 2, JText::_('Number')) ;
		$options[] = JHTML::_('select.option', 3, JText::_('Email')) ;
		$lists['datatype_validation'] = JHTML::_('select.genericlist', $options, 'datatype_validation', 'class="inputbox"', 'value', 'text', $item->datatype_validation) ;
		$integration = OSMembershipHelper::getConfigValue('cb_integration') ;			
		if ($integration > 0) {
			if ($integration == 1) {
				$sql = 'SELECT name AS `value`, name AS `text` FROM #__comprofiler_fields WHERE `table`="#__comprofiler"';
			} elseif ($integration == 2) {
				$sql = 'SELECT fieldcode AS `value`, fieldcode AS `text` FROM #__community_fields WHERE published=1 AND fieldcode != ""' ;
			}
			$db->setQuery($sql) ;
			$options = array() ;
			$options[] = JHTML::_('select.option', '', JText::_('Select Field')) ;
			$options = array_merge($options, $db->loadObjectList()) ;
			$lists['field_mapping'] = JHTML::_('select.genericlist', $options, 'field_mapping', ' class="inputbox" ', 'value', 'text', $item->field_mapping) ;
		}
		$this->integration = $integration ;
				
		return true ;
	}
}