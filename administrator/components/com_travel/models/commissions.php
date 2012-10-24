<?php

/**                               ______________________________________________
*                          o O   |                                              |
*                 (((((  o      <    Generated with Cook Self Service  V1.5.2   |
*                ( o o )         |______________________________________________|
* --------oOOO-----(_)-----OOOo---------------------------------- www.j-cook.pro --- +
* @version		1.0.0
* @package		Travel
* @subpackage	Commissions
* @copyright	Copyright 2012, All rights reserved
* @author		Edward Khor - www.enfonius.com - edward@enfonius.com
* @license		GNU/GPL
*
* /!\  Joomla! is free software.
* This version may have been modified pursuant to the GNU General Public License,
* and as distributed it includes or is derivative of works licensed under the
* GNU General Public License or other free or open source software licenses.
*
*             .oooO  Oooo.     See COPYRIGHT.php for copyright notices and details.
*             (   )  (   )
* -------------\ (----) /----------------------------------------------------------- +
*               \_)  (_/
*/

// Check to ensure this file is included in Joomla!
defined('_JEXEC') or die( 'Restricted access' );

require_once(JPATH_ADMIN_TRAVEL .DS.'classes'.DS.'jmodel.list.php');


/**
 * Travel Component Commissions Model
 *
 * @package		Joomla
 * @subpackage	Travel
 *
 */
class TravelModelCommissions extends TravelModelList
{
	var $_name_sing = 'commission';



	/**
	 * Constructor
	 *
	 */
	function __construct($config = array())
	{
		//Define the sortables fields (in lists)
		if (empty($config['filter_fields'])) {
			$config['filter_fields'] = array(
				'payment_date', 'a.payment_date',
				'created_date', 'a.created_date',

			);
		}

		//Define the filterable fields
		$this->set('filter_vars', array(
			'payment_date_from' => 'date:%Y-%m-%d',
			'payment_date_to' => 'date:%Y-%m-%d',
			'created_date_from' => 'cmd',
			'created_date_to' => 'cmd',
			'payment_date' => 'string',
			'created_date' => 'string'
				));

		//Define the filterable fields
		$this->set('search_vars', array(
			'search' => 'varchar'
				));



		parent::__construct($config);


	}




	/**
	 * Method to get a store id based on model configuration state.
	 *
	 * This is necessary because the model is used by the component and
	 * different modules that might need different sets of data or different
	 * ordering requirements.
	 *
	 * @param	string		$id	A prefix for the store id.
	 *
	 * @return	string		A store id.
	 * @since	1.6
	 */
	protected function getStoreId($id = '')
	{
		// Compile the store id.




		return parent::getStoreId($id);
	}



	/**
	 * Method to auto-populate the model state.
	 *
	 * Note. Calling getState in this method will result in recursion.
	 *
	 * @return	void
	 * @since	1.6
	 */
	protected function populateState($ordering = null, $direction = null)
	{
		// Initialise variables.
		$app = JFactory::getApplication();
		$session = JFactory::getSession();



		parent::populateState();
	}


	/**
	 * Method to build a the query string for the Commission
	 *
	 * @access public
	 * @return integer
	 */
	function _buildQuery()
	{

		if (isset($this->_active['predefined']))
		switch($this->_active['predefined'])
		{
			case 'default': return $this->_buildQuery_default(); break;

		}



		$query = ' SELECT a.*'

			. $this->_buildQuerySelect()

			. ' FROM `#__travel_commissions` AS a '

			. $this->_buildQueryJoin() . ' '

			. $this->_buildQueryWhere()


			. $this->_buildQueryOrderBy()
			. $this->_buildQueryExtra()
		;

		return $query;
	}

	function _buildQuery_default()
	{

		$query = ' SELECT a.*'
					.	' , _user_id_.name AS `_user_id_name`'

			. $this->_buildQuerySelect()

			. ' FROM `#__travel_commissions` AS a '
					.	' LEFT JOIN `#__users` AS _user_id_ ON _user_id_.id = a.user_id'

			. $this->_buildQueryJoin() . ' '

			. $this->_buildQueryWhere()


			. $this->_buildQueryOrderBy()
			. $this->_buildQueryExtra()
		;

		return $query;
	}



	function _buildQueryWhere($where = array())
	{
		$app = JFactory::getApplication();
		$db= JFactory::getDBO();
		$acl = TravelHelper::getAcl();


		if (isset($this->_active['filter']) && $this->_active['filter'])
		{
			//search_search : search on User > Name
			$search_search = $this->getState('search.search');
			$this->_addSearch('search', '_user_id_.name', 'like');
			if (($search_search != '') && ($search_search_val = $this->_buildSearch('search', $search_search)))
				$where[] = $search_search_val;

		// Range : payment_date
			$filter_payment_date_from = $this->getState('filter.payment_date_from');
			if ($filter_payment_date_from != '')		$where[] = "DATEDIFF(a.payment_date, " . $db->Quote($filter_payment_date_from) . ") >= 0";

			$filter_payment_date_to = $this->getState('filter.payment_date_to');
			if ($filter_payment_date_to != '')		$where[] = "DATEDIFF(a.payment_date, " . $db->Quote($filter_payment_date_to) . ") <= 0";
		// Range : created_date
			$filter_created_date_from = $this->getState('filter.created_date_from');
			if ($filter_created_date_from != '')		$where[] = "a.created_date >= " . $db->Quote($filter_created_date_from);

			$filter_created_date_to = $this->getState('filter.created_date_to');
			if ($filter_created_date_to != '')		$where[] = "a.created_date <= " . $db->Quote($filter_created_date_to);

		}


		return parent::_buildQueryWhere($where);
	}

	function _buildQueryOrderBy($order = array(), $pre_order = 'a.user_id')
	{

		return parent::_buildQueryOrderBy($order, $pre_order);
	}

	/**
	 * Method to Convert the parameter fields into objects.
	 *
	 * @access public
	 * @return void
	 */
	protected function populateParams()
	{

		parent::populateParams();
		$acl = TravelHelper::getAcl();
		if (!isset($this->_data))
			return;

		// Convert the parameter fields into objects.
		foreach ($this->_data as &$item)
		{

			$item->params->set('access-view', true);

			if ($acl->get('core.edit'))
				$item->params->set('access-edit', true);

			if ($acl->get('core.delete'))
				$item->params->set('access-delete', true);


		}

	}

}
