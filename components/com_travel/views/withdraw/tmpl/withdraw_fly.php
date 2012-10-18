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


?>

<fieldset class="fieldsfly">
	<table class="admintable">

		<tr>
			<td align="right" class="key">
				<label for="amount">
					<?php echo JText::_( "TRAVEL_FIELD_AMOUNT" ); ?> :
				</label>
			</td>
			<td>
				<?php echo JDom::_('html.fly', array(
												'dataKey' => 'amount',
												'dataObject' => $this->withdraw
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
				<?php echo JDom::_('html.fly', array(
												'dataKey' => 'total_paid',
												'dataObject' => $this->withdraw
												));
				?>
			</td>
		</tr>
		<tr>
			<td align="right" class="key">
				<label for="creation_date">
					<?php echo JText::_( "TRAVEL_FIELD_SUBMITTED_DATE" ); ?> :
				</label>
			</td>
			<td>
				<?php echo JDom::_('html.fly.datetime', array(
												'dataKey' => 'creation_date',
												'dataObject' => $this->withdraw,
												'dateFormat' => "%Y-%m-%d"
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
				<?php echo JDom::_('html.fly.datetime', array(
												'dataKey' => 'payment_date',
												'dataObject' => $this->withdraw,
												'dateFormat' => "%Y-%m-%d"
												));

				?>
			</td>
		</tr>


	</table>
</fieldset>