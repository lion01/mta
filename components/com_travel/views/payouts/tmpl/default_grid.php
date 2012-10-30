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


?>





<div class="grid_wrapper">
	<table id='grid' class='adminlist' cellpadding="0" cellspacing="0">
	<thead>
		<tr>
			<?php if ($this->access->get('core.edit.own') || $this->access->get('core.edit')): ?>
            <th width="20">
				<input type="checkbox" name="toggle" value="" onclick="checkAll(<?php echo count( $this->items ); ?>);" />
			</th>
			<?php endif; ?>

			<th style="text-align:right">
				<?php echo JText::_("TRAVEL_FIELD_AMOUNT"); ?>
			</th>

			<th style="text-align:center">
				<?php echo JText::_("TRAVEL_FIELD_ATTACHMENT"); ?>
			</th>

			<th style="text-align:right">
				<?php echo JHTML::_('grid.sort',  "TRAVEL_FIELD_PAYMENT_DATE", 'a.payment_date', $this->state->get('list.direction'), $this->state->get('list.ordering') ); ?>
			</th>



		</tr>
	</thead>

	<tbody>
	<?php
	$k = 0;

	for ($i=0, $n=count( $this->items ); $i < $n; $i++):

		$row = &$this->items[$i];



		?>

		<tr class="<?php echo "row$k"; ?>">

			<?php if ($this->access->get('core.edit.own') || $this->access->get('core.edit')): ?>
			<td>
				<?php echo JDom::_('html.grid.checkedout', array(
										'dataObject' => $row,
										'num' => $i
											));
				?>
			</td>
			<?php endif; ?>

            <td style="text-align:right">
				<?php echo JDom::_('html.fly', array(
												'dataKey' => 'amount',
												'dataObject' => $row
												));
				?>
			</td>

            <td style="text-align:center">
				<?php echo JDom::_('html.fly.file.default', array(
												'dataKey' => 'attachment',
												'dataObject' => $row,
												'target' => 'download',
												'width' => 'auto',
												'height' => 'auto',
												'cid' => $row->id,
												'view' => 'payout',
												'indirect' => true,
												'root' => '[DIR_PAYOUTS_ATTACHMENT]'
												));
				?>
			</td>

            <td style="text-align:right">
				<?php echo JDom::_('html.grid.datetime', array(
										'dataKey' => 'payment_date',
										'dataObject' => $row,
										'dateFormat' => "%d-%m-%Y"
											));
				?>
			</td>



		</tr>
		<?php
		$k = 1 - $k;

	endfor;
	?>
	</tbody>
	</table>




</div>

<?php echo JDom::_('html.pagination', array(
										'pagination' => $this->pagination,
										'showLimit' => true,
										'showCounter' => true,

											));
?>


