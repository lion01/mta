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
 * @since 1.5
 */
class OSMembershipViewLanguage extends LegacyView
{
	function display($tpl = null)
	{	
		$mainframe = & JFactory::getApplication() ;
		$option    = 'com_osmembership' ;
		jimport('joomla.filesystem.file') ;				
		$lang				= $mainframe->getUserStateFromRequest( $option.'lang',			'lang',			'en-GB',				'string' );		
		if (!$lang)
			$lang = 'en-GB' ;		
		$search				= $mainframe->getUserStateFromRequest( $option.'search',			'search',			'',				'string' );
		$search				= JString::strtolower( $search );				
		$lists['search'] = $search;	
		$item = JRequest::getVar('item', '') ;
		if (!$item)
			$item = 'com_osmembership' ;
		$model = & $this->getModel('language') ;	
		$trans = $model->getTrans($lang, $item);
		$languages = $model->getSiteLanguages();		
		$options = array() ;
		$options[] = JHTML::_('select.option', '', JText::_('Select Language'))	;
		foreach ($languages as $language) {
			$options[] = JHTML::_('select.option', $language, $language) ;		
		}
		$lists['lang'] = JHTML::_('select.genericlist', $options, 'lang', ' class="inputbox"  onchange="submit();" ', 'value', 'text', $lang) ;		
		$options = array() ;
		$options[] = JHTML::_('select.option', '', JText::_('--Select Item--')) ;						
		$options[] = JHTML::_('select.option', 'com_osmembership', JText::_('OS Membership')) ;			
		$lists['item'] = JHTML::_('select.genericlist', $options, 'item', ' class="inputbox"  onchange="submit();" ', 'value', 'text', $item) ;
		$this->assignRef('trans', $trans) ;	
		$this->assignRef('lists', $lists) ;	
		$this->assignRef('lang', $lang) ;
		$this->assignRef('item', $item) ;				
		parent::display($tpl);				
	}
}