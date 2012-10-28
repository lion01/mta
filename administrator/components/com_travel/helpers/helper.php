<?php
/**                               ______________________________________________
*                          o O   |                                              |
*                 (((((  o      <    Generated with Cook Self Service  V1.5.2   |
*                ( o o )         |______________________________________________|
* --------oOOO-----(_)-----OOOo---------------------------------- www.j-cook.pro --- +
* @version		1.0.0
* @package		Travel
* @subpackage	Viewlevels
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


// no direct access
defined( '_JEXEC' ) or die( 'Restricted access' );

if (!class_exists('JDom'))
	require_once(JPATH_ADMIN_TRAVEL .DS.'dom'.DS.'dom.php');

class TravelHelper
{
	/*
	 * Recreate the URL with a redirect in order to :
	 * 	-> keep an good SEF
	 *  -> always kill the post
	 *  -> precisely control the request
	 */
	function urlRequest($vars = array())
	{
		$parts = array();

		//Contains followers
		$authorizedInUrl = array('option', 'view', 'layout', 'Itemid', 'tmpl', 'lang');

		$request = JRequest::get();
		foreach($request as $key => $value)
		{
			if (in_array($key, $authorizedInUrl))
				$parts[] = $key . '=' . $value;
		}


		$cid = JRequest::getVar( 'cid', array(), 'post', 'array' );
        if (empty($cid))
			$cid = JRequest::getVar( 'cid', array(), 'get', 'array' );
		if (!empty($cid))
		{
			$cidVals = implode(",", $cid);
			if ($cidVals != '0')
				$parts[] = 'cid[]=' . $cidVals;
		}


		if (count($vars))
		foreach($vars as $key => $value)
			$parts[] = $key . '=' . $value;

		return JRoute::_("index.php?" . implode("&", $parts), false);
	}

	/*
	 * Redirect Back
	 * Can be called in View if controller redirection has already been done
	 * Can be raised when the user ask a page with a direct url
	 * Handle some security to avoid recursivity
	 * TODO : Customize your own rules here
	 */
	function redirectBack($notAllowed = true)
	{
		if ($notAllowed && JFactory::getUser()->id == 0)
		{
			JRequest::setVar('option','com_users');
			JRequest::setVar('view','login');
			JRequest::setVar('layout','');

			$url = self::urlRequest();					//Login page
		}
		else
		{
			// TODO : Not finished : only redirect to Root
			JFactory::getApplication()->redirect(JURI::base(true));
			return;

			$current = JURI::current();

			//Get the previous page : TODO : finish this
			$url = (isset($_SERVER['HTTP_REFERER'])?$_SERVER['HTTP_REFERER']:null);

			if (!$url || ($url == $current))
			{
				JRequest::setVar('view','');
				JRequest::setVar('layout','');

				$url = self::urlRequest();				//Component Root
			}
			if ($url == $current)
			{
				$url = JURI::base(true);				// Site Root
			}
		}


		JFactory::getApplication()->redirect($url);

	}

	function headerDeclarations()
	{
		$app = JFactory::getApplication();
		$doc = JFactory::getDocument();

		$siteUrl = JURI::root(true);
		$siteUrl = str_replace("\\", "/", $siteUrl);   //Win servers

		$componentUrl = $siteUrl . '/components/com_travel';
		$componentUrlAdmin = $siteUrl .'/administrator/components/com_travel';


		//Javascript
		$doc->addScript($siteUrl . '/media/system/js/core.js');
		// Mootools non conflict is handled here :
		$doc->addScriptDeclaration("var Moo = document.id;");

		//Load jQuery from the CDN
		$doc->addScript('http://code.jquery.com/jquery.min.js');
		$doc->addScript('http://code.jquery.com/ui/1.8.24/jquery-ui.min.js');

		//Load the jQuery-Validation-Engine (MIT License, Copyright(c) 2011 Cedric Dugas http://www.position-absolute.com)
		$doc->addScript($componentUrlAdmin . '/js/jquery.validationEngine.js');
		$doc->addStyleSheet($componentUrlAdmin . '/css/validationEngine.jquery.css');
		cimport('helpers.html.validator');
		JHtmlValidator::loadLanguageScript();

		//TODO : Define here the default framework to use with $
		// Mootools is still used in Joomla native javascript functionalities
		$doc->addScriptDeclaration("var $" . " = Moo;");  //Moo ; jQuery

		/*
		 * How to write a plugins in non-conflict modes :
		 *
		 (function($){
		// Write your code here, using $.
		// The local var $ represents jQuery framework
		})(jQuery);


		// exactly the same, with for MooTools plugins
		 (function($){
		...
		})(Moo);

		 */


		//CSS
		if ($app->isAdmin())
		{
			$doc->addStyleSheet($componentUrlAdmin . '/css/travel.css');
			$doc->addStyleSheet($componentUrlAdmin . '/css/toolbar.css');
			// Blue stork override
			$styles = "fieldset td.key label{display: block;}fieldset input, fieldset textarea, fieldset select, fieldset img, fieldset button{float: none;}fieldset label, fieldset span.faux-label{float: none;display: inline;min-width: inherit;}";
			$doc->addStyleDeclaration($styles);

		}
		else if ($app->isSite())
		{
			$doc->addStyleSheet($componentUrl . '/css/travel.css');
			$doc->addStyleSheet($componentUrl . '/css/toolbar.css');
		}


	}


	function getACL()
	{
		jimport('joomla.access.access');
		$user	= JFactory::getUser();
		$result	= new JObject;


		$actions = JAccess::getActions('com_travel', 'component');

		foreach ($actions as $action) {
			$result->set($action->name,	$user->authorise($action->name, 'com_travel'));
		}

		return $result;

	}
	function getSqlDate($strtime, $formats)
	{
		//Push the default SQL date format
		if (!in_array("%Y-%m-%d", $formats))
			$formats[] = "%Y-%m-%d";

		//Push the default SQL datetime format
		if (!in_array("%Y-%m-%d %H:%M:%S", $formats))
			$formats[] = "%Y-%m-%d %H:%M:%S";

		//Push the default SQL time format
		if (!in_array("%H:%M:%S", $formats))
			$formats[] = "%H:%M:%S";


		foreach($formats as $format)
		{
			$regex = self::strftime2regex($format);
			if (preg_match($regex, $strtime))
			{

				return self::dateFromFormat($strtime, $format);
			}

		}
	}


	function getUnixTimestamp($strtime, $formats)
	{
		//Check if the string is already a timestamp
		if (preg_match("/^[0-9]{1,10}$/", $strtime))
			return $strtime;

		foreach($formats as $format)
		{
			$regex = self::strftime2regex($format);
			if (preg_match($regex, $strtime))
				return self::timeFromFormat($strtime, $format);
		}
	}

	 /**
	 * 	Convert format to REGEX language and escape the format
	 * @format	string : the strftime format used to decode
	 * 		/!\ Only supports : %Y, %y, %m, %d, %H, %M, %S
	 *	return standard regular expression
	 */
	function strftime2regex($format)
	{
		$d2 = "(\d{2})";
		$d4 = "([1-9]\d{3})";

		$patterns =
array(	"\\", 	"/", 	"#",	"!", 	"^", "$", "(", ")", "[", "]", "{", "}", "|", "?", "+", "*", ".",
		"%Y", 	"%y",	"%m",	"%d", 	"%H", 	"%M", 	"%S", 	" ");
		$replacements =
array(	"\\", "\/", 	"\#",	"\!", 	"\^", "$", "\(", "\)", "\[", "\]", "\{", "\}", "\|", "\?", "\+", "\*", "\.",
		$d4,	$d2,	$d2,	$d2,	$d2,	$d2,	$d2,	"\s");

		$regex = str_replace($patterns, $replacements, $format);

		return "/^" . $regex . "$/";
	}

	function explodeDate($time, $format)
	{
		$regex = self::strftime2regex($format);

	//Prepare the search depending on attempted format
		$pos = array();
		$pos['year4'] = strpos($format, "%Y");
		$pos['year2'] = strpos($format, "%y");
		$pos['month'] = strpos($format, "%m");
		$pos['day'] = strpos($format, "%d");

		$pos['hour'] = strpos($format, "%H");
		$pos['minute'] = strpos($format, "%M");
		$pos['second'] = strpos($format, "%S");

		asort($pos);

		$i = 1;
		foreach($pos as $key => $value)
		{
			if ($value === false)
			{
				unset($pos[$key]);
				continue;
			}
			$pos[$key] = $i;
			$i++;
		}

	//Split the values
		preg_match_all($regex, $time, $matches);

	//Choose year on 2 or 4 digits
		$pos['year'] = ((isset($pos['year4']) && (int)$pos['year4'] > 0)?$pos['year4']:(isset($pos['year2'])?$pos['year2']:null));

	//Retreive the independant values in the matches
		$v = array();
		$defaults = array('year' => '0000','month' => '00','day' => '00','hour' => '00','minute' => '00','second' => '00',);
		foreach($defaults as $key => $default)
		{
			if ((isset($pos[$key])) && ($p = (int)$pos[$key]) && ($p > 0) && (count($matches[$p])))
				$v[$key] = $matches[$p][0];
			else
				$v[$key] = $default;
		}

		return $v;
	}


	/*
	 * Reverse function of the JDate::toFormat()
	 *
	 * @datetime	string : the formated datetime to decode
	 * @format	 	string : the strftime format used to decode
	 * 		/!\ Only supports : %Y, %y, %m, %d, %H, %M, %S
	 *
	 *
	 */
	function dateFromFormat($datetime, $format)
	{
		$v = self::explodeDate($datetime, $format);

	// Check gregorian valid date
		if (trim($v['month'], '0') && trim($v['day'], '0') && trim($v['year'], '0'))
		if (!checkdate($v['month'], $v['day'], $v['year']))
			return null;

		return new JDate( $v['year'] .'-'. $v['month'] .'-'. $v['day'] .' '. $v['hour'] .':'. $v['minute'] .':'.$v['second']);
	}



	 /* Create a unix timestamp from a given format
	 *
	 * @datetime	string : the formated datetime to decode
	 * @format 		string : the strftime format used to decode
	 * 		/!\ Only supports : %Y, %y, %m, %d, %H, %M, %S
	 *
	 *
	 */
	function timeFromFormat($datetime, $format, $gmt = true)
	{
		$v = self::explodeDate($datetime, $format);

	// Check gregorian valid date
		if (trim($v['month'], '0') && trim($v['day'], '0') && trim($v['year'], '0'))
		if (!checkdate($v['month'], $v['day'], $v['year']))
			return null;

		if ($gmt)
			return gmmktime($v['hour'], $v['minute'], $v['second'], $v['month'], $v['day'], $v['year']);

		return mktime($v['hour'], $v['minute'], $v['second'], $v['month'], $v['day'], $v['year']);
	}

	function enumList($ctrl, $fieldName)
	{
		$lists = array();

		$lists["sales"]["status"] = array();
		$lists["sales"]["status"]["1"] = array("value" => "1", "text" => JText::_("TRAVEL_ENUM_SALES_STATUS_AWAITING_PAYMENT"));
		$lists["sales"]["status"]["2"] = array("value" => "2", "text" => JText::_("TRAVEL_ENUM_SALES_STATUS_COMPLETED"));
		$lists["sales"]["status"]["3"] = array("value" => "3", "text" => JText::_("TRAVEL_ENUM_SALES_STATUS_CANCEL"));


		$lists["sales"]["shipping"] = array();
		$lists["sales"]["shipping"]["1"] = array("value" => "1", "text" => JText::_("TRAVEL_ENUM_SALES_SHIPPING_PICKUP"));
		$lists["sales"]["shipping"]["2"] = array("value" => "2", "text" => JText::_("TRAVEL_ENUM_SALES_SHIPPING_DELIVERY"));


		$lists["commissions"]["type"] = array();
		$lists["commissions"]["type"]["1"] = array("value" => "1", "text" => JText::_("TRAVEL_ENUM_COMMISSIONS_TYPE_PERSONAL_COMMISSION"));
		$lists["commissions"]["type"]["2"] = array("value" => "2", "text" => JText::_("TRAVEL_ENUM_COMMISSIONS_TYPE_GROUP_COMMISSION"));
		$lists["commissions"]["type"]["3"] = array("value" => "3", "text" => JText::_("TRAVEL_ENUM_COMMISSIONS_TYPE_ANNUAL_INCENTIVE"));




		return $lists[$ctrl][$fieldName];
	}

}
class TravelThirdTable
{
	var $tableName;
	var $select;
	var $join;
	var $order;
	var $extra;

	function __construct($tableName)
	{
		$this->tableName = $tableName;
	}
	function setQuery($select = null, $join = null, $where = null, $order = null, $extra = null)
	{
		$this->select =	$select;
		$this->join = 	$join;
		$this->where = 	$where;
		$this->order = 	$order;
		$this->extra = 	$extra;

	}
	function loadObjectList()
	{
		$db = JFactory::getDBO();


		$query = 		'SELECT *' . $this->select
					. 	' FROM #__' . $this->tableName;

		if ($this->join)
			$query .=	", " . $this->join;

		if ($this->where)
			$query .= 	' WHERE ' . $this->where;

		if ($this->order)
			$query .= 	' ORDER BY '. $this->order;

		if ($this->extra)
			$query .=	" " . $this->extra;

		$db->setQuery( $query );

		return $db->loadObjectList();
	}
}

class TravelJUserHelper
{
	function userList($select = '', $join = '', $where = '`block` = 0', $order = 'name', $extra = '')
	{
		$third = new TravelThirdTable('users');
		$third->setQuery($select, $join, $where, $order, $extra);


		return $third->loadObjectList();
	}


}



