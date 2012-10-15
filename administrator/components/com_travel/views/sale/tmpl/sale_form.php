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
				<label for="package_id">
					<?php echo JText::_( "TRAVEL_FIELD_PACKAGE_ID" ); ?> :
				</label>
			</td>
			<td>
				<?php echo JDom::_('html.form.input.text', array(
												'dataKey' => 'package_id',
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
				<label for="agent">
					<?php echo JText::_( "TRAVEL_FIELD_AGENT" ); ?> :
				</label>
			</td>
			<td>
				<?php echo JDom::_('html.form.input.text', array(
												'dataKey' => 'agent',
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
				<label for="quantity">
					<?php echo JText::_( "TRAVEL_FIELD_QUANTITY" ); ?> :
				</label>
			</td>
			<td>
				<?php echo JDom::_('html.form.input.text', array(
												'dataKey' => 'quantity',
												'dataObject' => $this->sale,
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
				<label for="creation_date">
					<?php echo JText::_( "TRAVEL_FIELD_CREATION_DATE" ); ?> :
				</label>
			</td>
			<td>
				<?php echo JDom::_('html.form.input.calendar', array(
												'dataKey' => 'creation_date',
												'dataObject' => $this->sale,
												'dateFormat' => "%Y-%m-%d",
												'domClass' => "validate[custom[timeYYYYmmdd]]",
												'validatorHandler' => "timeYYYYmmdd"
												));

				?>
			</td>
		</tr>
		<tr>
			<td align="right" class="key">
				<label for="modification_date">
					<?php echo JText::_( "TRAVEL_FIELD_MODIFICATION_DATE" ); ?> :
				</label>
			</td>
			<td>
				<?php echo JDom::_('html.form.input.calendar', array(
												'dataKey' => 'modification_date',
												'dataObject' => $this->sale,
												'dateFormat' => "%Y-%m-%d",
												'domClass' => "validate[custom[timeYYYYmmdd]]",
												'validatorHandler' => "timeYYYYmmdd"
												));

				?>
			</td>
		</tr>


	</table>
</fieldset>
