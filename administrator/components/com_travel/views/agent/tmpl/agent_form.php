<?php
/**                               ______________________________________________
*                          o O   |                                              |
*                 (((((  o      <    Generated with Cook Self Service  V1.5.2   |
*                ( o o )         |______________________________________________|
* --------oOOO-----(_)-----OOOo---------------------------------- www.j-cook.pro --- +
* @version		1.0.0
* @package		Travel
* @subpackage	Agents
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



$isNew		= ($this->agent->id < 1);
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
												'dataObject' => $this->agent,
												'list' => $this->lists['fk']['user_id'],
												'listKey' => 'id',
												'labelKey' => 'name',
												'nullLabel' => "TRAVEL_JSEARCH_SELECT_USER",
												'domClass' => "validate[required]",
												'required' => true
												));
				?>
			</td>
		</tr>
		<tr>
			<td align="right" class="key">
				<label for="parent">
					<?php echo JText::_( "TRAVEL_FIELD_PARENT_NAME" ); ?> :
				</label>
			</td>
			<td>
				<?php echo JDom::_('html.form.input.select', array(
												'dataKey' => 'parent',
												'dataObject' => $this->agent,
												'list' => $this->lists['fk']['parent'],
												'listKey' => 'id',
												'labelKey' => 'name',
												'nullLabel' => "TRAVEL_JSEARCH_SELECT_PARENT"
												));
				?>
			</td>
		</tr>
		<tr>
			<td align="right" class="key">
				<label for="ic_number">
					<?php echo JText::_( "TRAVEL_FIELD_IC_NUMBER" ); ?> :
				</label>
			</td>
			<td>
				<?php echo JDom::_('html.form.input.text', array(
												'dataKey' => 'ic_number',
												'dataObject' => $this->agent,
												'size' => "32",
												'domClass' => "validate[required]",
												'required' => true
												));
				?>
			</td>
		</tr>
		<tr>
			<td align="right" class="key">
				<label for="bank">
					<?php echo JText::_( "TRAVEL_FIELD_BANK" ); ?> :
				</label>
			</td>
			<td>
				<?php echo JDom::_('html.form.input.text', array(
												'dataKey' => 'bank',
												'dataObject' => $this->agent,
												'size' => "32",
												'domClass' => "validate[required]",
												'required' => true
												));
				?>
			</td>
		</tr>
		<tr>
			<td align="right" class="key">
				<label for="bank_account_number">
					<?php echo JText::_( "TRAVEL_FIELD_BANK_ACCOUNT_NUMBER" ); ?> :
				</label>
			</td>
			<td>
				<?php echo JDom::_('html.form.input.text', array(
												'dataKey' => 'bank_account_number',
												'dataObject' => $this->agent,
												'size' => "32",
												'domClass' => "validate[required]",
												'required' => true
												));
				?>
			</td>
		</tr>
		<tr>
			<td align="right" class="key">
				<label for="organization">
					<?php echo JText::_( "TRAVEL_FIELD_ORGANIZATION" ); ?> :
				</label>
			</td>
			<td>
				<?php echo JDom::_('html.form.input.text', array(
												'dataKey' => 'organization',
												'dataObject' => $this->agent,
												'size' => "32"
												));
				?>
			</td>
		</tr>
		<tr>
			<td align="right" class="key">
				<label for="street_address">
					<?php echo JText::_( "TRAVEL_FIELD_STREET_ADDRESS" ); ?> :
				</label>
			</td>
			<td>
				<?php echo JDom::_('html.form.input.text', array(
												'dataKey' => 'street_address',
												'dataObject' => $this->agent,
												'size' => "32",
												'domClass' => "validate[required]",
												'required' => true
												));
				?>
			</td>
		</tr>
		<tr>
			<td align="right" class="key">
				<label for="address">
					<?php echo JText::_( "TRAVEL_FIELD_ADDRESS" ); ?> :
				</label>
			</td>
			<td>
				<?php echo JDom::_('html.form.input.text', array(
												'dataKey' => 'address',
												'dataObject' => $this->agent,
												'size' => "32"
												));
				?>
			</td>
		</tr>
		<tr>
			<td align="right" class="key">
				<label for="postcode">
					<?php echo JText::_( "TRAVEL_FIELD_POSTCODE" ); ?> :
				</label>
			</td>
			<td>
				<?php echo JDom::_('html.form.input.text', array(
												'dataKey' => 'postcode',
												'dataObject' => $this->agent,
												'size' => "32",
												'domClass' => "validate[required,custom[numeric]]",
												'validatorHandler' => "numeric",
												'required' => true
												));
				?>
			</td>
		</tr>
		<tr>
			<td align="right" class="key">
				<label for="city">
					<?php echo JText::_( "TRAVEL_FIELD_CITY" ); ?> :
				</label>
			</td>
			<td>
				<?php echo JDom::_('html.form.input.text', array(
												'dataKey' => 'city',
												'dataObject' => $this->agent,
												'size' => "32",
												'domClass' => "validate[required]",
												'required' => true
												));
				?>
			</td>
		</tr>
		<tr>
			<td align="right" class="key">
				<label for="state">
					<?php echo JText::_( "TRAVEL_FIELD_STATE" ); ?> :
				</label>
			</td>
			<td>
				<?php echo JDom::_('html.form.input.text', array(
												'dataKey' => 'state',
												'dataObject' => $this->agent,
												'size' => "32",
												'domClass' => "validate[required]",
												'required' => true
												));
				?>
			</td>
		</tr>
		<tr>
			<td align="right" class="key">
				<label for="country">
					<?php echo JText::_( "TRAVEL_FIELD_COUNTRY" ); ?> :
				</label>
			</td>
			<td>
				<?php echo JDom::_('html.form.input.text', array(
												'dataKey' => 'country',
												'dataObject' => $this->agent,
												'size' => "32",
												'domClass' => "validate[required]",
												'required' => true
												));
				?>
			</td>
		</tr>
		<tr>
			<td align="right" class="key">
				<label for="contact_phone">
					<?php echo JText::_( "TRAVEL_FIELD_CONTACT_PHONE" ); ?> :
				</label>
			</td>
			<td>
				<?php echo JDom::_('html.form.input.text', array(
												'dataKey' => 'contact_phone',
												'dataObject' => $this->agent,
												'size' => "32",
												'domClass' => "validate[required,custom[phone]]",
												'validatorHandler' => "phone",
												'required' => true,
												'validatorRegex' => "/^(\+[1-9][0-9]*(\([0-9]*\)|-[0-9]*-))?[0]?[1-9][0-9\- ]*$/"
												));
				?>
			</td>
		</tr>
		<tr>
			<td align="right" class="key">
				<label for="expired_date">
					<?php echo JText::_( "TRAVEL_FIELD_EXPIRED_DATE" ); ?> :
				</label>
			</td>
			<td>
				<?php echo JDom::_('html.form.input.calendar', array(
												'dataKey' => 'expired_date',
												'dataObject' => $this->agent,
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
