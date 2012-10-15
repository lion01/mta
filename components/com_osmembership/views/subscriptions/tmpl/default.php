<?php 
/**
 * @version		1.5.0
 * @package		Joomla
 * @subpackage	OSMembership
 * @author  Tuan Pham Ngoc
 * @copyright	Copyright (C) 2011 Ossolution Team
 * @license		GNU/GPL, see LICENSE.php
 */
defined('_JEXEC') or die ; 
$itemId = OSMembershipHelper::getItemid();
?>
<form method="post" name=os_form id="os_form" action="<?php echo JRoute::_('index.php?option=com_osmembership&view=subscriptions&Itemid='.$this->Itemid); ?>">			
<h1 class="osm_title"><?php echo JText::_('OSM_SUBSCRIPTION_HISTORY') ; ?></h1>
	<table class="table table-striped table-bordered table-condensed">
		<thead>		
			<tr>					
				<th class="sectiontableheader">
					<?php echo JText::_('OSM_PLAN') ?>
				</th>							
				<th class="sectiontableheader" width="20%">
					<?php echo JText::_('OSM_ACTIVATE_TIME') ; ?>
				</th>
				<th class="sectiontableheader" width="14%" style="text-align: right;">
					<?php echo JText::_('OSM_GROSS_AMOUNT') ; ?>
				</th>
				<th class="sectiontableheader">
					<?php echo JText::_('OSM_SUBSCRIPTION_STATUS'); ?>
				</th>
				<th class="sectiontableheader" width="13%">
					<?php echo JText::_('OSM_TRANSACTION_ID') ; ?>
				</th>
				<th class="sectiontableheader" style="text-align: center;">
					<?php echo JText::_('OSM_ACTIONS') ; ?>
				</th>			
			</tr>
		</thead>
		<tbody>
		<?php
			$tabs = array('sectiontableentry1' , 'sectiontableentry2') ;
			$k = 0 ;
			for ($i = 0 , $n = count($this->items) ; $i < $n ; $i++) {
				$row = $this->items[$i] ;							
				$tab = $tabs[$k] ;
				$k = 1- $k ;
				$link = JRoute::_('index.php?option=com_osmembership&view=subscription&id='.$row->id.'&Itemid='.$this->Itemid);
				$renewLink = JRoute::_('index.php?option=com_osmembership&task=renew_membership&from_subscription_id='.$row->id.'&renew_option_id='.OSM_DEFAULT_RENEW_OPTION_ID.'&Itemid='.$itemId, false);
			?>
				<tr class="<?php echo $tab; ?>">					
					<td>
						<a href="<?php echo $link; ?>"><?php echo $row->plan_title; ?></a>
					</td>											
					<td align="center">
						<strong><?php echo JHTML::_('date', $row->from_date, $this->config->date_format); ?></strong> To <strong><?php echo JHTML::_('date', $row->to_date, $this->config->date_format); ?></strong>
					</td>
					<td align="right">
						<?php echo $this->config->currency_symbol.number_format($row->gross_amount, 2) ; ?>
					</td>
					<td>
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
					<td>
						<?php echo $row->transaction_id ; ?>
					</td>
					<td style="text-align: center;">
						<div class="dm_taskbar">
						    <ul>	
						    	<li>
						    		<a href="<?php echo $link; ?>" class="osm_subscription_detail_link"><?php echo JText::_('OSM_VIEW_DETAIL'); ?></a>
						    	</li>				    													
						    	<?php 
									if ($row->enable_renewal && !$row->recurring_subscription) {
									?>
										<li>	
											<a href="<?php echo $renewLink ; ?>" class="osm_subscription_detail_link"><?php echo JText::_('OSM_RENEW'); ?></a>
										</li>	
									<?php	
									}
								?>					    																										
						    </ul>						    
						</div>																																						
					</td>
				</tr>
			<?php	
			}
			?>
			</tbody>
			<?php
			if ($this->pagination->total > $this->pagination->limit) {
			?>
			<tfoot>	
				<tr>
					<td colspan="6">
						<div class="pagination"><?php echo $this->pagination->getListFooter(); ?></div>
					</td>
				</tr>
			</tfoot>	
			<?php	
			}
		?>					
	</table>				 	       	
	<?php echo JHtml::_('form.token'); ?>				
</form>