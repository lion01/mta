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
 * OS Membership Component Plugin Model
 *
 * @package		Joomla
 * @subpackage	OS Membership
 * @since 1.5
 */
class OSMembershipModelPlugin extends OSModel
{
	/**
	 * Save plugin parameter
	 * @see OSModel::store()
	 */		
	function store(&$data)
	{
		$row = & $this->getTable('Osmembership', 'Plugin');
		if ($data['id'])
			$row->load($data['id']);									
		if (!$row->bind($data)) {
			$this->setError($this->_db->getErrorMsg());
			return false;
		}				
		//Save parameters
		$params		= JRequest::getVar( 'params', null, 'post', 'array' );		
		if (is_array($params))
		{
			$txt = array ();
			foreach ($params as $k => $v) {
				if (is_array($v)) {
					$v = implode(',', $v);	
				}
				$v =  str_replace("\r\n", '@@', $v) ;				
				$txt[] = "$k=\"$v\"";
			}
			$row->params = implode("\n", $txt);
		}
		if (!$row->store()) {
			$this->setError($this->_db->getErrorMsg());
			return false;
		}				
		$data['id'] = $row->id ;
		
		return true ;
		
	}		
	/**
	 * Install a plugin
	 * @return boolean
	 */
	function install() {
		$db = & JFactory::getDBO();
		jimport('joomla.filesystem.folder');
		jimport('joomla.filesystem.file');
		jimport('joomla.filesystem.archive');
		$plugin = JRequest::getVar('plugin_package', null, 'files');
		if ( $plugin['error'] || $plugin['size'] < 1 )
		{
			JRequest::setVar('msg', JText::_('Upload plugin package error')) ;
						
			return false;
		}
		$config =& JFactory::getConfig();
		$dest 	= $config->getValue('config.tmp_path').'/'.$plugin['name'];
		$uploaded = JFile::upload($plugin['tmp_name'], $dest);
		if (!$uploaded) {
			JRequest::setVar('msg', JText::_('OSM_PLUGIN_UPLOAD_FAILED')) ;
			
			return false;
		}
		// Temporary folder to extract the archive into
		$tmpdir = uniqid('install_');
		$extractdir = JPath::clean(dirname($dest).'/'.$tmpdir);
		$result = JArchive::extract($dest , $extractdir);
		if (!$result) {
			JRequest::setVar('msg', JText::_('OSM_EXTRACT_PLUGIN_ERROR')) ;
			return false;
		}
		$dirList = array_merge(JFolder::files($extractdir, ''), JFolder::folders($extractdir, ''));
		if (count($dirList) == 1)
		{
			if (JFolder::exists($extractdir.'/'.$dirList[0]))
			{
				$extractdir = JPath::clean($extractdir.'/'.$dirList[0]);
			}
		}
		//Now, search for xml file
		$xmlfiles = JFolder::files($extractdir, '.xml$', 1, true);
		if (empty($xmlfiles)) {
			JRequest::setVar('msg', JText::_('OSM_COULD_NOT_FIND_XML_FILE')) ;
			return false;
		}
		$file = $xmlfiles[0] ;
		$xml	=& JFactory::getXMLParser('Simple');
		if (!$xml->loadFile($file)) {
			unset ($xml);
			JRequest::setVar('msg', JText::_('OSM_COULOD_NOT_LOAD_XML_FILE')) ;
			return false;
		}
				
		$root =& $xml->document;
		$pluginType = $root->attributes('type') ;				
		$pluginGroup = $root->attributes('group') ;			
		if ($root->name() !=='install') {
			JRequest::setVar('msg', JText::_('OSM_INVALID_XML_FILE')) ;
			return false;
		}
		if ($pluginType != 'osmplugin') {
			JRequest::setVar('msg', JText::_('OSM_INVALID_OSM_PLUGIN')) ;
			return false;
		}		
		$element = $root->name ;
		$name = $element ? $element[0]->data() : '';						
		$element = $root->title ;
		$title = $element ? $element[0]->data() : '';
		$element = $root->author ;
		$author = $element ? $element[0]->data() : '';
		$element = $root->creationDate ;
		$creationDate = $element ? $element[0]->data() : '';
		$element = $root->copyright ;
		$copyright = $element ? $element[0]->data() : '';
		$element = $root->license ;
		$license = $element ? $element[0]->data() : '';
		$element = $root->authorEmail ;
		$authorEmail = $element ? $element[0]->data() : '';
		$element = $root->authorUrl ;
		$authorUrl = $element ? $element[0]->data() : '';
		$element = $root->version ;
		$version = $element ? $element[0]->data() : '';
		$element = $root->description ;
		$description = $element ? $element[0]->data() : '';
		$row = & JTable::getInstance('OSMembership', 'Plugin') ;		
		$sql = 'SELECT id FROM #__osmembership_plugins WHERE name="'.$name.'"';
		$db->setQuery($sql);
		$pluginId = (int) $db->loadResult();
		if ($pluginId) {
			$row->load($pluginId);
			$row->name  = $name ;
			$row->title = $title ;
			$row->author = $author ;
			$row->creation_date = $creationDate ;
			$row->copyright = $copyright ;
			$row->license = $license ;
			$row->author_email = $authorEmail ;
			$row->author_url = $authorUrl ;
			$row->version = $version ;
			$row->description = $description ;
		} else {
			$row->name  = $name ;
			$row->title = $title ;
			$row->author = $author ;
			$row->creation_date = $creationDate ;
			$row->copyright = $copyright ;
			$row->license = $license ;
			$row->author_email = $authorEmail ;
			$row->author_url = $authorUrl ;
			$row->version = $version ;
			$row->description = $description ;
			$row->published = 0 ;
			$row->ordering = $row->getNextOrder('published=1');
		}								
		$row->store() ;				
		$pluginDir = JPATH_ROOT.'/components/com_osmembership/plugins' ;		
		JFile::move($file, $pluginDir.'/'.basename($file)) ;
		$files = $root->files[0]->children() ;
		for ($i = 0 , $n = count($files) ; $i < $n; $i++) {
			$file = $files[$i] ;
			if ($file->name() == 'filename') {
				$fileName = $file->data();
				if (!JFile::exists($pluginDir.'/'.$fileName)) {
					JFile::copy($extractdir.'/'.$fileName, $pluginDir.'/'.$fileName);
				}
			}elseif ($file->name() == 'folder') {
				$folderName = $file->data();
				if (JFolder::exists($extractdir.'/'.$folderName)) {
					JFolder::move($extractdir.'/'.$folderName, $pluginDir.'/'.$folderName) ;
				}
			}
		}
		$element = $root->installsql ;		
		$sqlFile = $element ? $element[0]->data() : '' ;		
		if ($sqlFile && JFile::exists($extractdir.'/'.$sqlFile)) {			
			$sqlFile = $extractdir.'/'.$sqlFile ;			
			$sql = JFile::read($sqlFile) ;
			$queries = $db->splitSql($sql);
			if (count($queries)) {
				foreach ($queries as $query) {
					$query = trim($query) ;					
					if ($query != '' && $query{0} != '#') {
						$db->setQuery($query);
						$db->query();
					}
				}
			}
		}
		$element = $root->installfile ;
		$fileName = $element ? $element[0]->data() : '' ;		
		if (JFile::exists($extractdir.'/'.$fileName)) {
			$installFile = $extractdir.'/'.$fileName ;					
			if (JFile::exists($installFile)) {				
				require_once $installFile ;
				if (function_exists('osm_plugin_install')) {
					osm_plugin_install() ;
				}
			}
		}								
		JFolder::delete($extractdir) ;
				
		return true ;
	}
	/**
	 * Remove the selected plugin
	 * @see OSModel::delete()
	 */	
	function delete($cid) {
		jimport('joomla.filesystem.folder') ;
		jimport('joomla.filesystem.file') ;
		$row = & JTable::getInstance('OSMembership', 'Plugin');				
		$pluginDir = JPATH_ROOT.'/components/com_osmembership/plugins' ;
		foreach ($cid as $id) {
			$row->load($id);
			$name = $row->name ;			
			$file = $pluginDir.'/'.$name.'.xml' ;
			$xml	=& JFactory::getXMLParser('Simple') ;
			if (!$xml->loadFile($file)) {
				unset ($xml) ;
				//Simply delete the record
				$row->delete();
			} else {
				$root = & $xml->document ;
				$files = $root->files[0]->children() ;
					
				for ($i = 0 , $n = count($files) ; $i < $n; $i++) {
					$file = $files[$i] ;
					if ($file->name() == 'filename') {
						$fileName = $file->data();
						if (JFile::exists($pluginDir.'/'.$fileName)) {
							JFile::delete($pluginDir.'/'.$fileName) ;
						}
					}elseif ($file->name() == 'folder') {
						$folderName = $file->data();
						if ($folderName) {
							if (JFolder::exists($pluginDir.'/'.$folderName)) {
								JFolder::delete($pluginDir.'/'.$folderName) ;
							}
						}
					}
				}
				$languages =  $root->languages ;
				if ($languages) {
					$languageFolder = JPATH_ROOT.'/language' ;
					$files = $languages[0]->filename ;
					for ($i = 0 , $n = count($files) ; $i < $n; $i++) {
						$file = $files[$i] ;
						$fileName = $file->data();
						$pos = strpos($fileName, '.') ;
						$languageSubFolder = substr($fileName, 0, $pos) ;
						if (JFile::exists($languageFolder.'/'.$languageSubFolder.'/'.$fileName)) {
							JFile::delete($languageFolder.'/'.$languageSubFolder.'/'.$fileName) ;
						}
					}
				}
				JFile::delete($pluginDir.'/'.$name.'.xml') ;			
				$row->delete();
			}			
		}				
		return true ;
	}		
}