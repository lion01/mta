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

defined('_JEXEC') or die('Restricted access');


?>

<fieldset class="fieldsfly">
	<table class="admintable">

		<tr>
			<td align="right" class="key">
				<label for="title">
					<?php echo JText::_( "TRAVEL_FIELD_TITLE" ); ?> :
				</label>
			</td>
			<td>
				<?php echo JDom::_('html.fly', array(
												'dataKey' => 'title',
												'dataObject' => $this->package
												));
				?>
			</td>
		</tr>
		<tr>
			<td align="right" class="key">
				<label for="price">
					<?php echo JText::_( "TRAVEL_FIELD_PRICE" ); ?> :
				</label>
			</td>
			<td>
				<?php echo JDom::_('html.fly', array(
												'dataKey' => 'price',
												'dataObject' => $this->package
												));
				?>
			</td>
		</tr>
		<tr>
			<td align="right" class="key">
				<label for="unit">
					<?php echo JText::_( "TRAVEL_FIELD_UNIT" ); ?> :
				</label>
			</td>
			<td>
				<?php echo JDom::_('html.fly', array(
												'dataKey' => 'unit',
												'dataObject' => $this->package
												));
				?>
			</td>
		</tr>
		<tr>
			<td align="right" class="key">
				<label for="commisssion_rate">
					<?php echo JText::_( "TRAVEL_FIELD_COMMISSION" ); ?> :
				</label>
			</td>
			<td>
				<?php echo JDom::_('html.fly', array(
												'dataKey' => 'commisssion_rate',
												'dataObject' => $this->package
												));
				?>
			</td>
		</tr>
		<tr>
			<td align="right" class="key">
				<label for="renewable">
					<?php echo JText::_( "TRAVEL_FIELD_RENEWABLE" ); ?> :
				</label>
			</td>
			<td>
				<?php echo JDom::_('html.fly.bool', array(
												'dataKey' => 'renewable',
												'dataObject' => $this->package
												));
				?>
			</td>
		</tr>
		<tr>
			<td align="right" class="key">
				<label for="content">
					<?php echo JText::_( "TRAVEL_FIELD_CONTENT" ); ?> :
				</label>
			</td>
			<td>
				<?php echo JDom::_('html.fly', array(
												'dataKey' => 'content',
												'dataObject' => $this->package
												));
				?>
			</td>
		</tr>


	</table>
</fieldset>