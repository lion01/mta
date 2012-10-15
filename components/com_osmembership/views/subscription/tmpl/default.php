<?php
/**
 * @version		1.5.0
 * @package		Joomla
 * @subpackage	OS Membership
 * @author  Tuan Pham Ngoc
 * @copyright	Copyright (C) 2011 Ossolution Team
 * @license		GNU/GPL, see LICENSE.php
 */

defined('_JEXEC') or die ; 
$itemId = OSMembershipHelper::getItemid();
?>
<h1 class="osm_title"><?php echo JText::_('OSM_SUBSCRIPTION_DETAIL'); ?></h1>
<form method="post" name="os_form" id="os_form" action="index.php">
	<table class="os_table">				
		<tr>
			<td class="title_cell" width="30%">
				<?php echo JText::_('OSM_PLAN'); ?>
			</td>
			<td class="field_cell">
				<?php echo $this->item->plan_title ; ?>
			</td>
		</tr>		
		<?php 
			if ($this->config->auto_generate_membership_id && $this->item->membership_id) {
			?>
			<tr>
				<td class="title_cell">
					<?php echo  JText::_('OSM_MEMBERSHIP_ID'); ?>
				</td>
				<td class="field_cell">
					<?php echo $this->item->membership_id ; ?>
				</td>
			</tr>
			<?php	
			}
		?>
		<tr>
			<td class="title_cell">
				<?php echo  JText::_('OSM_FIRSTNAME'); ?>
			</td>
			<td class="field_cell">
				<?php echo $this->item->first_name ; ?>
			</td>
		</tr>
		<tr>
			<td class="title_cell">
				<?php echo  JText::_('OSM_LASTNAME'); ?>
			</td>
			<td class="field_cell">
				<?php echo $this->item->last_name ; ?>
			</td>
		</tr>
		
		<?php
			if (in_array('organization', $this->coreFields)) {
			?>
				<tr>
					<td class="title_cell">
						<?php echo  JText::_('OSM_ORGANIZATION'); ?>
					</td>
					<td class="field_cell">
						<?php echo $this->item->organization ; ?>
					</td>
				</tr>	
			<?php	
			}
			if (in_array('address', $this->coreFields)) {
			?>
				<tr>
					<td class="title_cell">
						<?php echo  JText::_('OSM_ADDRESS'); ?>
					</td>
					<td class="field_cell">
						<?php echo $this->item->address ; ?>
					</td>
				</tr>	
			<?php	
			}		
			if (in_array('address2', $this->coreFields)) {	
			?>
				<tr>
					<td class="title_cell">
						<?php echo  JText::_('OSM_ADDRESS2'); ?>
					</td>
					<td class="field_cell">
						<?php echo $this->item->address2 ; ?>
					</td>
				</tr>	
			<?php	
			}
			if (in_array('city', $this->coreFields)) {
			?>
				<tr>
					<td class="title_cell">
						<?php echo  JText::_('OSM_CITY'); ?>
					</td>
					<td class="field_cell">
						<?php echo $this->item->city ; ?>
					</td>
				</tr>	
			<?php	
			}
			if (in_array('state', $this->coreFields)) {
			?>
				<tr>
					<td class="title_cell">
						<?php echo  JText::_('OSM_STATE'); ?>
					</td>
					<td class="field_cell">
						<?php echo $this->item->state ; ?>
					</td>
				</tr>	
			<?php	
			}
			if (in_array('zip', $this->coreFields)) {
			?>
				<tr>
					<td class="title_cell">
						<?php echo  JText::_('OSM_ZIP'); ?>
					</td>
					<td>
						<?php echo $this->item->zip ; ?>
					</td>
				</tr>	
			<?php	
			}
			if (in_array('country', $this->coreFields)) {
			?>
				<tr>
					<td class="title_cell">
						<?php echo  JText::_('OSM_COUNTRY'); ?>
					</td>
					<td class="field_cell">
						<?php echo $this->item->country ; ?>
					</td>
				</tr>	
			<?php	
			}
			if (in_array('phone', $this->coreFields)) {
			?>
				<tr>
					<td class="title_cell">
						<?php echo  JText::_('OSM_PHONE'); ?>
					</td>
					<td class="field_cell">
						<?php echo $this->item->phone ; ?>
					</td>
				</tr>	
			<?php	
			}
			if (in_array('fax', $this->coreFields)) {
			?>
				<tr>
					<td class="title_cell">
						<?php echo  JText::_('OSM_FAX'); ?>
					</td>
					<td class="field_cell">
						<?php echo $this->item->fax ; ?>
					</td>
				</tr>	
			<?php	
			}					
		?>	
		<tr>
			<td class="title_cell">
				<?php echo  JText::_('OSM_EMAIL'); ?>
			</td>
			<td class="field_cell">
				<?php echo $this->item->email ; ?>
			</td>
		</tr>			
		<?php
		if (in_array('comment', $this->coreFields)) {
			?>
				<tr>
					<td class="title_cell">
						<?php echo  JText::_('OSM_COMMENT'); ?>
					</td>
					<td>
						<?php echo $this->item->comment;?>
					</td>
				</tr>	
			<?php	
			}
			if ($this->customField) {
				echo $this->fields ;
			}
		?>						
		<tr>
			<td class="title_cell">
				<?php echo  JText::_('OSM_CREATED_DATE'); ?>
			</td>
			<td class="field_cell">
				<?php echo JHTML::_('date', $this->item->created_date, $this->config->date_format) ; ?>				
			</td>
		</tr>				
		<tr>
			<td class="title_cell">
				<?php echo  JText::_('OSM_SUBSCRIPTION_START_DATE'); ?>
			</td>
			<td class="field_cell">
				<?php echo JHTML::_('date', $this->item->from_date, $this->config->date_format) ; ?>				
			</td>
		</tr>
		<tr>
			<td class="title_cell">
				<?php echo  JText::_('OSM_SUBSCRIPTION_END_DATE'); ?>
			</td>
			<td class="field_cell">
				<?php echo JHTML::_('date', $this->item->to_date, $this->config->date_format) ; ?>				
			</td>
		</tr>
		<tr>
			<td class="title_cell">
				<?php echo  JText::_('OSM_NET_AMOUNT'); ?>
			</td>
			<td class="field_cell">
				<?php echo $this->config->currency_symbol.($this->item->amount > 0 ? number_format($this->item->amount, 2) : ""); ?>				
			</td>
		</tr>
		<?php
            if ($this->item->discount_amount > 0) {
            ?>
          		<tr>
        			<td class="title_cell">
        				<?php echo  JText::_('OSM_DISCOUNT_AMOUNT'); ?>
        			</td>
        			<td class="field_cell">
        				<?php echo $this->config->currency_symbol ;  ?><?php echo $this->item->discount_amount > 0 ? number_format($this->item->discount_amount, 2) : ""; ?>				
        			</td>
        		</tr>  	
            <?php    
            }
            
            if ($this->item->tax_amount > 0 || !$this->item->id) {
            ?>
                 <tr>
                    	<td class="title_cell">
                    			<?php echo  JText::_('OSM_TAX_AMOUNT'); ?>
                    	</td>
                    	<td class="field_cell">
                    			<?php echo $this->config->currency_symbol ;  ?><?php echo $this->item->tax_amount > 0 ? number_format($this->item->tax_amount, 2) : ""; ?>				
                    	</td>
                 </tr>  	
            <?php    
            }            
            ?>
            <tr>
                     <td class="title_cell">
                           <?php echo  JText::_('OSM_GROSS_AMOUNT'); ?>
                     </td>
                     <td class="field_cell">
                           <?php echo $this->config->currency_symbol ;  ?><?php echo $this->item->gross_amount > 0 ? number_format($this->item->gross_amount, 2) : ""; ?>				
                     </td>
            </tr>  	              	
		<tr>
			<td class="title_cell">
				<?php echo JText::_('OSM_PAYMENT_METHOD') ?>					
			</td>
			<td class="field_cell">
				<?php echo $this->item->payment_method ; ?>
			</td>
		</tr>		
		<tr>
			<td class="title_cell">
				<?php echo JText::_('OSM_TRANSACTION_ID'); ?>
			</td>
			<td class="field_cell">
				<?php echo $this->item->transaction_id ; ?>
			</td>
		</tr>
		<tr>
			<td class="title_cell">
				<?php echo JText::_('OSM_SUBSCRIPTION_STATUS'); ?>
			</td>
			<td class="field_cell">
				<?php
				switch ($this->item->published) {
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
		</tr>			
		
		
		<?php
			if ($this->renewOption || $this->upgradeOption) {
			?>
				<tr>
					<th colspan="2">
						<?php echo JText::_('OSM_UPGRADE_AND_RENEW'); ?>
					</th>
				</tr>
				<?php
				if ($this->item->enable_renewal && !$item->recurring_subscription && $this->renewOption) {
				?>
					<tr>
						<td class="title_cell">
							<?php echo $this->lists['renew_option_id']; ?>
						</td>
						<td class="field_cell">
							<input type="button" class="button btn btn-primary" value="<?php echo JText::_('OSM_PROCESS_RENEW'); ?>" onclick="checkMembershipRenew();" />
						</td>
					</tr>
				<?php	
				}
				if ($this->upgradeOption) {
				?>
					<tr>
						<td class="title_cell">
							<?php echo $this->lists['upgrade_option_id']; ?>
						</td>
						<td class="field_cell">
							<input type="button" class="button btn btn-primary" value="<?php echo JText::_('OSM_PROCESS_UPGRADE'); ?>" onclick="checkMembershipUpgrade();" />
						</td>
					</tr>
				<?php	
				}
				?>
			<?php	
			}			
		?>				
	</table>
		
	<script type="text/javascript" language="javascript">
		function checkMembershipRenew() {				
			var form = document.os_form ;			
			if (form.renew_option_id.value == 0) {
				alert("<?php echo JText::_('OSM_CHOOSE_RENEW_OPTION'); ?>");
				form.renew_option_id.focus();
				return ;
			}
			var renewUrl = '<?php echo JRoute::_('index.php?option=com_osmembership&task=renew_membership&from_subscription_id='.$this->item->id.'&Itemid='.$itemId.'&renew_option_id=', false); ?>' + form.renew_option_id.value ;						
			location.href = renewUrl ;										
		}

		
		function checkMembershipUpgrade() {
			var form = document.os_form ;
			if (form.upgrade_option_id.value == 0) {
				alert("<?php echo JText::_('OSM_CHOOSE_UPGRADE_OPTION'); ?>");
				form.upgrade_option_id.focus();
				return ;
			}
			var upgradeUrl = '<?php echo JRoute::_('index.php?option=com_osmembership&task=upgrade_membership&from_subscription_id='.$this->item->id.'&Itemid='.$itemId.'&upgrade_option_id=', false); ?>' + form.upgrade_option_id.value ;
			location.href = upgradeUrl ;
		}				
	</script>			
</form>