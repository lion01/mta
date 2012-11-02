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

defined('_JEXEC') or die('Restricted access'); ?>

<?php TravelHelper::headerDeclarations(); ?>





<h1 class='componentheading'><?php echo(JText::_("TRAVEL_LAYOUT_PACKAGE"));?></h1>





	<div>
		<?php echo $this->loadTemplate('fly'); ?>
	</div>









	<input name="_download" type="hidden" id="_download" value=""/>

	<?php echo JDom::_('html.form.footer', array(
		'dataObject' => $this->package,
		'values' => array(
				'option' => "com_travel",
				'view' => "package",
				'layout' => "package"
				)));
	?>

