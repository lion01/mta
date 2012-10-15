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

$function	= JRequest::getCmd('function', 'jSelectItem');


?>

<div class="grid_wrapper">
	<table id='grid' class='adminlist' cellpadding="0" cellspacing="0">
	<thead>
		<tr>
			<th width="5">
				<?php echo JText::_( 'NUM' ); ?>
			</th>

			<th align="left">
				<?php echo JHTML::_('grid.sort',  "TRAVEL_FIELD_TITLE", 'a.title', $this->lists['order_Dir'], $this->lists['order'] ); ?>
			</th>

			<th align="center">
				<?php echo JText::_("ID"); ?>
			</th>

		</tr>
	</thead>

	<tbody>
	<?php
	$k = 0;

	for ($i=0, $n=count( $this->items ); $i < $n; $i++):

		$row = &$this->items[$i];


		?>

		<tr class="<?php echo "row$k"; ?>"
			style="cursor:pointer"
			onclick="if (window.parent) window.parent.<?php echo $this->escape($function);?>('<?php echo $row->id; ?>', '<?php echo $this->escape(addslashes($row->title)); ?>', 'cid');">

			<td class='row_id'>
				<?php echo $this->pagination->getRowOffset( $i ); ?>
            </td>

			<td align="left">
				<?php echo $row->title; ?>
			</td>

            <td align="center">
				<?php echo $row->id; ?>
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


