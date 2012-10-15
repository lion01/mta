<?php
/**
 * @version		1.5.0
 * @package		Joomla
 * @subpackage	OS Membership
 * @author  Tuan Pham Ngoc
 * @copyright	Copyright (C) 2012 Ossolution Team
 * @license		GNU/GPL, see LICENSE.php
 */
defined('_JEXEC') or die ;
$ordering = ($this->lists['order'] == 'a.ordering');

?>
<form action="index.php?option=com_osmembership&view=plugins&type=0" method="post" name="adminForm" enctype="multipart/form-data" id="adminForm">
<table width="100%">
<tr>
	<td align="left">
		<?php echo JText::_( 'Filter' ); ?>:
		<input type="text" name="search" id="search" value="<?php echo $this->state->search ;?>" class="text_area search-query" onchange="document.adminForm.submit();" />		
		<button onclick="this.form.submit();" class="btn"><?php echo JText::_( 'Go' ); ?></button>
		<button onclick="document.getElementById('search').value='';this.form.submit();" class="btn"><?php echo JText::_( 'Reset' ); ?></button>		
	</td>	
	<td style="text-align: right;">		
		<?php echo $this->lists['filter_state']; ?>
	</td>
</tr>
</table>
<div id="editcell">
	<table class="adminlist table table-striped">
	<thead>
		<tr>
			<th width="5">
				<?php echo JText::_( 'NUM' ); ?>
			</th>
			<th width="20">
				<input type="checkbox" name="toggle" value="" onclick="checkAll(<?php echo count( $this->items ); ?>);" />
			</th>
			<th class="title" style="text-align: left;">
				<?php echo JHTML::_('grid.sort',  JText::_('OSM_NAME'), 'a.name', $this->lists['order_Dir'], $this->lists['order'] ); ?>
			</th>
			<th class="title" width="20%" style="text-align: left;">
				<?php echo JHTML::_('grid.sort', JText::_('OSM_TITLE'), 'a.title', $this->lists['order_Dir'], $this->lists['order'] ); ?>
			</th>			
			<th class="title" style="text-align: left;">
				<?php echo JHTML::_('grid.sort', JText::_('OSM_AUTHOR') , 'a.author', $this->lists['order_Dir'], $this->lists['order'] ); ?>
			</th>			
			<th class="title">
				<?php echo JHTML::_('grid.sort', JText::_('OSM_AUTHOR_EMAIL'), 'a.email', $this->lists['order_Dir'], $this->lists['order'] ); ?>
			</th>	
			<th>
				<?php echo JHTML::_('grid.sort', JText::_('OSM_RECURRING_SUPPORT') , 'a.support_recurring_subscription', $this->lists['order_Dir'], $this->lists['order'] ); ?>
			</th>		
			<th>
				<?php echo JHTML::_('grid.sort', JText::_('OSM_PUBLISHED') , 'a.published', $this->lists['order_Dir'], $this->lists['order'] ); ?>
			</th>
			<th width="8%" nowrap="nowrap">
				<?php echo JHTML::_('grid.sort',  'OSM_ORDER', 'a.ordering', $this->lists['order_Dir'], $this->lists['order'] ); ?>
				<?php echo JHTML::_('grid.order',  $this->items , 'filesave.png', 'save_plugin_order' ); ?>
			</th>												
			<th>
				<?php echo JHTML::_('grid.sort', JText::_('OSM_ID') , 'a.id', $this->lists['order_Dir'], $this->lists['order'] ); ?>
			</th>
		</tr>		
	</thead>
	<tfoot>
		<tr>
			<td colspan="10">
				<?php echo $this->pagination->getListFooter(); ?>
			</td>
		</tr>
	</tfoot>
	<tbody>
	<?php
	$k = 0;
	if (version_compare(JVERSION, '1.6.0', 'ge')) {
		$j15 = false ;
	} else {
		$j15 = true ;
	}
	for ($i=0, $n=count( $this->items ); $i < $n; $i++)
	{
		$row = &$this->items[$i];
		$link 	= JRoute::_( 'index.php?option=com_osmembership&task=plugin.edit&cid[]='. $row->id );
		$checked 	= JHTML::_('grid.id',   $i, $row->id );				
		$published 	= JHTML::_('grid.published', $row, $i, 'tick.png', 'publish_x.png', 'plugin.' );		

		if ($j15) {			
			$img 	= $row->support_recurring_subscription ? 'tick.png' : 'publish_x.png';
			$img    = '<img src="images/'.$img.'" />' ;
		} else {						
			$img 	= $row->support_recurring_subscription ? 'tick.png' : 'publish_x.png';
			$img = JHTML::_('image','admin/'.$img, '', array('border' => 0), true);
		}				
		?>
		<tr class="<?php echo "row$k"; ?>">
			<td>
				<?php echo $this->pagination->getRowOffset( $i ); ?>
			</td>
			<td>
				<?php echo $checked; ?>
			</td>	
			<td>
				<a href="<?php echo $link; ?>">
					<?php echo $row->name; ?>
				</a>
			</td>
			<td>
				<?php echo $row->title; ?>
			</td>												
			<td>
				<?php echo $row->author; ?>
			</td>
			<td align="center">
				<?php echo $row->author_email;?>
			</td>
			<td align="center">
				<?php echo $img ; ?>
			</td>
			<td align="center">
				<?php echo $published ; ?>
			</td>			
			<td class="order">
				<span><?php echo $this->pagination->orderUpIcon( $i, true,'plugin.orderup', 'Move Up', $ordering ); ?></span>
				<span><?php echo $this->pagination->orderDownIcon( $i, $n, true, 'plugin.orderdown', 'Move Down', $ordering ); ?></span>
				<?php $disabled = $ordering ?  '' : 'disabled="disabled"'; ?>
				<input type="text" name="order[]" size="5" value="<?php echo $row->ordering;?>" <?php echo $disabled ?> class="text_area" style="text-align: center" />
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
	<table class="adminform" style="margin-top: 50px;">
		<tr>
			<td>
				<fieldset class="adminform">
					<legend><?php echo JText::_('OSM_INSTALL_NEW_PLUGIN'); ?></legend>
					<table>
						<tr>
							<td>
								<input type="file" name="plugin_package" id="plugin_package" size="50" class="inputbox" /> <input type="button" class="button" value="<?php echo JText::_('OSM_INSTALL'); ?>" onclick="installPlugin();" />
							</td>
						</tr>
					</table>					
				</fieldset>
			</td>
		</tr>		
	</table>
	</div>
	<input type="hidden" name="option" value="com_osmembership" />
	<input type="hidden" name="task" value="" />
	<input type="hidden" name="boxchecked" value="0" />
	<input type="hidden" name="filter_order" value="<?php echo $this->lists['order']; ?>" />
	<input type="hidden" name="filter_order_Dir" value="<?php echo $this->lists['order_Dir']; ?>" />	
	<?php echo JHTML::_( 'form.token' ); ?>				 
	<script type="text/javascript">
		function installPlugin() {
			var form = document.adminForm ;
			if (form.plugin_package.value =="") {
				alert("<?php echo JText::_('OSM_CHOOSE_PLUGIN'); ?>");
				return ;	
			}
			
			form.task.value = 'plugin.install' ;
			form.submit();
		}
	</script>
</form>