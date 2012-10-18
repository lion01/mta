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

switch($this->action) {
	case 'upgrade' :
		$headerText = JText::_('OSM_SUBSCRIION_UPGRADE_FORM_HEADING');
		break ;
	case 'renew' :
		$headerText = JText::_('OSM_SUBSCRIION_RENEW_FORM_HEADING');
		break ;
	default :
		$headerText = JText::_('OSM_SUBSCRIPTION_FORM_HEADING') ;
		break ;
}
$headerText = str_replace('[PLAN_TITLE]', $this->plan->title, $headerText) ;
?>
	<h1 class="osm_title"><?php echo $headerText; ?></h1>
<?php
if (!$this->userId && $this->config->registration_integration && $this->config->show_login_box_on_subscribe_page) {
	$actionUrl = JRoute::_('index.php?option=com_users&task=user.login');
	$returnUrl = JRoute::_('index.php?option=com_osmembership&view=register&id='.$this->planId.'&Itemid='.$this->Itemid);
?>
<form method="post" action="<?php echo $actionUrl ; ?>" name="osm_login_form" id="osm_login_form">
		<table class="os_table">
			<tr>
				<td colspan="2">
					<h2 class="osm_title"><?php echo JText::_('OSM_EXISTING_USER_LOGIN'); ?></h2>
				</td>
			</tr>
			<tr>
				<td class="title_cell">
					<label for="username"><?php echo JText::_('OSM_USERNAME'); ?></label>
				</td>
				<td class="field_cell">
					<input type="text" name="username" id="username" class="osm_inputbox inputbox" value="" size="15" />
				</td>
			</tr>
			<tr>
				<td class="title_cell">
					<?php echo JText::_('OSM_PASSWORD'); ?>
				</td>
				<td class="field_cell">
					<input type="password" id="password" name="password" class="osm_inputbox inputbox" value="" size="15" />
				</td>
			</tr>
			<tr>
				<td colspan="2" class="title_cell">
					<input type="submit" value="<?php echo JText::_('OSM_LOGIN'); ?>" class="button btn btn-primary" />
                                        <br /><br />
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<h2 class="osm_title"><?php echo JText::_('OSM_NEW_USER_REGISTER'); ?></h2>
				</td>
			</tr>
		</table>
		<input type="hidden" name="remember" value="1" />
		<input type="hidden" name="return" value="<?php echo base64_encode($returnUrl) ; ?>" />
		<?php echo JHTML::_( 'form.token' ); ?>
</form>

<?php
}

?>
	<form method="post" name="os_form" id="os_form" action="<?php echo JRoute::_('index.php?option=com_osmembership&task=subscription_confirmation&Itemid='.$this->Itemid, false, $this->config->use_https ? true : false); ?>" enctype="multipart/form-data" autocomplete="off">
