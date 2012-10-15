<?php
/**
* @version		1.0.0
 * @package		Joomla
* @subpackage	OS Membership
 * @author  Tuan Pham Ngoc
 * @copyright	Copyright (C) 2012 Ossolution Team
 * @license		GNU/GPL, see LICENSE.php
 */
// no direct access
defined( '_JEXEC' ) or die ;
$ordering = ($this->lists['order'] == 'a.ordering');

JHTML::_('behavior.tooltip');
JHTML::_('behavior.modal');
?>
<form action="index.php?option=com_osmembership&view=categories" method="post" name="adminForm" id="adminForm">
<table width="100%">
<tr>
	<td align="left">
		<?php echo JText::_( 'Filter' ); ?>:
		<input type="text" name="search" id="search" value="<?php echo $this->state->search;?>" class="text_area search-query" onchange="document.adminForm.submit();" />		
		<button onclick="this.form.submit();" class="btn"><?php echo JText::_( 'Go' ); ?></button>
		<button onclick="document.getElementById('search').value='';this.form.submit();" class="btn"><?php echo JText::_( 'Reset' ); ?></button>		
	</td>
	<td align="right">
		<?php echo $this->lists['filter_state']; ?>
	</td>	
</tr>
</table>
<div id="editcell">
	<table class="adminlist table table-striped">
	<thead>
		<tr>
			<th width="2%">
				<?php echo JText::_( 'NUM' ); ?>
			</th>
			<th width="2%">
				<input type="checkbox" name="toggle" value="" onclick="checkAll(<?php echo count( $this->items ); ?>);" />
			</th>
			<th class="title" style="text-align: left;" width="40%">
				<?php echo JHTML::_('grid.sort',  JText::_('OSM_TITLE'), 'a.title', $this->lists['order_Dir'], $this->lists['order'] ); ?>				
			</th>											
			<th width="5%">
				<?php echo JHTML::_('grid.sort',  JText::_('OSM_PUBLISHED'), 'a.published', $this->lists['order_Dir'], $this->lists['order'] ); ?>
			</th>
			<th width="2%">
				<?php echo JHTML::_('grid.sort',  JText::_('OSM_ID'), 'a.id', $this->lists['order_Dir'], $this->lists['order'] ); ?>
			</th>													
		</tr>
	</thead>
	<tfoot>
		<tr>
			<td colspan="5">
				<?php echo $this->pagination->getListFooter(); ?>
			</td>
		</tr>
	</tfoot>
	<tbody>
	<?php
	$k = 0;
	for ($i=0, $n=count( $this->items ); $i < $n; $i++)
	{
		$row = &$this->items[$i];
		$link 	= JRoute::_( 'index.php?option=com_osmembership&task=category.edit&cid[]='. $row->id);
		$checked 	= JHTML::_('grid.id',   $i, $row->id );				
		$published 	= JHTML::_('grid.published', $row, $i, 'tick.png', 'publish_x.png', 'category.' );			
		?>
		<tr class="<?php echo "row$k"; ?>">
			<td align="center">
				<?php echo $this->pagination->getRowOffset( $i ); ?>
			</td>
			<td align="center">
				<?php echo $checked; ?>
			</td>	
			<td>																			
				<a href="<?php echo $link; ?>"><?php echo $row->title ; ?></a>				
			</td>			
			<td align="center">
				<?php echo $published; ?>
			</td>
			<td align="center">
				<?php echo $row->id; ?>
			</td>
		</tr>		
		<?php
		$k = 1 - $k;
	}
	?>
	</tbody>
	</table>
	</div>
	<input type="hidden" name="option" value="com_osmembership" />
	<input type="hidden" name="task" value="" />
	<input type="hidden" name="boxchecked" value="0" />
	<input type="hidden" name="filter_order" value="<?php echo $this->lists['order']; ?>" />
	<input type="hidden" name="filter_order_Dir" value="<?php echo $this->lists['order_Dir']; ?>" />	
	<?php echo JHTML::_( 'form.token' ); ?>			
</form>