<?php

/**                               ______________________________________________
*                          o O   |                                              |
*                 (((((  o      <    Generated with Cook Self Service  V1.5.2   |
*                ( o o )         |______________________________________________|
* --------oOOO-----(_)-----OOOo---------------------------------- www.j-cook.pro --- +
* @version		1.0.0
* @package		Travel
* @subpackage	Packages
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


jimport('joomla.application.component.model');
require_once(JPATH_ADMIN_TRAVEL .DS.'classes'.DS.'jmodel.item.php');

/**
 * Travel Component Package Model
 *
 * @package		Joomla
 * @subpackage	Travel
 *
 */
class TravelModelPackage extends TravelModelItem
{
	var $_name_plur = 'packages';
	var $params;



	/**
	 * Constructor
	 *
	 */
	function __construct()
	{
		parent::__construct();
		$this->_modes = array_merge($this->_modes, array(''));

	}

	/**
	 * Method to initialise the package data
	 *
	 * @access	private
	 * @return	boolean	True on success
	 */
	function _initData()
	{
		if (empty($this->_data))
		{
			//Default values shown in the form for new item creation
			$data = new stdClass();

			$data->id = 0;
			$data->attribs = null;
			$data->code = null;
			$data->title = null;
			$data->content = null;
			$data->commission_rate = null;
			$data->price = null;
			$data->unit = null;
			$data->renewable = null;
			$data->published = null;
			$data->ordering = null;
			$data->creation_date = null;
			$data->modification_date = null;

			$this->_data = $data;

			return (boolean) $this->_data;
		}
		return true;
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

		if ($search_search = $app->getUserState($this->context.'.search.search'))
			$this->setState('search.search', $search_search, null, 'varchar');

		if ($filter_published = $app->getUserState($this->context.'.filter.published'))
			$this->setState('filter.published', $filter_published, null, 'cmd');



		parent::populateState();
	}


	/**
	 * Method to build a the query string for the Package
	 *
	 * @access public
	 * @return integer
	 */
	function _buildQuery()
	{

		if (isset($this->_active['predefined']))
		switch($this->_active['predefined'])
		{
			case 'package': return $this->_buildQuery_package(); break;

		}



			$query = 'SELECT a.*'
					. 	$this->_buildQuerySelect()

					.	' FROM `#__travel_packages` AS a'
					. 	$this->_buildQueryJoin()

					. 	$this->_buildQueryWhere()

					.	'';

		return $query;
	}

	function _buildQuery_package()
	{

			$query = 'SELECT a.*'
					. 	$this->_buildQuerySelect()

					.	' FROM `#__travel_packages` AS a'
					. 	$this->_buildQueryJoin()

					. 	$this->_buildQueryWhere()

					.	'';

		return $query;
	}



	function _buildQueryWhere($where = array())
	{
		$app = JFactory::getApplication();
		$acl = TravelHelper::getAcl();

		$where[] = 'a.id = '.(int) $this->_id;



		return parent::_buildQueryWhere($where);
	}

	/**
	 * Method to update package in mass
	 *
	 * @access	public
	 * @return	boolean	True on success
	 */
	function update($cids, $data)
	{
		foreach($cids as $cid)
		{
			if ($cid == 0)
				continue;
			$data['id'] = $cid;
			if (!$this->save($data))
				return false;
		}
		return true;
	}

	/**
	 * Method to save the package
	 *
	 * @access	public
	 * @return	boolean	True on success
	 */
	function save($data)
	{

		$row = $this->getTable();



		//Convert data from a stdClass
		if (is_object($data)){
			if (get_class($data) == 'stdClass')
				$data = JArrayHelper::fromObject($data);
		}

		//Current id if unspecified
		if ($data['id'] != null)
			$id = $data['id'];
		else if (($this->_id != null) && ($this->_id > 0))
			$id = $this->_id;


		//Load the current object, in order to process an update
		if (isset($id))
			$row->load($id);

		//Some security checks
		$acl = TravelHelper::getAcl();

		//Secure the published tag if not allowed to change
		if (isset($data['published']) && !$acl->get('core.edit.state'))
			unset($data['published']);


		// Bind the form fields to the travel table
		$ignore = array();
		if (!$row->bind($data, $ignore)) {
			JError::raiseWarning(1000, $this->_db->getErrorMsg());
			return false;
		}





		// Make sure the travel table is valid
		if (!$row->check()) {
			JError::raiseWarning(1000, $this->_db->getErrorMsg());
			return false;
		}



		// Store the travel table to the database
		if (!$row->store())
        {
			JError::raiseWarning(1000, $this->_db->getErrorMsg());
			return false;
		}



		$this->_id = $row->id;
		$this->_data = $row;



		return true;
	}
	/**
	 * Method to delete a package
	 *
	 * @access	public
	 * @return	boolean	True on success
	 */
	function delete($cid = array())
	{
		$result = false;

		if (count( $cid ))
		{
			JArrayHelper::toInteger($cid);
			$cids = implode( ',', $cid );

			$query = 'DELETE FROM `#__travel_packages`'
				. ' WHERE id IN ( '.$cids.' )';
			$this->_db->setQuery( $query );
			if(!$this->_db->query()) {
				JError::raiseWarning(1000, $this->_db->getErrorMsg());
				return false;
			}



		}

		return true;
	}
	/**
	 * Method to move a package
	 *
	 * @access	public
	 * @return	boolean	True on success
	 */
	function move($direction)
	{
		$row = $this->getTable();
		if (!$row->load($this->_id)) {
			JError::raiseWarning(1000, $this->_db->getErrorMsg());
			return false;
		}

		$condition = "1";


		if (!$row->move( $direction,  $condition)) {
			JError::raiseWarning(1000, $this->_db->getErrorMsg());
			return false;
		}

		return true;
	}

	/**
	 * Method to save the order of the packages
	 *
	 * @access	public
	 * @return	boolean	True on success
	 */
	function saveorder($cid = array(), $order)
	{
		$row = $this->getTable();

		// update ordering values
		for( $i=0; $i < count($cid); $i++ )
		{
			$row->load( (int) $cid[$i] );

			if ($row->ordering != $order[$i])
			{
				$row->ordering = $order[$i];
				if (!$row->store()) {
					JError::raiseWarning(1000, $this->_db->getErrorMsg());
					return false;
				}
			}
		}

		$row->reorder();


		return true;
	}
	/**
	 * Method to (un)publish a package
	 *
	 * @access	public
	 * @return	boolean	True on success
	 */
	function publish($cid = array(), $publish = 1)
	{
		$user 	= JFactory::getUser();

		if (count( $cid ))
		{
			JArrayHelper::toInteger($cid);
			$cids = implode( ',', $cid );

			$query = 'UPDATE #__travel_packages'
				. ' SET `published` = '.(int) $publish
				. ' WHERE id IN ( '.$cids.' )'


			;
			$this->_db->setQuery( $query );
			if (!$this->_db->query()) {
				JError::raiseWarning(1000, $this->_db->getErrorMsg());
				return false;
			}
		}

		return true;
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

		if (!isset($this->_data))
			return;

		$item = $this->_data;
		$acl = TravelHelper::getAcl();

		if ($acl->get('core.edit.state')
			|| (bool)$item->published)
			$item->params->set('access-view', true);

		if ($acl->get('core.edit'))
			$item->params->set('access-edit', true);

		if ($acl->get('core.delete'))
			$item->params->set('access-delete', true);



	}




}