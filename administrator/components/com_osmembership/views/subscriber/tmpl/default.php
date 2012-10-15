<?php
/**
 * @version		1.5.0
 * @package		Joomla
 * @subpackage	OS Membership
 * @author  Tuan Pham Ngoc
 * @copyright	Copyright (C) 2012 Ossolution Team
 * @license		GNU/GPL, see LICENSE.php
 */
// no direct access
defined( '_JEXEC' ) or die ;

?>
<script language="javascript" type="text/javascript">
	<?php
		if (version_compare(JVERSION, '1.6.0', 'ge')) {
		?>
			Joomla.submitbutton = function(pressbutton)
			{
				var form = document.adminForm;
				if (pressbutton == 'subscriber.cancel') {
					Joomla.submitform(pressbutton, form);
					return;				
				} else {
					//Validate the entered data before submitting					
					Joomla.submitform(pressbutton, form);
				}								
			}
		<?php	
		} else {
		?>
			function submitbutton(pressbutton) {
				var form = document.adminForm;
				if (pressbutton == 'subscriber.cancel') {
					submitform( pressbutton );
					return;				
				} else {
					//Validate the entered data before submitting
					submitform( pressbutton );
				}
			}	
		<?php	
		}
	?>	
</script>
<form action="index.php" method="post" name="adminForm" id="adminForm">
<div class="col width-100" style="float:left">			
	<table class="admintable adminform">		
		<tr>
			<td width="100" align="right" class="key">
				<?php echo JText::_('OSM_PLAN'); ?>
			</td>
			<td>
				<?php echo $this->lists['plan_id'] ; ?>
			</td>
		</tr>		
		<tr>
			<td class="key">
				<?php echo JText::_('OSM_USER'); ?>				
			</td>
			<td>
				<?php echo $this->lists['user_id']; ?>
				<input type="text" name="osm_user_id" value="" class="inputbox" size="20" />
			</td>
		</tr>
		<?php 
			if ($this->config->auto_generate_membership_id) {
			?>
			<tr>
				<td class="key">
					<?php echo JText::_('OSM_MEMBERSHIP_ID'); ?>				
				</td>
				<td>				
					<input type="text" name="membership_id" value="<?php echo $this->item->membership_id > 0 ? $this->item->membership_id : ''; ?>" class="inputbox" size="20" />
				</td>
			</tr>
			<?php	
			}
		?>
		<tr>
			<td width="100" align="right" class="key">
				<?php echo  JText::_('OSM_FIRSTNAME'); ?>
			</td>
			<td>
				<input class="text_area" type="text" name="first_name" id="first_name" size="40" maxlength="250" value="<?php echo $this->item->first_name;?>" />
			</td>
		</tr>
		<tr>
			<td width="100" align="right" class="key">
				<?php echo  JText::_('OSM_LASTNAME'); ?>
			</td>
			<td>
				<input class="text_area" type="text" name="last_name" id="last_name" size="40" maxlength="250" value="<?php echo $this->item->last_name;?>" />
			</td>
		</tr>
		
		<?php
			if (in_array('organization', $this->coreFields)) {
			?>
				<tr>
					<td width="100" align="right" class="key">
						<?php echo  JText::_('OSM_ORGANIZATION'); ?>
					</td>
					<td>
						<input class="text_area" type="text" name="organization" id="organization" size="40" maxlength="250" value="<?php echo $this->item->organization;?>" />
					</td>
				</tr>	
			<?php	
			}
			if (in_array('address', $this->coreFields)) {
			?>
				<tr>
					<td width="100" align="right" class="key">
						<?php echo  JText::_('OSM_ADDRESS'); ?>
					</td>
					<td>
						<input class="text_area" type="text" name="address" id="address" size="40" maxlength="250" value="<?php echo $this->item->address;?>" />
					</td>
				</tr>	
			<?php	
			}		
			if (in_array('address2', $this->coreFields)) {	
			?>
				<tr>
					<td width="100" align="right" class="key">
						<?php echo  JText::_('OSM_ADDRESS2'); ?>
					</td>
					<td>
						<input class="text_area" type="text" name="address2" id="address2" size="40" maxlength="250" value="<?php echo $this->item->address2;?>" />
					</td>
				</tr>	
			<?php	
			}
			if (in_array('city', $this->coreFields)) {
			?>
				<tr>
					<td width="100" align="right" class="key">
						<?php echo  JText::_('OSM_CITY'); ?>
					</td>
					<td>
						<input class="text_area" type="text" name="city" id="city" size="40" maxlength="250" value="<?php echo $this->item->city;?>" />
					</td>
				</tr>	
			<?php	
			}
			if (in_array('state', $this->coreFields)) {
			?>
				<tr>
					<td width="100" align="right" class="key">
						<?php echo  JText::_('OSM_STATE'); ?>
					</td>
					<td>
						<input class="text_area" type="text" name="state" id="state" size="40" maxlength="250" value="<?php echo $this->item->state;?>" />
					</td>
				</tr>	
			<?php	
			}
			if (in_array('zip', $this->coreFields)) {
			?>
				<tr>
					<td width="100" align="right" class="key">
						<?php echo  JText::_('OSM_ZIP'); ?>
					</td>
					<td>
						<input class="text_area" type="text" name="zip" id="zip" size="40" maxlength="250" value="<?php echo $this->item->zip;?>" />
					</td>
				</tr>	
			<?php	
			}
			if (in_array('country', $this->coreFields)) {
			?>
				<tr>
					<td width="100" align="right" class="key">
						<?php echo  JText::_('OSM_COUNTRY'); ?>
					</td>
					<td>
						<?php echo $this->lists['country_list']; ?>
					</td>
				</tr>	
			<?php	
			}
			if (in_array('phone', $this->coreFields)) {
			?>
				<tr>
					<td width="100" align="right" class="key">
						<?php echo  JText::_('OSM_PHONE'); ?>
					</td>
					<td>
						<input class="text_area" type="text" name="phone" id="phone" size="40" maxlength="250" value="<?php echo $this->item->phone;?>" />
					</td>
				</tr>	
			<?php	
			}
			if (in_array('fax', $this->coreFields)) {
			?>
				<tr>
					<td width="100" align="right" class="key">
						<?php echo  JText::_('OSM_FAX'); ?>
					</td>
					<td>
						<input class="text_area" type="text" name="fax" id="fax" size="40" maxlength="250" value="<?php echo $this->item->fax;?>" />
					</td>
				</tr>	
			<?php	
			}					
		?>	
		<tr>
			<td width="100" align="right" class="key">
				<?php echo  JText::_('OSM_EMAIL'); ?>
			</td>
			<td>
				<input class="text_area" type="text" name="email" id="email" size="40" maxlength="250" value="<?php echo $this->item->email;?>" />
			</td>
		</tr>			
		<?php
		if (in_array('comment', $this->coreFields)) {
			?>
				<tr>
					<td width="100" align="right" class="key">
						<?php echo  JText::_('OSM_COMMENT'); ?>
					</td>
					<td>
						<textarea rows="7" cols="40" name="comment"><?php echo $this->item->comment;?></textarea>
					</td>
				</tr>	
			<?php	
			}
		?>
		<tr>
			<td width="100" align="right" class="key">
				<?php echo  JText::_('OSM_CREATED_DATE'); ?>
			</td>
			<td>
				<?php echo JHTML::_('calendar', $this->item->created_date, 'created_date', 'created_date') ; ?>				
			</td>
		</tr>				
		<tr>
			<td width="100" align="right" class="key">
				<?php echo  JText::_('OSM_SUBSCRIPTION_START_DATE'); ?>
			</td>
			<td>
				<?php echo JHTML::_('calendar', $this->item->from_date, 'from_date', 'from_date') ; ?>				
			</td>
		</tr>
		<tr>
			<td width="100" align="right" class="key">
				<?php echo  JText::_('OSM_SUBSCRIPTION_END_DATE'); ?>
			</td>
			<td>
				<?php echo JHTML::_('calendar', $this->item->to_date, 'to_date', 'to_date') ; ?>				
			</td>
		</tr>
		<tr>
			<td width="100" align="right" class="key">
				<?php echo  JText::_('OSM_NET_AMOUNT'); ?>
			</td>
			<td>
				<?php echo $this->config->currency_symbol ;  ?><input type="text" class="inputbox" name="amount" value="<?php echo $this->item->amount > 0 ? number_format($this->item->amount, 2) : ""; ?>" size="7" />				
			</td>
		</tr>
		<?php
            if ($this->item->discount_amount > 0 || !$this->item->id) {
            ?>
          		<tr>
        			<td width="100" align="right" class="key">
        				<?php echo  JText::_('OSM_DISCOUNT_AMOUNT'); ?>
        			</td>
        			<td>
        				<?php echo $this->config->currency_symbol ;  ?><input type="text" class="inputbox" name="discount_amount" value="<?php echo $this->item->discount_amount > 0 ? number_format($this->item->discount_amount, 2) : ""; ?>" size="7" />				
        			</td>
        		</tr>  	
            <?php    
            }
            
            if ($this->item->tax_amount > 0 || !$this->item->id) {
            ?>
                 <tr>
                    	<td width="100" align="right" class="key">
                    			<?php echo  JText::_('OSM_TAX_AMOUNT'); ?>
                    	</td>
                    	<td>
                    			<?php echo $this->config->currency_symbol ;  ?><input type="text" class="inputbox" name="tax_amount" value="<?php echo $this->item->tax_amount > 0 ? number_format($this->item->tax_amount, 2) : ""; ?>" size="7" />				
                    	</td>
                 </tr>  	
            <?php    
            }            
            ?>
            <tr>
                     <td width="100" align="right" class="key">
                           <?php echo  JText::_('OSM_GROSS_AMOUNT'); ?>
                     </td>
                     <td>
                           <?php echo $this->config->currency_symbol ;  ?><input type="text" class="inputbox" name="gross_amount" value="<?php echo $this->item->gross_amount > 0 ? number_format($this->item->gross_amount, 2) : ""; ?>" size="7" />				
                     </td>
            </tr>  	              	
		<tr>
			<td align="right" class="key">
				<?php echo JText::_('OSM_PAYMENT_METHOD') ?>					
			</td>
			<td>
				<?php echo $this->lists['payment_method'] ; ?>
			</td>
		</tr>		
		<tr>
			<td class="key">
				<?php echo JText::_('OSM_TRANSACTION_ID'); ?>
			</td>
			<td>
				<input type="text" class="inputbox" size="50" name="transaction_id" id="transaction_id" value="<?php echo $this->item->transaction_id ; ?>" />
			</td>
		</tr>
		<tr>
			<td class="key">
				<?php echo JText::_('OSM_SUBSCRIPTION_STATUS'); ?>
			</td>
			<td>
				<?php echo $this->lists['published'] ; ?>
			</td>
		</tr>			
		<?php
			if ($this->customField) {			
				echo $this->fields ;
			}			
		?>
	</table>			
</div>		
<div class="clr"></div>
	<input type="hidden" name="option" value="com_osmembership" />
	<input type="hidden" name="cid[]" value="<?php echo $this->item->id; ?>" />
	<input type="hidden" name="task" value="" />			
	<?php echo JHTML::_( 'form.token' ); ?>
</form>