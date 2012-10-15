<?php
/**
* @version		1.0.0
 * @package		Joomla
* @subpackage	OSMembership
 * @author  Tuan Pham Ngoc
 * @copyright	Copyright (C) 2012 Ossolution Team
 * @license		GNU/GPL, see LICENSE.php
 */
// no direct access
defined( '_JEXEC' ) or die ;
$editor = & JFactory::getEditor(); 	
?>
<script language="javascript" type="text/javascript">
	<?php
		if (version_compare(JVERSION, '1.6.0', 'ge')) {
		?>
		Joomla.submitbutton = function(pressbutton)
		{
			var form = document.adminForm;
			if (pressbutton == 'plan.cancel') {
				Joomla.submitform(pressbutton, form);
				return;				
			} else {
				//Validate the entered data before submitting
				if (form.title.value == '') {
					alert("<?php echo JText::_('OSM_ENTER_PLAN_TITLE'); ?>");
					form.title.focus();
					return ;
				}
				if (form.subscription_length.value == '') {
					alert("<?php echo JText::_('OSM_ENTER_SUBSCRIPTION_LENGTH'); ?>");
					form.subscription_length.focus();
					return ;
				}
																	
				Joomla.submitform(pressbutton, form);
			}								
		}
		<?php	
		} else {
		?>
		function submitbutton(pressbutton) {
			var form = document.adminForm;
			if (pressbutton == 'plan.cancel') {
				submitform( pressbutton );
				return;				
			} else {
				if (form.title.value == '') {
					alert("<?php echo JText::_('OSM_ENTER_PLAN_TITLE'); ?>");
					form.title.focus();
					return ;
				}
				if (form.subscription_length.value == '') {
					alert("<?php echo JText::_('OSM_ENTER_SUBSCRIPTION_LENGTH'); ?>");
					form.subscription_length.focus();
					return ;
				}
				
				submitform( pressbutton );
			}
		}	
		<?php	
		}	
	?>
		
	function addRow() {
		var table = document.getElementById('price_list');
		var newRowIndex = table.rows.length - 1 ;
		var row = table.insertRow(newRowIndex);			
		var registrantNumber = row.insertCell(0);							
		var price = row.insertCell(1);						
		registrantNumber.innerHTML = '<input type="text" class="inputbox" name="number_days[]" size="10" />';			
		price.innerHTML = '<input type="text" class="inputbox" name="renew_price[]" size="10" />';		
		
	}
	function removeRow() {
		var table = document.getElementById('price_list');
		var deletedRowIndex = table.rows.length - 2 ;
		if (deletedRowIndex >= 1) {
			table.deleteRow(deletedRowIndex);
		} else {
			alert("<?php echo JText::_('OSM_NO_ROW_TO_DELETE'); ?>");
		}
	}
	
</script>

