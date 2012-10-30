<?php
/**                               ______________________________________________
*                          o O   |                                              |
*                 (((((  o      <    Generated with Cook Self Service  V1.5.2   |
*                ( o o )         |______________________________________________|
* --------oOOO-----(_)-----OOOo---------------------------------- www.j-cook.pro --- +
* @version		1.0.0
* @package		Travel
* @subpackage	Payouts
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



$isNew		= ($this->payout->id < 1);
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
												'dataObject' => $this->payout,
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
				<label for="amount">
					<?php echo JText::_( "TRAVEL_FIELD_AMOUNT" ); ?> :
				</label>
			</td>
			<td>
				<?php echo JDom::_('html.form.input.text', array(
												'dataKey' => 'amount',
												'dataObject' => $this->payout,
												'size' => "12",
												'domClass' => "validate[required,custom[positive_decimal]]",
												'validatorHandler' => "positive_decimal",
												'required' => true,
												'validatorRegex' => "/(^\d*\.?\d*[0-9]+\d*$)|(^[0-9]+\d*\.\d*$)/"
												));
				?>
			</td>
		</tr>
		<tr>
			<td align="right" class="key">
				<label for="attachment">
					<?php echo JText::_( "TRAVEL_FIELD_ATTACHMENT" ); ?> :
				</label>
			</td>
			<td>
				<?php echo JDom::_('html.form.input.file.remove', array(
												'dataKey' => 'attachment',
												'dataObject' => $this->payout,
												'actions' => array('remove', 'thumbs', 'trash', 'delete')
												));
				?>

				<?php echo JDom::_('html.form.input.file', array(
												'dataKey' => 'attachment',
												'dataObject' => $this->payout,
												'size' => "",
												'domClass' => "validate[custom[file_4352]]",
												'validatorHandler' => "file"
												));
				?>
			</td>
		</tr>
		<tr>
			<td align="right" class="key">
				<label for="payment_date">
					<?php echo JText::_( "TRAVEL_FIELD_PAYMENT_DATE" ); ?> :
				</label>
			</td>
			<td>
				<?php echo JDom::_('html.form.input.calendar', array(
												'dataKey' => 'payment_date',
												'dataObject' => $this->payout,
												'dateFormat' => "%Y-%m-%d",
												'domClass' => "validate[required,custom[timeYYYYmmdd]]",
												'validatorHandler' => "timeYYYYmmdd",
												'required' => true
												));

				?>
			</td>
		</tr>
		<tr>
			<td align="right" class="key">
				<label for="type">
					<?php echo JText::_( "TRAVEL_FIELD_TYPE" ); ?> :
				</label>
			</td>
			<td>
				<?php echo JDom::_('html.form.input.select', array(
												'dataKey' => 'type',
												'dataObject' => $this->payout,
												'list' => $this->lists['select']['type']->list,
												'listKey' => 'value',
												'labelKey' => 'text',
												'nullLabel' => "",
												'domClass' => "validate[required]",
												'required' => true
												));
				?>
			</td>
		</tr>


	</table>
</fieldset>
