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
class OSMembershipViewConfiguration extends LegacyView
{
	function display($tpl = null)
	{		
		$db = & JFactory::getDBO();
		$config = $this->get('Data');
		
		$options = array() ;			
		$options[] =  JHTML::_('select.option', 0, JText::_('OSM_NO_INTEGRATION')) ;
		$options[] = JHTML::_('select.option', 1 , JText::_('OSM_COMMUNITY_BUILDER')) ;
		$options[] = JHTML::_('select.option', 2 , JText::_('OSM_JOMSOCIAL')) ;
					
		$lists['cb_integration'] = JHTML::_('select.genericlist', $options,  'cb_integration', ' class="inputbox" ', 'value' , 'text' , $config->cb_integration);						
		$lists['registration_integration'] = JHTML::_('select.booleanlist', 'registration_integration', ' class="inputbox" ', $config->registration_integration);
		
		$lists['use_https'] = JHTML::_('select.booleanlist', 'use_https', '', $config->use_https);
		$lists['enable_captcha'] = JHTML::_('select.booleanlist', 'enable_captcha', '', $config->enable_captcha);		
		$lists['enable_tax'] = JHTML::_('select.booleanlist', 'enable_tax', '', $config->enable_tax);
		$lists['enable_coupon'] = JHTML::_('select.booleanlist', 'enable_coupon', '', $config->enable_coupon);
		$lists['show_login_box_on_subscribe_page'] = JHTML::_('select.booleanlist', 'show_login_box_on_subscribe_page', '', $config->show_login_box_on_subscribe_page);
		$lists['auto_generate_membership_id'] = JHTML::_('select.booleanlist', 'auto_generate_membership_id', '', $config->auto_generate_membership_id);
		
		$options =  array() ;
		$options[] = JHTML::_('select.option', 'Visa', JText::_('OSM_VISA_CARD')) ;
		$options[] = JHTML::_('select.option', 'MasterCard', JText::_('OSM_MASTER_CARD')) ;
		$options[] = JHTML::_('select.option', 'Discover', JText::_('OSM_DISCOVER')) ;
		$options[] = JHTML::_('select.option', 'Amex', JText::_('OSM_AMEX')) ;
		$lists['enable_cardtypes'] = JHTML::_('select.genericlist', $options, 'enable_cardtypes[]', ' class="inputbox" multiple="multiple"', 'value', 'text', explode(',', $config->enable_cardtypes)) ;
		
		$sql = 'SELECT id, title FROM #__content ORDER BY title';
		$db->setQuery($sql) ;
		$rows = $db->loadObjectList();
		$options = array() ;
		$options[] = JHTML::_('select.option', 0 , JText::_('OSM_SELECT_ARTICLE'), 'id', 'title') ;
		$options = array_merge($options, $rows) ;
		$lists['article_id'] = JHTML::_('select.genericlist', $options, 'article_id', ' class="inputbox" ', 'id', 'title', $config->article_id) ;				
		$lists['active_term'] = JHTML::_('select.booleanlist', 'accept_term', '', $config->accept_term);
		
		$options = array() ;
		$options[] = JHTML::_('select.option', '', JText::_('OSM_SELECT_POSITION'));
		$options[] = JHTML::_('select.option', 0, JText::_('OSM_BEFORE_AMOUNT'));
		$options[] = JHTML::_('select.option', 1, JText::_('OSM_AFTER_AMOUNT'));
		
		$lists['currency_position'] = JHTML::_('select.genericlist', $options, 'currency_position', ' class="inputbox"', 'value', 'text', $config->currency_position);
															
		//Get list of country
		$sql = 'SELECT name AS value, name AS text FROM #__osmembership_countries WHERE published=1';
		$db->setQuery($sql);		
		$rowCountries = $db->loadObjectList();
		$options = array();
		$options[] = JHTML::_('select.option', '', JText::_('OSM_SELECT_DEFAULT_COUNTRY'));
		$options = array_merge($options, $rowCountries);
		$lists['country_list'] = JHTML::_('select.genericlist', $options, 'default_country', '', 'value', 'text', $config->default_country);
		
		$this->assignRef('lists',		$lists);
		$this->assignRef('config',		$config);		
					
		parent::display($tpl);			
	}
}