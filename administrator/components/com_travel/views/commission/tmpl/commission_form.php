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

defined('_JEXEC') or die('Restricted access');



$isNew		= ($this->commission->id < 1);
$actionText = $isNew ? JText::_( "TRAVEL_NEW" ) : JText::_( "TRAVEL_EDIT" );
?>

<fieldset class="fieldsform">
	<legend><?php echo $actionText;?></legend>

	<table class="admintable">

		<tr>
			<td align="right" class="key">
				<label for="user_id">
					<?php echo JText::_( "TRAVEL_FIELD_USER_NAME" ); ?> :
				</label>
			</td>
			<td>
				<?php echo JDom::_('html.form.input.select', array(
												'dataKey' => 'user_id',
												'dataObject' => $this->commission,
												'list' => $this->lists['fk']['user_id'],
												'listKey' => 'id',
												'labelKey' => 'name',
												'nullLabel' => "TRAVEL_JSEARCH_SELECT_USER"
												));
				?>
			</td>
		</tr>
		<tr>
			<td align="right" class="key">
				<label for="sale_id">
					<?php echo JText::_( "TRAVEL_FIELD_SALES_ID" ); ?> :
				</label>
			</td>
			<td>
				<?php echo JDom::_('html.form.input.text', array(
												'dataKey' => 'sale_id',
												'dataObject' => $this->commission,
												'size' => ""
												));
				?>
			</td>
		</tr>
		<tr>
			<td align="right" class="key">
				<label for="total_commission">
					<?php echo JText::_( "TRAVEL_FIELD_TOTAL_COMMISSION" ); ?> :
				</label>
			</td>
			<td>
				<?php echo JDom::_('html.form.input.text', array(
												'dataKey' => 'total_commission',
												'dataObject' => $this->commission,
												'size' => "10"
												));
				?>
			</td>
		</tr>
		<tr>
			<td align="right" class="key">
				<label for="total_unit">
					<?php echo JText::_( "TRAVEL_FIELD_TOTAL_UNIT" ); ?> :
				</label>
			</td>
			<td>
				<?php echo JDom::_('html.form.input.text', array(
												'dataKey' => 'total_unit',
												'dataObject' => $this->commission,
												'size' => "10"
												));
				?>
			</td>
		</tr>
		<tr>
			<td align="right" class="key">
				<label for="paid">
					<?php echo JText::_( "TRAVEL_FIELD_PAID" ); ?> :
				</label>
			</td>
			<td>
				<?php echo JDom::_('html.form.input.bool', array(
												'dataKey' => 'paid',
												'dataObject' => $this->commission
												));
				?>
			</td>
		</tr>


	</table>
</fieldset>