<?php
		if (strlen($this->message)) {
		?>
			<div class="msg"><?php echo $this->message ; ?></div>
		<?php
		}
	?>
	<table  class="os_table">
    		<?php
    		if ($this->enableCoupon) {
    		?>
    			<tr class="title_cell">
    				<td class="title_cell" width="30%">
    					<label for="coupon_code"><?php echo  JText::_('OSM_COUPON') ?></label>
    				</td>
    				<td class="field_cell">
    					<input type="text" class="osm_inputbox inputbox" name="coupon_code" id="coupon_code" value="<?php echo $this->couponCode; ?>" size="18" />
    					<?php
    						if ($this->errorCoupon) {
    						?>
    							<span class="invalid"><?php echo JText::_('OSM_INVALID_COUPON'); ?></span>
    						<?php
    						}
    					?>
    				</td>
    			</tr>
    		<?php
    		}
    		if (!$this->userId && $this->config->registration_integration) {
    		?>
	    		<tr>
					<td class="title_cell" width="30%">
						<label for="username1">
							<?php echo  JText::_('OSM_USERNAME') ?>
							<span class="required">*</span>
						</label>
					</td>
					<td class="field_cell">
						<input type="text" name="username" id="username1" class="osm_inputbox inputbox" value="<?php echo $this->username; ?>" size="15" />
						<?php
							if ($this->registrationErrorCode == 1 || $this->registrationErrorCode == 3) {
							?>
								<span class="invalid"><?php echo JText::_('OSM_INVALID_USERNAME'); ?></span>
							<?php
							}
						?>
					</td>
				</tr>
				<tr>
					<td class="title_cell" width="30%">
						<label for="password1">
							<?php echo  JText::_('OSM_PASSWORD') ?>
							<span class="required">*</span>
						</label>
					</td>
					<td class="field_cell">
						<input type="password" name="password1" id="password1" class="osm_inputbox inputbox" value="<?php echo $this->password; ?>" size="15" />
					</td>
				</tr>
				<tr>
					<td class="title_cell" width="30%">
						<label for="password2">
							<?php echo  JText::_('OSM_RETYPE_PASSWORD') ?>
							<span class="required">*</span>
						</label>
					</td>
					<td class="field_cell">
						<input type="password" name="password2" id="password2" class="osm_inputbox inputbox" value="<?php echo $this->password; ?>" size="15" />
					</td>
				</tr>
    		<?php
    		}

			foreach ($this->fields as $field) {
				switch ($field->field_type) {
					case FIELD_TYPE_HEADING :
						?>
							<tr>
								<td colspan="2" class="heading"><?php echo JText::_($field->title) ; ?></td>
							</tr>
						<?php
						break ;
					case FIELD_TYPE_MESSAGE :
						?>
							<tr>
								<td colspan="2" class="message">
									<?php echo $field->description ; ?>
								</td>
							</tr>
						<?php
						break ;
					default:
					?>
						<tr>
							<td class="title_cell key">
								<label for="<?php echo $field->name ; ?>">
									<?php echo $field->title ; ?>
									<?php
										if ($field->required) {
											echo '<span class="required">*</span>' ;
										}
									?>
								</label>
								<?php
									if (strlen(trim($field->description))) {
									?>
										<p class="field_description"><?php echo $field->description ; ?></p>
									<?php
									}
								?>
							</td>
							<td class="field_cell">
								<?php echo $field->output ; ?>
							</td>
						</tr>
					<?php
				}
			}
			if (count($this->methods) > 1) {
				?>
					<tr>
						<td class="title_cell" valign="top">
							<label for="payment_method">
								<?php echo JText::_('OSM_PAYMENT_OPTION'); ?>
								<span class="required">*</span>
							</label>
						</td>
						<td class="field_cell">
							<?php
								$method = null ;
								for ($i = 0 , $n = count($this->methods); $i < $n; $i++) {
									$paymentMethod = $this->methods[$i];
									if ($paymentMethod->getName() == $this->paymentMethod) {
										$checked = ' checked="checked" ';
										$method = $paymentMethod ;
									}
									else
										$checked = '';
								?>
									<input onclick="changePaymentMethod();" type="radio" name="payment_method" value="<?php echo $paymentMethod->getName(); ?>" <?php echo $checked; ?> /><?php echo JText::_($paymentMethod->title) ; ?> <br />
								<?php
								}
							?>
						</td>
					</tr>
				<?php
				} else {
					$method = $this->methods[0] ;
				}
				if ($method->getCreditCard()) {
					$style = '' ;
				} else {
					$style = 'style = "display:none"';
				}
				?>
				<tr id="tr_card_number" <?php echo $style; ?>>
					<td class="title_cell"><?php echo  JText::_('AUTH_CARD_NUMBER'); ?><span class="required">*</span></td>
					<td class="field_cell">
						<input type="text" name="x_card_num" class="osm_inputbox inputbox" onkeyup="checkNumber(this)" value="<?php echo $this->x_card_num; ?>" size="20" />
					</td>
				</tr>
				<tr id="tr_exp_date" <?php echo $style; ?>>
					<td class="title_cell">
						<?php echo JText::_('AUTH_CARD_EXPIRY_DATE'); ?><span class="required">*</span>
					</td>
					<td class="field_cell">
						<?php echo $this->lists['exp_month'] .'  /  '.$this->lists['exp_year'] ; ?>
					</td>
				</tr>
				<tr id="tr_cvv_code" <?php echo $style; ?>>
					<td class="title_cell">
						<?php echo JText::_('AUTH_CVV_CODE'); ?><span class="required">*</span>
					</td>
					<td class="field_cell">
						<input type="text" name="x_card_code" class="osm_inputbox inputbox" onKeyUp="checkNumber(this)" value="<?php echo $this->x_card_code; ?>" size="20" />
					</td>
				</tr>
				<?php
					if ($method->getCardType()) {
						$style = '' ;
					} else {
						$style = ' style = "display:none;" ' ;
					}
				?>
					<tr id="tr_card_type" <?php echo $style; ?>>
						<td class="title_cell">
							<?php echo JText::_('OSM_CARD_TYPE'); ?><span class="required">*</span>
						</td>
						<td class="field_cell">
							<?php echo $this->lists['card_type'] ; ?>
						</td>
					</tr>
				<?php
					if ($method->getCardHolderName()) {
						$style = '' ;
					} else {
						$style = ' style = "display:none;" ' ;
					}
				?>
					<tr id="tr_card_holder_name" <?php echo $style; ?>>
						<td class="title_cell">
							<?php echo JText::_('OSM_CARD_HOLDER_NAME'); ?><span class="required">*</span>
						</td>
						<td class="field_cell">
							<input type="text" name="card_holder_name" class="osm_inputbox inputbox"  value="<?php echo $this->cardHolderName; ?>" size="40" />
						</td>
					</tr>
				<?php
					if ($method->getName() == 'os_echeck') {
						$style = '';
					} else {
						$style = ' style = "display:none;" ' ;
					}
				?>
				    <tr id="tr_bank_rounting_number" <?php echo $style; ?>>
				      <td class="title_cell"><?php echo JText::_('OSM_BANK_ROUTING_NUMBER'); ?><span class="required">*</span></td>
				      <td class="field_cell"><input type="text" name="x_bank_aba_code" class="osm_inputbox inputbox"  value="<?php echo $this->x_bank_aba_code; ?>" size="40" onKeyUp="checkNumber(this);" /></td>
				    </tr>
				    <tr id="tr_bank_account_number" <?php echo $style; ?>>
				      <td class="title_cell"><?php echo JText::_('OSM_BANK_ACCOUNT_NUMBER'); ?><span class="required">*</span></td>
				      <td class="field_cell"><input type="text" name="x_bank_acct_num" class="osm_inputbox inputbox"  value="<?php echo $this->x_bank_acct_num; ?>" size="40" onKeyUp="checkNumber(this);" /></td>
				    </tr>
				    <tr id="tr_bank_account_type" <?php echo $style; ?>>
				      <td class="title_cell"><?php echo JText::_('OSM_BANK_ACCOUNT_TYPE'); ?><span class="required">*</span></td>
				      <td class="field_cell"><?php echo $this->lists['x_bank_acct_type']; ?></td>
				    </tr>
				    <tr id="tr_bank_name" <?php echo $style; ?>>
				      <td class="title_cell"><?php echo JText::_('OSM_BANK_NAME'); ?><span class="required">*</span></td>
				      <td class="field_cell"><input type="text" name="x_bank_name" class="osm_inputbox inputbox"  value="<?php echo $this->x_bank_name; ?>" size="40" /></td>
				    </tr>
				    <tr id="tr_bank_account_holder" <?php echo $style; ?>>
				      <td class="title_cell"><?php echo JText::_('OSM_ACCOUNT_HOLDER_NAME'); ?><span class="required">*</span></td>
				      <td class="field_cell"><input type="text" name="x_bank_acct_name" class="osm_inputbox inputbox"  value="<?php echo $this->x_bank_acct_name; ?>" size="40" /></td>
				    </tr>
				<?php
				if ($this->idealEnabled) {
			        if ($method->getName() == 'os_ideal') {
						$style = '' ;
					} else {
						$style = ' style = "display:none;" ' ;
					}
				?>
					<tr id="tr_bank_list" <?php echo $style; ?>>
						<td class="title_cell">
							<?php echo JText::_('OSM_BANK_LIST'); ?><span class="required">*</span>
						</td>
						<td class="field_cell">
							<?php echo $this->lists['bank_id'] ; ?>
						</td>
					</tr>
				<?php
			    }
				if ($this->config->accept_term ==1) {
					$articleId = $this->config->article_id ;
					$db = & JFactory::getDbo() ;
					$sql = 'SELECT id, catid, sectionid FROM #__content WHERE id='.$articleId ;
					$db->setQuery($sql) ;
					$rowArticle = $db->loadObject() ;
					$catId = $rowArticle->catid ;
					$sectionId = $rowArticle->sectionid ;
					require_once JPATH_ROOT.'/components/com_content/helpers/route.php' ;
					if (@$this->config->fix_term_and_condition_popup) {
					    $termLink = ContentHelperRoute::getArticleRoute($articleId, $catId, $sectionId).'&format=html' ;
					    $extra = ' target="_blank" ';
					} else {
					    $termLink = ContentHelperRoute::getArticleRoute($articleId, $catId, $sectionId).'&tmpl=component&format=html' ;
					    $extra = ' class="modal" ' ;
					}
				?>
					<tr>
						<td colspan="2">
							<input type="checkbox" name="accept_term" value="1" class="osm_inputbox inputbox" />
							<strong><?php echo JText::_('OSM_ACCEPT'); ?>&nbsp;<a href="<?php echo JRoute::_($termLink); ?>" <?php echo $extra ; ?>><?php echo JText::_('OSM_TERM_AND_CONDITION'); ?></a></strong>
						</td>
					</tr>
				<?php
				}
			?>
		<tr>
			<td colspan="2" align="left">
				<input type="button" class="button btn btn-primary" name="btnSubmit" value="<?php echo  JText::_('OSM_SUBSCRIBE_CONFIRMATION') ;?>" onclick="checkData();">
			</td>
		</tr>
	</table>
	<?php
		if (count($this->methods) == 1) {
		?>
			<input type="hidden" name="payment_method" value="<?php echo $this->methods[0]->getName(); ?>" />
		<?php
		}
	?>
	<input type="hidden" name="Itemid" value="<?php echo $this->Itemid; ?>" />
	<input type="hidden" name="plan_id" value="<?php echo $this->plan->id ; ?>" />
	<input type="hidden" name="option" value="com_osmembership" />
	<input type="hidden" name="act" value="<?php echo $this->action ; ?>" />
	<input type="hidden" name="from_subscription_id" value="<?php echo $this->fromSubscriptionId ; ?>" />
	<input type="hidden" name="renew_option_id" value="<?php echo $this->renewOptionId ; ?>" />
	<input type="hidden" name="upgrade_option_id" value="<?php echo $this->upgradeOptionId ; ?>" />


	<script language="javascript">
		<?php
			os_payments::writeJavascriptObjects();
		?>
		function checkData() {
			var form = document.os_form ;
			<?php
				if (!$this->userId && $this->config->registration_integration) {
				//Username and password validation
				?>
					if (form.username.value == "") {
						alert("<?php echo JText::_('OSM_ENTER_USERNAME'); ?>");
						form.username.focus();
						return ;
					}
					if (form.password1.value == "") {
						alert("<?php echo JText::_('OSM_ENTER_PASSWORD'); ?>");
						form.password1.focus();
						return ;
					}
					if (form.password2.value != form.password1.value) {
						alert("<?php echo JText::_('OSM_PASSWORD_DOES_NOT_MATCH'); ?>");
						form.password1.focus();
						return ;
					}
				<?php
				}
				echo $this->validations ;
			?>
			var paymentMethod = "";
			<?php
				if (count($this->methods) > 1) {
				?>
					var paymentValid = false;
					for (var i = 0 ; i < form.payment_method.length; i++) {
						if (form.payment_method[i].checked == true) {
							paymentValid = true;
							paymentMethod = form.payment_method[i].value;
							break;
						}
					}

					if (!paymentValid) {
						alert("<?php echo JText::_('OSM_REQUIRE_PAYMENT_OPTION'); ?>");
						return;
					}
				<?php
				} else {
				?>
					paymentMethod = "<?php echo $this->methods[0]->getName(); ?>";
				<?php
				}
				?>
				method = methods.Find(paymentMethod);
				//Check payment method page
				if (method.getCreditCard()) {
					if (form.x_card_num.value == "") {
						alert("<?php echo  JText::_('OSM_ENTER_CARD_NUMBER'); ?>");
						form.x_card_num.focus();
						return;
					}
					if (form.x_card_code.value == "") {
						alert("<?php echo JText::_('OSM_ENTER_CARD_CODE'); ?>");
						form.x_card_code.focus();
						return ;
					}
				}
				if (method.getCardHolderName()) {
					if (form.card_holder_name.value == '') {
						alert("<?php echo JText::_('OSM_ENTER_CARD_HOLDER_NAME') ; ?>");
						form.card_holde_name.focus();
						return ;
					}
				}
				//Need to add validation here
				/**This check is only used for echeck payment gateway**/
				if (paymentMethod == 'os_echeck') {
					if (form.x_bank_aba_code.value == '') {
						alert("<?php echo JText::_('OSM_BANK_ROUTING_NUMBER_REQUIRE') ?>");
						form.x_bank_aba_code.focus();
						return ;
					}
					if (form.x_bank_acct_num.value == '') {
						alert("<?php echo JText::_('OSM_BANK_ACCOUNT_NUMBER_REQUIRE') ?>");
						form.x_bank_aba_code.focus();
						return ;
					}
					if (form.x_bank_name.value == '') {
						alert("<?php echo JText::_('OSM_BANK_NAME_REQUIRE') ?>");
						form.x_bank_name.focus();
						return ;
					}
					if (form.x_bank_acct_name.value == '') {
						alert("<?php echo JText::_('OSM_BANK_ACCOUNT_HOLDER_NAME_REQUIRE') ?>");
						form.x_bank_acct_name.focus();
						return ;
					}
				}
			<?php
				if ($this->config->accept_term) {
				?>
					if (form.accept_term.checked == false) {
						alert("<?php echo JText::_('OSM_ACCEPT_TERM') ; ?>");
						form.accept_term.focus();
						return ;
					}
				<?php
				}
			?>

			form.submit();
		}

		function checkNumber(txtName)
		{
			var num = txtName.value
			if(isNaN(num))
			{
				alert("<?php echo JText::_('OSM_ONLY_NUMBER'); ?>");
				txtName.value = "";
				txtName.focus();
			}
		}
	</script>
	<?php echo JHTML::_( 'form.token' ); ?>
</form>
