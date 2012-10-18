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



$isNew		= ($this->package->id < 1);
$actionText = $isNew ? JText::_( "TRAVEL_NEW" ) : JText::_( "TRAVEL_EDIT" );
?>

<fieldset class="fieldsform">
	<legend><?php echo $actionText;?></legend>

	<table class="admintable">

		<tr>
			<td align="right" class="key">
				<label for="title">
					<?php echo JText::_( "TRAVEL_FIELD_TITLE" ); ?> :
				</label>
			</td>
			<td>
				<?php echo JDom::_('html.form.input.text', array(
												'dataKey' => 'title',
												'dataObject' => $this->package,
												'size' => "80",
												'domClass' => "validate[required]",
												'required' => true
												));
				?>
			</td>
		</tr>
		<?php if ($this->access->get('core.edit.state')): ?>
		<tr>
			<td align="right" class="key">
				<label for="published">
					<?php echo JText::_( "TRAVEL_FIELD_PUBLISHED" ); ?> :
				</label>
			</td>
			<td>
				<?php echo JDom::_('html.form.input.bool', array(
												'dataKey' => 'published',
												'dataObject' => $this->package,
												'aclAccess' => 'core.edit.state'
												));
				?>
			</td>
		</tr>

		<?php endif; ?>
		<tr>
			<td align="right" class="key">
				<label for="content">
					<?php echo JText::_( "TRAVEL_FIELD_CONTENT" ); ?> :
				</label>
			</td>
			<td>
				<?php echo JDom::_('html.form.input.editor', array(
												'dataKey' => 'content',
												'dataObject' => $this->package,
												'cols' => "80",
												'rows' => "10",
												'width' => "800px",
												'height' => "300px"
												));
				?>


			</td>
		</tr>
		<tr>
			<td align="right" class="key">
				<label for="comisssion_rate">
					<?php echo JText::_( "TRAVEL_FIELD_COMISSSION_RATE" ); ?> :
				</label>
			</td>
			<td>
				<?php echo JDom::_('html.form.input.text', array(
												'dataKey' => 'comisssion_rate',
												'dataObject' => $this->package,
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
				<label for="commission_type">
					<?php echo JText::_( "TRAVEL_FIELD_COMMISSION_TYPE" ); ?> :
				</label>
			</td>
			<td>
				<?php echo JDom::_('html.form.input.select', array(
												'dataKey' => 'commission_type',
												'dataObject' => $this->package,
												'list' => $this->lists['select']['commission_type']->list,
												'listKey' => 'value',
												'labelKey' => 'text',
												'nullLabel' => "",
												'domClass' => "validate[required]",
												'required' => true
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
												'dataObject' => $this->package,
												'size' => "15",
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
				<label for="value">
					<?php echo JText::_( "TRAVEL_FIELD_VALUE" ); ?> :
				</label>
			</td>
			<td>
				<?php echo JDom::_('html.form.input.text', array(
												'dataKey' => 'value',
												'dataObject' => $this->package,
												'size' => "15",
												'domClass' => "validate[required,custom[positive_decimal]]",
												'validatorHandler' => "positive_decimal",
												'required' => true,
												'validatorRegex' => "/(^\d*\.?\d*[0-9]+\d*$)|(^[0-9]+\d*\.\d*$)/"
												));
				?>
			</td>
		</tr>


	</table>
</fieldset>
