<?php
/**                               ______________________________________________
*                          o O   |                                              |
*                 (((((  o      <    Generated with Cook Self Service  V1.5.2   |
*                ( o o )         |______________________________________________|
* --------oOOO-----(_)-----OOOo---------------------------------- www.j-cook.pro --- +
* @version		1.0.0
* @package		Travel
* @subpackage	Withdraws
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



$isNew		= ($this->withdraw->id < 1);
$actionText = $isNew ? JText::_( "TRAVEL_NEW" ) : JText::_( "TRAVEL_EDIT" );
?>

<fieldset class="fieldsform">
	<legend><?php echo $actionText;?></legend>

	<table class="admintable">

		<tr>
			<td align="right" class="key">
				<label for="user_id">
					<?php echo JText::_( "TRAVEL_FIELD_USER" ); ?> :
				</label>
			</td>
			<td>
				<?php echo JDom::_('html.form.input.text', array(
												'dataKey' => 'user_id',
												'dataObject' => $this->withdraw,
												'size' => "",
												'domClass' => "validate[required]",
												'required' => true
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
												'dataObject' => $this->withdraw,
												'size' => "15",
												'domClass' => "validate[required,custom[decimal]]",
												'validatorHandler' => "decimal",
												'required' => true,
												'validatorRegex' => "/^-?\d*\.?\d*$/"
												));
				?>
			</td>
		</tr>
		<tr>
			<td align="right" class="key">
				<label for="total_paid">
					<?php echo JText::_( "TRAVEL_FIELD_TOTAL_PAID" ); ?> :
				</label>
			</td>
			<td>
				<?php echo JDom::_('html.form.input.text', array(
												'dataKey' => 'total_paid',
												'dataObject' => $this->withdraw,
												'size' => "15",
												'domClass' => "validate[required,custom[decimal_10_2]]",
												'validatorHandler' => "decimal_10_2",
												'required' => true,
												'validatorRegex' => "/^\d{0,8}(\.\d{0,2})?$/"
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
												'dataObject' => $this->withdraw,
												'dateFormat' => "%Y-%m-%d",
												'domClass' => "validate[custom[timeYYYYmmdd]]",
												'validatorHandler' => "timeYYYYmmdd"
												));

				?>
			</td>
		</tr>


	</table>
</fieldset>
