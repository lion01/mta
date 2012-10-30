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


?>

<fieldset class="fieldsfly">
	<table class="admintable">

		<tr>
			<td align="right" class="key">
				<label for="payment">
					<?php echo JText::_( "TRAVEL_FIELD_RECEIVED_PAYMENT" ); ?> :
				</label>
			</td>
			<td>
				<?php echo JDom::_('html.fly', array(
												'dataKey' => 'payment',
												'dataObject' => $this->sale
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
				<?php echo JDom::_('html.fly', array(
												'dataKey' => 'total_commission',
												'dataObject' => $this->sale
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
				<?php echo JDom::_('html.fly', array(
												'dataKey' => 'total_amount',
												'dataObject' => $this->sale
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
				<?php echo JDom::_('html.fly', array(
												'dataKey' => 'total_unit',
												'dataObject' => $this->sale
												));
				?>
			</td>
		</tr>
		<tr>
			<td align="right" class="key">
				<label for="status">
					<?php echo JText::_( "TRAVEL_FIELD_STATUS" ); ?> :
				</label>
			</td>
			<td>
				<?php echo JDom::_('html.fly.enum', array(
												'dataKey' => 'status',
												'dataObject' => $this->sale,
												'list' => $this->lists['enum']['sales.status'],
												'listKey' => 'value',
												'labelKey' => 'text'
												));
				?>
			</td>
		</tr>
		<tr>
			<td align="right" class="key">
				<label for="shipping">
					<?php echo JText::_( "TRAVEL_FIELD_SHIPPING" ); ?> :
				</label>
			</td>
			<td>
				<?php echo JDom::_('html.fly.enum', array(
												'dataKey' => 'shipping',
												'dataObject' => $this->sale,
												'list' => $this->lists['enum']['sales.shipping'],
												'listKey' => 'value',
												'labelKey' => 'text'
												));
				?>
			</td>
		</tr>
		<tr>
			<td align="right" class="key">
				<label for="order_date">
					<?php echo JText::_( "TRAVEL_FIELD_ORDER_DATE" ); ?> :
				</label>
			</td>
			<td>
				<?php echo JDom::_('html.fly.datetime', array(
												'dataKey' => 'order_date',
												'dataObject' => $this->sale,
												'dateFormat' => "%Y-%m-%d %H:%M"
												));

				?>
			</td>
		</tr>


	</table>
</fieldset>