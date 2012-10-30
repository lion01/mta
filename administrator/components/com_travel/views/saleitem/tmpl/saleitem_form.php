<?php
/**                               ______________________________________________
*                          o O   |                                              |
*                 (((((  o      <    Generated with Cook Self Service  V1.5.2   |
*                ( o o )         |______________________________________________|
* --------oOOO-----(_)-----OOOo---------------------------------- www.j-cook.pro --- +
* @version		1.0.0
* @package		Travel
* @subpackage	Saleitems
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



$isNew		= ($this->saleitem->id < 1);
$actionText = $isNew ? JText::_( "TRAVEL_NEW" ) : JText::_( "TRAVEL_EDIT" );
?>

<fieldset class="fieldsform">
	<legend><?php echo $actionText;?></legend>

	<table class="admintable">

		<tr>
			<td align="right" class="key">
				<label for="package_id">
					<?php echo JText::_( "TRAVEL_FIELD_PACKAGES_ID" ); ?> :
				</label>
			</td>
			<td>
				<?php echo JDom::_('html.form.input.text', array(
												'dataKey' => 'package_id',
												'dataObject' => $this->saleitem,
												'size' => "",
												'domClass' => "validate[required]",
												'required' => true
												));
				?>
			</td>
		</tr>
		<tr>
			<td align="right" class="key">
				<label for="quantity">
					<?php echo JText::_( "TRAVEL_FIELD_QUANTITY" ); ?> :
				</label>
			</td>
			<td>
				<?php echo JDom::_('html.form.input.text', array(
												'dataKey' => 'quantity',
												'dataObject' => $this->saleitem,
												'size' => "10",
												'domClass' => "validate[required,custom[positive_integer]]",
												'validatorHandler' => "positive_integer",
												'required' => true,
												'validatorRegex' => "/^\d+$/"
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
				<?php echo JDom::_('html.form.input.text', array(
												'dataKey' => 'unit',
												'dataObject' => $this->saleitem,
												'size' => "10",
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
				<label for="price">
					<?php echo JText::_( "TRAVEL_FIELD_PRICE" ); ?> :
				</label>
			</td>
			<td>
				<?php echo JDom::_('html.form.input.text', array(
												'dataKey' => 'price',
												'dataObject' => $this->saleitem,
												'size' => "10",
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
				<label for="commission_rate">
					<?php echo JText::_( "TRAVEL_FIELD_COMMISSION_RATE" ); ?> :
				</label>
			</td>
			<td>
				<?php echo JDom::_('html.form.input.text', array(
												'dataKey' => 'commission_rate',
												'dataObject' => $this->saleitem,
												'size' => "10",
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
				<label for="renewal">
					<?php echo JText::_( "TRAVEL_FIELD_RENEWAL" ); ?> :
				</label>
			</td>
			<td>
				<?php echo JDom::_('html.form.input.bool', array(
												'dataKey' => 'renewal',
												'dataObject' => $this->saleitem,
												'domClass' => "validate[required]",
												'required' => true
												));
				?>
			</td>
		</tr>


	</table>
</fieldset>
