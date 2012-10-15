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
if (!version_compare(JVERSION, '1.6.0', 'ge'))
	$j15 = true ;
else
	$j15 = false ;	
JToolBarHelper::custom('subscribers.export', 'export', 'export', 'Export Subscribers', false);
?>
<form action="index.php?option=com_osmembership&view=subscribers" method="post" name="adminForm" id="adminForm">
<table width="100%">
<tr>
	<td align="left">
		<?php echo JText::_( 'Filter' ); ?>:
		<input type="text" name="search" id="search" value="<?php echo $this->state->search;?>" class="text_area search-query" onchange="document.adminForm.submit();" />		
		<button onclick="this.form.submit();" class="btn"><?php echo JText::_( 'Go' ); ?></button>
		<button onclick="document.getElementById('search').value='';this.form.submit();" class="btn"><?php echo JText::_( 'Reset' ); ?></button>		
	</td>
	<td align="right">
		<?php echo $this->lists['plan_id']; ?>
		<?php echo $this->lists['published']; ?>
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
				<?php echo JHTML::_('grid.sort',  JText::_('OSM_FIRSTNAME'), 'a.first_name', $this->lists['order_Dir'], $this->lists['order'] ); ?>				
			</th>											
			<th class="title" style="text-align: left;">
				<?php echo JHTML::_('grid.sort',  JText::_('OSM_LASTNAME'), 'a.last_name', $this->lists['order_Dir'], $this->lists['order'] ); ?>
			</th>										
			<th class="title" style="text-align: left;">
				<?php echo JHTML::_('grid.sort',  JText::_('OSM_PLAN'), 'b.title', $this->lists['order_Dir'], $this->lists['order'] ); ?>
			</th>
			<th class="title">
				<?php echo JHTML::_('grid.sort',  JText::_('OSM_ACTIVATE_TIME'), 'a.from_date', $this->lists['order_Dir'], $this->lists['order'] ); ?>
			</th>
			<th class="title">
				<?php echo JHTML::_('grid.sort',  JText::_('OSM_CREATED_DATE'), 'a.created_date', $this->lists['order_Dir'], $this->lists['order'] ); ?>
			</th>
			<th width="8%">
				<?php echo JHTML::_('grid.sort',  JText::_('OSM_GROSS_AMOUNT'), 'a.gross_amount', $this->lists['order_Dir'], $this->lists['order'] ); ?>
			</th>
			<th width="8%">
				<?php echo JHTML::_('grid.sort',  JText::_('OSM_SUBSCRIPTION_STATUS'), 'a.published', $this->lists['order_Dir'], $this->lists['order'] ); ?>
			</th>
			<?php 
				if ($this->config->auto_generate_membership_id) {
					$cols = 11 ;
				?>
					<th width="8%">
						<?php echo JHTML::_('grid.sort',  JText::_('OSM_MEMBERSHIP_ID'), 'a.membership_id', $this->lists['order_Dir'], $this->lists['order'] ); ?>
					</th>
				<?php	
				} else {
					$cols = 10 ;
				}
			?>
			<th width="2%">
				<?php echo JHTML::_('grid.sort',  JText::_('OSM_ID'), 'a.id', $this->lists['order_Dir'], $this->lists['order'] ); ?>
			</th>													
		</tr>
	</thead>
	<tfoot>
		<tr>
			<td colspan="<?php echo $cols ; ?>">
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
		$link 	= JRoute::_( 'index.php?option=com_osmembership&task=subscriber.edit&cid[]='. $row->id);		
		$checked 	= JHTML::_('grid.id',   $i, $row->id );						
		if ($row->user_id) {
			if ($j15) {
				$accountLink = 'index.php?option=com_users&view=user&task=edit&cid[]='.$row->user_id ;
			} else {
				$accountLink = 'index.php?option=com_users&task=user.edit&id='.$row->user_id ;
			}
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
				<a href="<?php echo $link; ?>"><?php echo $row->first_name ; ?></a>				
			</td>
			<td>																			
				<?php echo $row->last_name ; ?>
				<?php
					if ($row->username) {
					?>
						<a href="<?php echo $accountLink; ?>" title="View Profile">&nbsp;(<strong><?php echo $row->username ; ?>)</strong></a>
					<?php	
					}
				?>				
			</td>
			<td>
				<a href="<?php echo JRoute::_('index.php?option=com_osmembership&task=plan.edit&cid[]='.$row->plan_id); ?>"><?php echo $row->plan_title ; ?></a>				
			</td>																						
			<td align="center">
				<strong><?php echo JHTML::_('date', $row->from_date, $this->dateFormat); ?></strong> To <strong><?php echo JHTML::_('date', $row->to_date, $this->dateFormat); ?></strong>
			</td>					
			<td align="center">
				<?php echo JHTML::_('date', $row->created_date, $this->dateFormat); ?>
			</td>
			<td align="center">
				$<?php echo number_format($row->gross_amount, 2) ; ?>
			</td>
			<td align="center">
				<?php
					switch ($row->published) {
						case 0 :
							echo JText::_('OSM_PENDING');
							break ;
						case 1 :
							echo JText::_('OSM_ACTIVE');
							break ;
						case 2 :
							echo JText::_('OSM_EXPIRED');
							break ;
						case 3 :
							echo JText::_('OSM_CANCELLED_PENDING');
							break ;
						case 4 :
							echo JText::_('OSM_CANCELLED_REFUNDED');
							break ;								
					}
				?>
			</td>
			<?php 
				if ($this->config->auto_generate_membership_id) {
				?>
					<td>
						<?php echo $row->membership_id ; ?>
					</td>
				<?php	
				}
			?>
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