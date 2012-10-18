<?php
/**                               ______________________________________________
*                          o O   |                                              |
*                 (((((  o      <    Generated with Cook Self Service  V1.5.2   |
*                ( o o )         |______________________________________________|
* --------oOOO-----(_)-----OOOo---------------------------------- www.j-cook.pro --- +
* @version		1.0.0
* @package		Travel
* @subpackage	Sales
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



$isNew		= ($this->sale->id < 1);
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
												'dataObject' => $this->sale,
												'size' => "",
												'domClass' => "validate[required]",
												'required' => true
												));
				?>
			</td>
		</tr>
		<tr>
			<td align="right" class="key">
				<label for="payment">
					<?php echo JText::_( "TRAVEL_FIELD_PAYMENT" ); ?> :
				</label>
			</td>
			<td>
				<?php echo JDom::_('html.form.input.text', array(
												'dataKey' => 'payment',
												'dataObject' => $this->sale,
												'size' => "15",
												'domClass' => "validate[custom[positive_decimal]]",
												'validatorHandler' => "positive_decimal",
												'validatorRegex' => "/(^\d*\.?\d*[0-9]+\d*$)|(^[0-9]+\d*\.\d*$)/"
												));
				?>
			</td>
		</tr>
		<tr>
			<td align="right" class="key">
				<label for="completed">
					<?php echo JText::_( "TRAVEL_FIELD_COMPLETED" ); ?> :
				</label>
			</td>
			<td>
				<?php echo JDom::_('html.form.input.bool', array(
												'dataKey' => 'completed',
												'dataObject' => $this->sale,
												'domClass' => "validate[required]",
												'required' => true
												));
				?>
			</td>
		</tr>
		<tr>
			<td align="right" class="key">
				<label for="total_amount">
					<?php echo JText::_( "TRAVEL_FIELD_TOTAL_AMOUNT" ); ?> :
				</label>
			</td>
			<td>
				<?php echo JDom::_('html.form.input.text', array(
												'dataKey' => 'total_amount',
												'dataObject' => $this->sale,
												'size' => "15"
												));
				?>
			</td>
		</tr>
		<tr>
			<td align="right" class="key">
				<label for="total_commission">
					<?php echo JText::_( "TRAVEL_FIELD_TOTAL_COMISSION" ); ?> :
				</label>
			</td>
			<td>
				<?php echo JDom::_('html.form.input.text', array(
												'dataKey' => 'total_commission',
												'dataObject' => $this->sale,
												'size' => "15",
												'domClass' => "validate[required]",
												'required' => true
												));
				?>
			</td>
		</tr>


	</table>
</fieldset>
