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


<div class="grid_wrapper">
	<table id='grid' class='adminlist' cellpadding="0" cellspacing="0">
	<thead>
		<tr>
			<th width="5">
				<?php echo JText::_( 'NUM' ); ?>
			</th>

			<?php if ($this->access->get('core.edit.own') || $this->access->get('core.edit')): ?>
            <th width="20">
				<input type="checkbox" name="toggle" value="" onclick="checkAll(<?php echo count( $this->items ); ?>);" />
			</th>
			<?php endif; ?>

			<th>
				<?php echo JText::_("TRAVEL_FIELD_PACKAGE_ID"); ?>
			</th>

			<th>
				<?php echo JText::_("TRAVEL_FIELD_AGENT"); ?>
			</th>

			<th>
				<?php echo JText::_("TRAVEL_FIELD_QUANTITY"); ?>
			</th>

			<th>
				<?php echo JText::_("TRAVEL_FIELD_CREATION_DATE"); ?>
			</th>

			<th>
				<?php echo JText::_("TRAVEL_FIELD_MODIFICATION_DATE"); ?>
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

			<td class='row_id'>
				<?php echo $this->pagination->getRowOffset( $i ); ?>
            </td>

			<?php if ($this->access->get('core.edit.own') || $this->access->get('core.edit')): ?>
			<td>
				<?php echo JDom::_('html.grid.checkedout', array(
											'dataObject' => $row,
											'num' => $i
												));
				?>

			</td>
			<?php endif; ?>

            <td>
				<?php echo JDom::_('html.fly', array(
												'dataKey' => 'package_id',
												'dataObject' => $row
												));
				?>
			</td>

            <td>
				<?php echo JDom::_('html.fly', array(
												'dataKey' => 'agent',
												'dataObject' => $row
												));
				?>
			</td>

            <td>
				<?php echo JDom::_('html.fly', array(
												'dataKey' => 'quantity',
												'dataObject' => $row
												));
				?>
			</td>

            <td>
				<?php echo JDom::_('html.grid.datetime', array(
										'dataKey' => 'creation_date',
										'dataObject' => $row,
										'dateFormat' => "%Y-%m-%d"
											));
				?>
			</td>

            <td>
				<?php echo JDom::_('html.grid.datetime', array(
										'dataKey' => 'modification_date',
										'dataObject' => $row,
										'dateFormat' => "%Y-%m-%d"
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

<?php echo JDom::_('html.pagination', null, $this->pagination);?>


