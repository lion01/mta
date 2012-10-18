<?php


/**                               ______________________________________________
*                          o O   |                                              |
*                 (((((  o      <    Generated with Cook Self Service  V1.5.2   |
*                ( o o )         |______________________________________________|
* --------oOOO-----(_)-----OOOo---------------------------------- www.j-cook.pro --- +
* @version		1.0.0
* @package		Travel
* @subpackage	Carts
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
	<table id='grid' class='adminlist' cellpadding="0" cellspacing="0" width="100%">
	<thead>
		<tr>
            <th width="20">
			</th>
			<th style="text-align:left">
				<?php echo JText::_("TRAVEL_FIELD_PACKAGE_TITLE"); ?>
			</th>

			<th style="text-align:center">
				<?php echo JText::_("TRAVEL_FIELD_QUANTITY"); ?>
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

			<td>
				<?php echo JDom::_('html.grid.checkedout', array(
										'dataObject' => $row,
										'num' => $i
											));
				?>
			</td>

            <td style="text-align:left">
				<?php echo JDom::_('html.fly', array(
												'dataKey' => '_package_id_title',
												'dataObject' => $row,
												'route' => array('view' => 'package','layout' => 'package','cid[]' => $row->package_id)
												));
				?>
			</td>

            <td style="text-align:center">
				<?php echo JDom::_('html.fly', array(
												'dataKey' => 'quantity',
												'dataObject' => $row
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
