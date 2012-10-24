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
				<?php echo JDom::_('html.form.input.ajax', array(
												'dataKey' => 'user_id',
												'dataObject' => $this->commission,
												'ajaxContext' => 'travel.users.ajax.select2',
												'ajaxVars' => array('values' => array(
													$this->commission->user_id
														))
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
												'dataObject' => $this->commission,
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
												'dataObject' => $this->commission,
												'actions' => array('remove', 'thumbs', 'trash', 'delete')
												));
				?>

				<?php echo JDom::_('html.form.input.file', array(
												'dataKey' => 'attachment',
												'dataObject' => $this->commission,
												'size' => "",
												'domClass' => "validate[custom[file_1203]]",
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
												'dataObject' => $this->commission,
												'dateFormat' => "%Y-%m-%d",
												'domClass' => "validate[required,custom[timeYYYYmmdd]]",
												'validatorHandler' => "timeYYYYmmdd",
												'required' => true
												));

				?>
			</td>
		</tr>


	</table>
</fieldset>