<form action="index.php" method="post" name="adminForm" id="adminForm" enctype="multipart/form-data">
	<div class="row-fluid">
		<ul class="nav nav-tabs">
			<li class="active"><a href="#general-page" data-toggle="tab"><?php echo JText::_('OSM_BASIC_INFORMATION');?></a></li>
			<?php 
				if (count($this->plugins)) {
					$count = 0 ;
					foreach ($this->plugins as $plugin) {
						$title  = $plugin['title'] ;
						$count++ ;
					?>
						<li><a href="#<?php echo 'tab_'.$count;  ?>" data-toggle="tab"><?php echo $title;?></a></li>
					<?php							
					}
				}
			?>					
		</ul>
		<div class="tab-content">			
			<div class="tab-pane active" id="general-page">
				<div class="col width-60 span7" style="float:left">
						<fieldset class="adminform">
							<legend><?php echo JText::_('OSM_PLAN_DETAIL');?></legend>
								<table class="admintable adminform" style="width: 100%;">
									<tr>
										<td width="220" class="key">
											<?php echo  JText::_('OSM_TITLE'); ?>
										</td>
										<td>
											<input class="text_area" type="text" name="title" id="title" size="40" maxlength="250" value="<?php echo $this->item->title;?>" />
										</td>
										<td>
											&nbsp;
										</td>
									</tr>				
									<tr>
										<td valign="top" class="key">
											<?php echo  JText::_('OSM_CATEGORY'); ?>
										</td>
										<td >
											<?php echo $this->lists['category_id']; ?>
										</td>
										<td>
											&nbsp;
										</td>
									</tr>				
									<tr>
										<td class="key">
											<?php echo  JText::_('OSM_PRICE'); ?>
										</td>
										<td>
											<input class="text_area" type="text" name="price" id="price" size="10" maxlength="250" value="<?php echo $this->item->price;?>" />
										</td>
										<td>
											&nbsp;
										</td>
									</tr>
									<tr>
										<td class="key">
											<?php echo  JText::_('OSM_SUBSCRIPTION_LENGTH'); ?>
										</td>
										<td>
											<input class="text_area" type="text" name="subscription_length" id="subscription_length" size="10" maxlength="250" value="<?php echo $this->item->subscription_length;?>" /> days
										</td>
										<td>
											&nbsp;
										</td>
									</tr>
									<tr>
										<td class="key">
											<?php echo JText::_('OSM_EXPIRED_DATE'); ?>
										</td>
										<td>						
											<?php echo JHTML::_('calendar', (($this->item->expired_date == $this->nullDate) ||  !$this->item->expired_date) ? '' : JHTML::_('date', $this->item->expired_date, 'Y-m-d', null), 'expired_date', 'expired_date') ; ?>						
										</td>
										<td>
											&nbsp;
										</td>
									</tr>											
									<tr>
										<td width="150" class="key" valign="top">
											<?php echo  JText::_('OSM_THUMB'); ?>
										</td>
										<td valign="top">
											<?php echo $this->lists['thumb']; ?>
										</td>
										<td>
											
										</td>
									</tr>
									<tr>
										<td width="150" class="key">
											<?php echo  JText::_('OSM_SEND_FIRST_REMINDER'); ?>
										</td>
										<td>
											<input type="text" class="inputbox" name="send_first_reminder" value="<?php echo $this->item->send_first_reminder; ?>" size="5" />&nbsp;<?php echo JText::_('OSM_BEFORE_SUBSCRIPTION_EXPIRED'); ?>
										</td>
										<td>
											&nbsp;
										</td>
									</tr>
									<tr>
										<td width="150" class="key">
											<?php echo  JText::_('OSM_ENABLE_RENEWAL'); ?>
										</td>
										<td>
											<?php echo $this->lists['enable_renewal']; ?>
										</td>
										<td>
											&nbsp;
										</td>
									</tr>
									<tr>
										<td width="150" class="key">
											<?php echo  JText::_('OSM_SEND_SECOND_REMINDER'); ?>
										</td>
										<td>
											<input type="text" class="inputbox" name="send_second_reminder" value="<?php echo $this->item->send_second_reminder; ?>" size="5" />&nbsp;<?php echo JText::_('OSM_BEFORE_SUBSCRIPTION_EXPIRED'); ?>
										</td>
										<td>
											&nbsp;
										</td>
									</tr>							
									<tr>
										<td class="key">
											<?php echo JText::_('OSM_SHORT_DESCRIPTION'); ?>
										</td>
										<td>
											<?php echo $editor->display( 'short_description',  $this->item->short_description , '100%', '250', '75', '10' ) ; ?>
										</td>
										<td>
											&nbsp;
										</td>
									</tr>												
									<tr>
										<td class="key">
											<?php echo JText::_('OSM_DESCRIPTION'); ?>
										</td>
										<td>
											<?php echo $editor->display( 'description',  $this->item->description , '100%', '250', '75', '10' ) ; ?>
										</td>
										<td>
											&nbsp;
										</td>
									</tr>				
									<tr>
										<td class="key">
											<?php echo JText::_('OSM_PUBLISHED'); ?>
										</td>
										<td>
											<?php echo $this->lists['published']; ?>
										</td>
										<td>
											&nbsp;
										</td>
									</tr>
							</table>	
						</fieldset>
					</div>			
					<div class="col width-40 span5" style="float:left; display: inline;">
						<fieldset class="adminform">
							<legend class="adminform"><?php echo JText::_('OSM_RENEW_OPTIONS'); ?></legend>
							<table class="adminlist" id="price_list">
								<tr>
									<th width="30%">
										<?php echo JText::_('OSM_NUMBER_DAYS'); ?>
									</th>				
									<th>
										<?php echo JText::_('OSM_PRICE'); ?>
									</th>
								</tr>
								<?php				
									$n = max(count($this->prices), 3);
									for ($i = 0 ; $i < $n ; $i++) {
											if (isset($this->prices[$i])) {
												$price = $this->prices[$i] ;							
												$numberDays = $price->number_days ;
												$renewPrice = $price->price ;
											} else {
												$numberDays =  null ;
												$renewPrice =  null ;
											}
									?>
										<tr>
											<td>
												<input type="text" class="inputbox" name="number_days[]" size="10" value="<?php echo $numberDays; ?>" />
											</td>						
											<td>
												<input type="text" class="inputbox" name="renew_price[]" size="10" value="<?php echo $renewPrice; ?>" />
											</td>
										</tr>
									<?php				 									
									}
								?>
								<tr>
									<td colspan="3">
										<input type="button" class="button" value="<?php echo JText::_('OSM_ADD'); ?>" onclick="addRow();" />
										&nbsp;
										<input type="button" class="button" value="<?php echo JText::_('OSM_REMOVE'); ?>" onclick="removeRow();" />
									</td>
								</tr>
							</table>					
						</fieldset>
					</div>
					<div class="col width-40 span5" style="float:left; display: inline;">
						<fieldset class="adminform">
							<legend class="adminform"><?php echo JText::_('OSM_RECURRING_SETTINGS'); ?></legend>
							<table class="admintable" id="price_list">
								<tr>
									<td width="30%" class="key">
										<?php echo JText::_('OSM_RECURRING_SUBSCRIPTION'); ?>
									</td>				
									<td>
										<?php echo $this->lists['recurring_subscription']; ?>
									</td>
								</tr>		
								<tr>
									<td class="key">
										<?php echo JText::_('OSM_TRIAL_AMOUNT'); ?>
									</td>
									<td>
										<input type="text" class="inputbox" name="trial_amount" value="<?php echo $this->item->trial_amount; ?>" size="10" />					
									</td>				
								</tr>
								<tr>
									<td class="key">
										<?php echo JText::_('OSM_NUMBER_PAYMENTS'); ?>
									</td>
									<td>
										<input type="text" class="inputbox" name="number_payments" value="<?php echo $this->item->number_payments; ?>" size="10" />					
									</td>				
								</tr>						
							</table>					
						</fieldset>
					</div>
					<div class="clearfix"></div>	
			</div>
			<?php 
				if (count($this->plugins)) {
					$count = 0 ;
					foreach ($this->plugins as $plugin) {						
						$form = $plugin['form'] ;
						$count++ ;
					?>
						<div class="tab-pane active" id="tab_<?php echo $count; ?>">
							<?php 
								echo $form ;
							?>
						</div>
					<?php							
					}
				}
			?>
		</div>		
	</div>
	<div class="clearfix"></div>
	<?php echo JHTML::_( 'form.token' ); ?>
	<input type="hidden" name="option" value="com_osmembership" />
	<input type="hidden" name="cid[]" value="<?php echo $this->item->id; ?>" />
	<input type="hidden" name="task" value="" />
</form>