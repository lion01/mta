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

$headerText = JText::_('OSM_SUBSCRIPTION_CONFIRMATION') ;
$headerText = str_replace('[PLAN_TITLE]', $this->plan->title, $headerText) ;
?>
<h1 class="osm_title"><?php echo $headerText; ?></h1>	
<?php   	
$message = $this->message ;
if ($message) {		
?>
	<p class="info"><?php echo $message ; ?></p>
<?php	
}
?>

<form method="post" name="osm_form" id="osm_form" action="<?php echo JRoute::_('index.php?option=com_osmembership&task=process_subscription&Itemid='.$this->Itemid, false, $this->config->use_https ? true : false); ?>">		
	<table width="100%" class="osm_table">
		<?php			
			if (!$this->userId && $this->config->registration_integration) {
			?>	
				<tr>
					<td class="title_cell">
						<?php echo JText::_('OSM_USERNAME'); ?>
					</td>
					<td class="field_cell">
						<?php echo $this->username ; ?>				
					</td>
				</tr>
				<tr>
					<td class="title_cell">
						<?php echo JText::_('OSM_PASSWORD'); ?>
					</td>
					<td class="field_cell">
						<?php echo str_pad('', strlen($this->password), '*', STR_PAD_LEFT); ?>			
					</td>
				</tr>
			<?php
			}								
			echo $this->confirmation ;											
			if ($this->amount >0) {
			?>
				<tr>
					<td class="title_cell">
						<?php echo JText::_('OSM_PRICE'); ?>
					</td>
					<td>
						<?php echo OSMembershipHelper::formatCurrency($this->amount, $this->config); ?>						
					</td>
				</tr>				
			<?php
				if ($this->discount > 0) {
				?>
					<tr>
						<td class="title_cell">
							<?php echo JText::_('OSM_DISCOUNT'); ?>
						</td>
						<td>
							<?php echo OSMembershipHelper::formatCurrency($this->discount, $this->config); ?>							
						</td>
					</tr>
				<?php	
				}
				if ($this->tax > 0) {
				?>
					<tr>
						<td class="title_cell">
							<?php echo JText::_('OSM_TAX'); ?>
						</td>
						<td>	
							<?php echo OSMembershipHelper::formatCurrency($this->tax, $this->config); ?>													
						</td>
					</tr>
				<?php	
				}
				if ($this->grossAmount != $this->amount) {
				?>
					<tr>
						<td class="title_cell">
							<?php echo JText::_('OSM_GROSS_AMOUNT'); ?>
						</td>
						<td>				
							<?php echo OSMembershipHelper::formatCurrency($this->grossAmount, $this->config); ?>								
						</td>
					</tr>
				<?php	
				}										
			}	
			
			if ($this->grossAmount > 0) {
			?>
			<tr>
				<td class="title_cell">
					<?php echo  JText::_('OSM_PAYMEMNT_METHOD'); ?>
				</td>
				<td class="field_cell">					
					<?php echo  JText::_(os_payments::loadPaymentMethod($this->paymentMethod)->title); ?>
				</td>
			</tr>
			<?php			
				$method = $this->method ;							
				if ($method->getCreditCard()) {
				?>	
					<tr>
						<td class="title_cell"><?php echo  JText::_('AUTH_CARD_NUMBER'); ?>
						<td class="field_cell">
							<?php
								$len = strlen($this->x_card_num) ;
								$remaining =  substr($this->x_card_num, $len - 4 , 4) ;
								echo str_pad($remaining, $len, '*', STR_PAD_LEFT) ;
							?>												
						</td>
					</tr>
					<tr>
						<td class="title_cell">
							<?php echo JText::_('AUTH_CARD_EXPIRY_DATE'); ?>
						</td>
						<td class="field_cell">						
							<?php echo $this->expMonth .'/'.$this->expYear ; ?>
						</td>
					</tr>
					<tr>
						<td class="title_cell">
							<?php echo JText::_('AUTH_CVV_CODE'); ?>
						</td>
						<td class="field_cell">
							<?php echo $this->x_card_code ; ?>
						</td>
					</tr>
					<?php
						if ($method->getCardType()){
						?>
							<tr>
								<td class="title_cell">
									<?php echo JText::_('OSM_CARD_TYPE'); ?>
								</td>
								<td class="field_cell">
									<?php echo $this->cardType ; ?>
								</td>
							</tr>
						<?php	
						}
					?>
				<?php				
				}						
				if ($method->getCardHolderName()) {
				?>
					<tr>
						<td class="title_cell">
							<?php echo JText::_('OSM_CARD_HOLDER_NAME'); ?>
						</td>
						<td class="field_cell">
							<?php echo $this->cardHolderName;?>
						</td>
					</tr>
				<?php												
				}
				if ($this->paymentMethod == 'os_echeck') {
				?>
					<tr>
						<td class="title_cell">
							<?php echo JText::_('OSM_BANK_ROUTING_NUMBER'); ?>
						</td>
						<td class="field_cell">
							<?php echo $this->x_bank_aba_code; ?>						
						</td>
					</tr>	
					
					<tr>
						<td class="title_cell">
							<?php echo JText::_('OSM_BANK_ACCOUNT_NUMBER'); ?>
						</td>
						<td class="field_cell">
							<?php echo $this->x_bank_acct_num; ?>						
						</td>
					</tr>
															
					<tr>
						<td class="title_cell">
							<?php echo JText::_('OSM_BANK_ACCOUNT_TYPE'); ?>
						</td>
						<td class="field_cell">
							<?php echo $this->x_bank_acct_type ; ?>						
						</td>
					</tr>
					
					<tr>
						<td class="title_cell">
							<?php echo JText::_('OSM_BANK_NAME'); ?>
						</td>
						<td class="field_cell">
							<?php echo $this->x_bank_name ; ?>						
						</td>
					</tr>
					
					<tr>
						<td class="title_cell">
							<?php echo JText::_('OSM_ACCOUNT_HOLDER_NAME'); ?>
						</td>
						<td class="field_cell">
							<?php echo $this->x_bank_acct_name ; ?>						
						</td>
					</tr>
				<?php		
				}							
			}		
			if ($this->config->enable_captcha) {
			?>
				<tr>
					<td class="title_cell">
						<?php echo JText::_('OSM_CAPTCHA'); ?><span class="required">*</span>
					</td>
					<td>
						<input type="text" class="inputbox" value="" size="8" name="security_code" />
						<img src="<?php echo JRoute::_('index.php?option=com_osmembership&task=show_captcha_image'); ?>" title="<?php echo JText::_('OSM_CAPTCHA_GUIDE'); ?>" align="middle" id="captcha_image" />
						<a href="javascript:reloadCaptcha();"><strong><?php echo JText::_('OSM_RELOAD'); ?></strong></a>
						<?php
							if ($this->captchaInvalid) {
							?>
								<span class="error"><?php echo JText::_('OSM_INVALID_CAPTCHA_ENTERED'); ?></span>
							<?php	
							}
						?>				
					</td>
				</tr>	
			<?php	
			}																																	
		?>					
		<tr>
			<td colspan="2" align="left">
				<input type="button" class="button btn btn-primary" name="btnBack" value="<?php echo  JText::_('OSM_BACK') ;?>" onclick="goBack();" />
				<input type="button" class="button btn btn-primary" name="btnSubmit" value="<?php echo  JText::_('OSM_PROCESS_SUBSCRIPTION') ;?>" onclick="checkCaptcha();" />
			</td>
		</tr>										
	</table>	
	<input type="hidden" name="Itemid" value="<?php echo $this->Itemid; ?>" />
	<input type="hidden" name="option" value="com_osmembership" />		
	<input type="hidden" name="coupon_code" value="<?php echo $this->couponCode ; ?>" />
	
	<script type="text/javascript">
		function checkCaptcha() {
			var form = document.osm_form ;
		<?php	
			if ($this->config->enable_captcha) {
		    ?>    
		        if (form.security_code.value == '') {
					alert("<?php echo JText::_("OSM_ENTER_CAPTCHA"); ?>");
					form.security_code.focus() ;
					return ;	
				}
			<?php	
		    }
		?>   
			form.submit(); 		
		}
		function goBack() {
			var form = document.osm_form ;
			form.action = "<?php echo JRoute::_('index.php?option=com_osmembership&view=register&id='.$this->plan->id.'&Itemid='.$this->Itemid, false, $this->config->use_https ? true : false); ?>" ;			
			form.submit();	
		}		
	</script>	
	<!--  Hidden fields -->			
	
	<input type="hidden" name="plan_id" value="<?php echo $this->plan->id ; ?>" />
	<input type="hidden" name="from_subscription_id" value="<?php echo $this->fromSubscriptionId ; ?>" />
	<input type="hidden" name="act" value="<?php echo $this->action ; ?>" />
	<input type="hidden" name="renew_option_id" value="<?php echo $this->renewOptionId ; ?>" />
	<input type="hidden" name="upgrade_option_id" value="<?php echo $this->upgradeOptionId ; ?>" />	
		
	<input type="hidden" name="payment_method" value="<?php echo $this->paymentMethod; ?>" />
	<input type="hidden" name="x_card_num" value="<?php echo $this->x_card_num; ?>" />		
	<input type="hidden" name="exp_month" value="<?php echo $this->expMonth; ?>" />		
	<input type="hidden" name="exp_year" value="<?php echo $this->expYear; ?>" />		
	<input type="hidden" name="x_exp_date" value="<?php echo $this->x_exp_date ; ?>" />		
	<input type="hidden" name="x_card_code" value="<?php echo $this->x_card_code; ?>" />				
	<input type="hidden" name="card_holder_name" value="<?php echo $this->cardHolderName ; ?>" />
	<input type="hidden" name="card_type" value="<?php echo $this->cardType; ?>" />
			
	<input type="hidden" name="x_bank_aba_code" value="<?php echo $this->x_bank_aba_code;  ?>" />	
	<input type="hidden" name="x_bank_acct_num" value="<?php echo $this->x_bank_acct_num;  ?>" />	
	<input type="hidden" name="x_bank_acct_type" value="<?php echo $this->x_bank_acct_type;  ?>" />	
	<input type="hidden" name="x_bank_name" value="<?php echo $this->x_bank_name;  ?>" />	
	<input type="hidden" name="x_bank_acct_name" value="<?php echo $this->x_bank_acct_name;  ?>" />
	<input type="hidden" name="bank_id" value="<?php echo $this->bankId ; ?>" />		
			
	<input type="hidden" name="username" value="<?php echo $this->username ; ?>" />
	<input type="hidden" name="password1" value="<?php echo $this->password ; ?>" />					
	 
	<?php echo $this->hidden ; ?>				
	<?php echo JHTML::_( 'form.token' ); ?>
</form>