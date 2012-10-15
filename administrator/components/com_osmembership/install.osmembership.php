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

class com_osmembershipInstallerScript {
	/**
	 * method to install the component
	 *
	 * @return void
	 */
	function install($parent)
	{
		com_install() ;
	}

	function update($parent)
	{
		com_install() ;
	}
}	

/**
 * Change the db structure of the previous version
 *
 */
function com_install( ) {
	error_reporting(0);
    jimport('joomla.filesystem.file') ;
    jimport('joomla.filesystem.folder') ;
	$db = & JFactory::getDBO(); 			
	$sql = 'SELECT COUNT(*) FROM #__osmembership_configs';
	$db->setQuery($sql) ;	
	$total = $db->loadResult();
	if (!$total) {		
		$configSql = JPATH_ADMINISTRATOR.'/components/com_osmembership/sql/config.osmembership.sql' ;
		$sql = JFile::read($configSql) ;
		$queries = $db->splitSql($sql);
		if (count($queries)) {
			foreach ($queries as $query) {
			$query = trim($query);
			if ($query != '' && $query{0} != '#') {
					$db->setQuery($query);
					$db->query();						
				}	
			}
		}
	}

	$sql = 'SELECT COUNT(*) FROM #__osmembership_fields';
	$db->setQuery($sql) ;
	$total = $db->loadResult();
	if (!$total) {
		$coreFieldsSql = JPATH_ADMINISTRATOR.'/components/com_osmembership/sql/fields.osmembership.sql' ;
		$sql = JFile::read($coreFieldsSql) ;
		$queries = $db->splitSql($sql);
		if (count($queries)) {
			foreach ($queries as $query) {
				$query = trim($query);
				if ($query != '' && $query{0} != '#') {
					$db->setQuery($query);
					$db->query();
				}
			}
		}
	}

	$sql = 'SELECT COUNT(*) FROM #__osmembership_plugins';
	$db->setQuery($sql) ;
	$total = $db->loadResult();
	if (!$total) {
		$pluginsSql = JPATH_ADMINISTRATOR.'/components/com_osmembership/sql/plugins.osmembership.sql' ;
		$sql = JFile::read($pluginsSql) ;
		$queries = $db->splitSql($sql);
		if (count($queries)) {
			foreach ($queries as $query) {
				$query = trim($query);
				if ($query != '' && $query{0} != '#') {
					$db->setQuery($query);
					$db->query();
				}
			}
		}
	}
	
	#Subscription plans table
		
	$sql = ' SHOW FIELDS FROM #__osmembership_plans ';
	$db->setQuery($sql) ;
	$rows = $db->loadObjectList();
	$fields = array();
	for ($i = 0 , $n = count($rows); $i < $n; $i++) {
		$row = $rows[$i];
		$fields[] = $row->Field;
	}
			
	if (!in_array('expired_date', $fields)) {
		$sql = "ALTER TABLE  `#__osmembership_plans` ADD  `expired_date` DATETIME NULL AFTER  `price` ;";
		$db->setQuery($sql);
		$db->query();
	}
		
	if (!in_array('recurring_subscription', $fields)) {
		$sql = "ALTER TABLE  `#__osmembership_plans` ADD  `recurring_subscription` TINYINT NOT NULL DEFAULT  '0';";
		$db->setQuery($sql);
		$db->query();
	}

	if (!in_array('enable_renewal', $fields)) {
		$sql = "ALTER TABLE  `#__osmembership_plans` ADD  `enable_renewal` TINYINT NOT NULL DEFAULT  '1';";
		$db->setQuery($sql);
		$db->query();
		
		$sql = 'UPDATE `#__osmembership_plans` SET `enable_renewal`=1 ';
		$db->setQuery($sql);
		$db->query();		
	}
	
	if (!in_array('trial_amount', $fields)) {
		$sql = "ALTER TABLE  `#__osmembership_plans` ADD  `trial_amount` DECIMAL( 10, 2 ) NULL DEFAULT  '0';";
		$db->setQuery($sql);
		$db->query();
	}
	
	if (!in_array('number_payments', $fields)) {
		$sql = "ALTER TABLE  `#__osmembership_plans` ADD  `number_payments` INT NOT NULL DEFAULT  '0';";
		$db->setQuery($sql);
		$db->query();
	}

	//Create the categories table, added in version 1.1.1
	$sql = "CREATE TABLE IF NOT EXISTS `#__osmembership_categories` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`title` VARCHAR(255) NULL,
	`description` TEXT NULL,
	`published` TINYINT UNSIGNED NULL,
	PRIMARY KEY(`id`)
	) DEFAULT CHARSET=utf8 ;";
	$db->setQuery($sql) ;
	$db->query();
		
	if (!in_array('category_id', $fields)) {
		$sql = "ALTER TABLE  `#__osmembership_plans` ADD  `category_id` INT NOT NULL DEFAULT  '0';";
		$db->setQuery($sql);
		$db->query();
	}	
	#Subscribers table
	$sql = ' SHOW FIELDS FROM #__osmembership_subscribers ';
	$db->setQuery($sql) ;
	$rows = $db->loadObjectList();
	$fields = array();
	for ($i = 0 , $n = count($rows); $i < $n; $i++) {
		$row = $rows[$i];
		$fields[] = $row->Field;
	}
				
	if (!in_array('payment_made', $fields)) {
		$sql = "ALTER TABLE  `#__osmembership_subscribers` ADD  `payment_made` INT NOT NULL DEFAULT  '0';";
		$db->setQuery($sql);
		$db->query();
	}
	
	if (!in_array('membership_id', $fields)) {
		$sql = "ALTER TABLE  `#__osmembership_subscribers` ADD  `membership_id` INT NOT NULL DEFAULT  '0';";
		$db->setQuery($sql);
		$db->query();

		//Update membership Id field
		$sql = 'SELECT id FROM #__osmembership_subscribers ORDER BY id';
		$db->setQuery($sql);
		$rows = $db->loadObjectList() ;		
		if (count($rows)) {
			$start = 1000 ;
			foreach ($rows as $row) {
				$sql = 'UPDATE #__osmembership_subscribers SET membership_id='.$start.' WHERE id='.$row->id;
				$db->setQuery($sql);
				$db->query();				
				$start++ ;
			}
		}						
	}	
	#Payment Plugins table
	
	$sql = ' SHOW FIELDS FROM #__osmembership_plugins ';
	$db->setQuery($sql) ;
	$rows = $db->loadObjectList();
	$fields = array();
	for ($i = 0 , $n = count($rows); $i < $n; $i++) {
		$row = $rows[$i];
		$fields[] = $row->Field;
	}	
	if (!in_array('support_recurring_subscription', $fields)) {
		$sql = "ALTER TABLE  `#__osmembership_plugins` ADD  `support_recurring_subscription` TINYINT NOT NULL DEFAULT  '0';";
		$db->setQuery($sql);
		$db->query();				
	}
	
	
	$recurringSupportedPlugins = array('os_paypal', 'os_authnet');
	$sql = 'UPDATE #__osmembership_plugins SET support_recurring_subscription=1 WHERE name IN ("'.implode('","', $recurringSupportedPlugins).'")';
	$db->setQuery($sql);
	$db->query() ;
						
	$installer = JInstaller::getInstance() ;	
	$src = $installer->getPath('source');		
	//Install Modules and Plugins
	
	
	if (version_compare(JVERSION, '1.6.0', 'ge')) {
		$installation_queue = array(
		
				// modules => { (folder) => { (module) => { (position), (published) } }* }*
				/*'modules' => array(
				 'admin' => array(
				 		'akeebasubs' => array('cpanel', 1)
				 ),
						'site' => array(
								'aksexpires' => array('left', 0),
								'aksubslist' => array('left', 0),
								'akslevels' => array('left', 0)
						)
				),*/
					
				'plugins' => array(
						'osmembership' => array(
								'cb'			=> 0,
								'jomsocial'			=> 0,
								'joomlagroups'				=> 0,
								'docman'		=> 0,
								'menu'					=> 0,
								'module'			=> 0,
								'urls'				=> 0,
								'user'				=> 1,
								'membershipid' => 0
						),
						'system' => array(
								'osmembershipoverrides'	=> 0,
								'osmembershipreminder'	=> 1,
								'osmembershipupdatestatus'	=> 1,
								'osmembershipurls'	=> 0
						)
				)
		);
	} else {
		$installation_queue = array(
		
				// modules => { (folder) => { (module) => { (position), (published) } }* }*
				/*'modules' => array(
				 'admin' => array(
				 		'akeebasubs' => array('cpanel', 1)
				 ),
						'site' => array(
								'aksexpires' => array('left', 0),
								'aksubslist' => array('left', 0),
								'akslevels' => array('left', 0)
						)
				),*/
					
				'plugins' => array(
						'osmembership' => array(
								'cb'			=> 0,
								'jomsocial'			=> 0,
								'joomlagroups'				=> 0,
								'docman'		=> 0,
								'menu'					=> 0,
								'module'			=> 0,
								//'urls'				=> 0
						),
						'system' => array(
								//'osmembershipoverrides'	=> 0,
								'osmembershipreminder'	=> 1,
								'osmembershipupdatestatus'	=> 1,
								'osmembershipurls'	=> 0
						)
				)
		);
	}		

	
	//Install plugins
	
	
	if(count($installation_queue['plugins'])) {
		foreach($installation_queue['plugins'] as $folder => $plugins) {
			if(count($plugins)) foreach($plugins as $plugin => $published) {
				$path = "$src/plugins/$folder/$plugin";
				if(!is_dir($path)) continue;
					
				// Was the plugin already installed?
				if( version_compare( JVERSION, '1.6.0', 'ge' ) ) {
					$query = "SELECT COUNT(*) FROM  #__extensions WHERE element=".$db->Quote($plugin)." AND folder=".$db->Quote($folder);
				} else {
					$query = "SELECT COUNT(*) FROM  #__plugins WHERE element=".$db->Quote($plugin)." AND folder=".$db->Quote($folder);
				}
				$db->setQuery($query);
				$count = $db->loadResult();
					
				$installer = new JInstaller;
				$result = $installer->install($path);									
				if($published && !$count) {
					if( version_compare( JVERSION, '1.6.0', 'ge' ) ) {
						$query = "UPDATE #__extensions SET enabled=1 WHERE element=".$db->Quote($plugin)." AND folder=".$db->Quote($folder);
					} else {
						$query = "UPDATE #__plugins SET published=1 WHERE element=".$db->Quote($plugin)." AND folder=".$db->Quote($folder);
					}
					$db->setQuery($query);
					$db->query();
				}
			}
		}
	}

	//Install Modules	
	
	
	if(count($installation_queue['modules'])) {
		foreach($installation_queue['modules'] as $folder => $modules) {
			if(count($modules)) foreach($modules as $module => $modulePreferences) {
				// Install the module
				if(empty($folder)) $folder = 'site';
				$path = "$src/modules/$folder/$module";
				if(!is_dir($path)) continue;
				// Was the module alrady installed?
				$sql = 'SELECT COUNT(*) FROM #__modules WHERE `module`='.$db->Quote('mod_'.$module);
				$db->setQuery($sql);
				$count = $db->loadResult();
				$installer = new JInstaller;
				$result = $installer->install($path);
				$status->modules[] = array('name'=>'mod_'.$module, 'client'=>$folder, 'result'=>$result);
				// Modify where it's published and its published state
				if(!$count) {
					// A. Position and state
					list($modulePosition, $modulePublished) = $modulePreferences;
					if(version_compare(JVERSION, '2.5.0', 'ge') && ($modulePosition == 'cpanel')) {
						$modulePosition = 'icon';
					}
					$sql = "UPDATE #__modules SET position=".$db->Quote($modulePosition);
					if($modulePublished) $sql .= ', published=1';
					$sql .= ' WHERE `module`='.$db->Quote('mod_'.$module);
					$db->setQuery($sql);
					$db->query();
					if(version_compare(JVERSION, '1.7.0', 'ge')) {
						// B. Change the ordering of back-end modules to 1 + max ordering in J! 1.7+
						if($folder == 'admin') {
							$query = $db->getQuery(true);
							$query->select('MAX('.$db->qn('ordering').')')
							->from($db->qn('#__modules'))
							->where($db->qn('position').'='.$db->q($modulePosition));
							$db->setQuery($query);
							$position = $db->loadResult();
							$position++;
	
							$query = $db->getQuery(true);
							$query->update($db->qn('#__modules'))
							->set($db->qn('ordering').' = '.$db->q($position))
							->where($db->qn('module').' = '.$db->q('mod_'.$module));
							$db->setQuery($query);
							$db->query();
						}
						// C. Link to all pages on Joomla! 1.7+
						$query = $db->getQuery(true);
						$query->select('id')->from($db->qn('#__modules'))
						->where($db->qn('module').' = '.$db->q('mod_'.$module));
						$db->setQuery($query);
						$moduleid = $db->loadResult();
							
						$query = $db->getQuery(true);
						$query->select('*')->from($db->qn('#__modules_menu'))
						->where($db->qn('moduleid').' = '.$db->q($moduleid));
						$db->setQuery($query);
						$assignments = $db->loadObjectList();
						$isAssigned = !empty($assignments);
						if(!$isAssigned) {
							$o = (object)array(
									'moduleid'	=> $moduleid,
									'menuid'	=> 0
							);
							$db->insertObject('#__modules_menu', $o);
						}
					}
				}
			}
		}
	}
	
}
