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
	
JToolBarHelper::title(   JText::_( 'Configuration' ), 'generic.png' );
JToolBarHelper::save('configuration.save');	
JToolBarHelper::cancel('configuration.cancel');	

$editor = & JFactory::getEditor() ;
?>
<form action="index.php" method="post" name="adminForm" id="adminForm">
	<div class="row-fluid">
		<ul class="nav nav-tabs">
			<li class="active"><a href="#general-page" data-toggle="tab"><?php echo JText::_('OSM_GENERAL');?></a></li>
			<li><a href="#message-page" data-toggle="tab"><?php echo JText::_('OSM_MESSAGES');?></a></li>			
			<li><a href="#subscription-renew-page" data-toggle="tab"><?php echo JText::_('OSM_SUBSCRIPTION_RENEW_MESSAGES');?></a></li>
			<li><a href="#subscription-upgrade-page" data-toggle="tab"><?php echo JText::_('OSM_SUBSCRIPTION_UPGRADE_MESSAGES');?></a></li>
			<li><a href="#subscription-reminder-page" data-toggle="tab"><?php echo JText::_('OSM_SUBSCRIPTION_REMINDER_MESSAGES');?></a></li>			
		</ul>	
		<div class="tab-content">			
			<div class="tab-pane active" id="general-page">
				<table class="admintable adminform" style="width:100%;">
					<tr>
						<td  class="key" style="width:25%">
							<?php echo JText::_('OSM_REGISTRATION_INTEGRATION'); ?>
						</td>
						<td width="40%">
							<?php echo $this->lists['registration_integration']; ?>
						</td>
						<td>
							<?php echo JText::_('OSM_REGISTRATION_INTEGRATION_EXPLAIN'); ?>
						</td>
					</tr>
					<tr>
						<td  class="key" style="width:25%">
							<?php echo JText::_('OSM_GENERATE_MEMBERSHIP_ID'); ?>
						</td>
						<td width="40%">
							<?php echo $this->lists['auto_generate_membership_id']; ?>
						</td>
						<td>
							<?php echo JText::_('OSM_GENERATE_MEMBERSHIP_ID_EXPLAIN'); ?>
						</td>
					</tr>			
					<tr>
						<td  class="key" style="width:25%">
							<?php echo JText::_('OSM_MEMBERSHIP_ID_START_NUMBER'); ?>
						</td>
						<td width="40%">
							<input type="text" name="membership_id_start_number" class="inputbox" value="<?php echo $this->config->membership_id_start_number ? $this->config->membership_id_start_number : 1000; ?>" size="10" />
						</td>
						<td>
							<?php echo JText::_('OSM_MEMBERSHIP_ID_START_NUMBER_EXPLAIN'); ?>
						</td>
					</tr>
					<tr>
						<td  class="key">
							<?php echo JText::_('OSM_SHOW_LOGIN_BOX'); ?>
						</td>
						<td>
							<?php echo $this->lists['show_login_box_on_subscribe_page']; ?>
						</td>
						<td>
							<?php echo JText::_('OSM_SHOW_LOGIN_BOX_EXPLAIN'); ?>
						</td>
					</tr>					
					<tr>
						<td  class="key">
							<?php echo JText::_('OSM_INTEGRATION'); ?>
						</td>
						<td>
							<?php echo $this->lists['cb_integration']; ?>
						</td>
						<td>
							&nbsp;
						</td>
					</tr>
					<tr>
						<td  class="key">
							<?php echo JText::_('OSM_ENABLE_CAPTCHA'); ?>
						</td>
						<td>
							<?php echo $this->lists['enable_captcha']; ?>
						</td>
						<td>
							&nbsp;
						</td>
					</tr>
					<tr>
						<td class="key">
							<?php echo JText::_('OSM_ENABLE_TAX'); ?>
						</td>
						<td>
							<?php echo $this->lists['enable_tax']; ?>
						</td>
						<td>
							&nbsp;
						</td>
					</tr>
					<tr>
						<td class="key">
							<?php echo JText::_('OSM_ENABLE_COUPON'); ?>
						</td>
						<td>
							<?php echo $this->lists['enable_coupon']; ?>
						</td>
						<td>
							&nbsp;
						</td>
					</tr>		
					<tr>
						<td class="key">
							<?php echo JText::_('OSM_CARD_TYPES'); ?>
						</td>
						<td>
							<?php echo $this->lists['enable_cardtypes'] ; ?>
						</td>
						<td>
						</td>
					</tr>
					<tr>
						<td class="key">
							<?php echo JText::_('OSM_DEFAULT_TAX_RATE'); ?>
						</td>
						<td>
							<input type="text" name="tax_rate" class="inputbox" value="<?php echo $this->config->tax_rate; ?>" size="10" />
						</td>
						<td>
							&nbsp;
						</td>
					</tr>										
					<tr>
						<td class="key">
							<?php echo JText::_('OSM_ACTIVATE_HTTPS'); ?>
						</td>
						<td>
							<?php echo $this->lists['use_https']; ?>
						</td>
						<td>
							&nbsp;
						</td>
					</tr>																	
					<tr>
						<td class="key">
							<?php echo JText::_('OSM_SHOW_TERMS_AND_CONDITIONS') ?>
						</td>
						<td>
							<?php
								echo $this->lists['active_term'];
							?>
						</td>
						<td>
							&nbsp;
						</td>
					</tr>
					<tr>
						<td class="key">
							<?php echo JText::_('OSM_TERMS_AND_CONDITIONS_ARTICLE') ; ?>
						</td>
						<td>
							<?php echo $this->lists['article_id']; ?>
						</td>
						<td>
							&nbsp;
						</td>
					</tr>			
					<tr>
						<td class="key">
							<?php echo JText::_('OSM_DATE_FORMAT') ; ?>					
						</td>
						<td>
							<input type="text" name="date_format" class="inputbox" value="<?php echo $this->config->date_format; ?>" size="10" />
						</td>
						<td>
							&nbsp;
						</td>
					</tr>						
					<tr>
						<td class="key">
							<?php echo JText::_('OSM_CURRENCY_SYMBOL'); ?>
						</td>
						<td>
							<input type="text" name="currency_symbol" class="inputbox" value="<?php echo $this->config->currency_symbol; ?>" size="10" />
						</td>
						<td>
							&nbsp;
						</td>
					</tr>
					<tr>
						<td class="key">
							<?php echo JText::_('OSM_DECIMALS'); ?>
						</td>
						<td>
							<input type="text" name="decimals" class="inputbox" value="<?php echo isset($this->config->decimals) ? $this->config->decimals : 2; ?>" size="10" />
						</td>
						<td>
							<?php echo JText::_('OSM_DECIMALS_EXPLAIN'); ?>
						</td>
					</tr>
					
					<tr>
						<td class="key">
							<?php echo JText::_('OSM_DECIMAL_POINT'); ?>
						</td>
						<td>
							<input type="text" name="dec_point" class="inputbox" value="<?php echo isset($this->config->dec_point) ? $this->config->dec_point : '.'; ?>" size="10" />
						</td>
						<td>
							<?php echo JText::_('OSM_DECIMAL_POINT_EXPLAIN'); ?>
						</td>
					</tr>
					
					<tr>
						<td class="key">
							<?php echo JText::_('OSM_THOUNSANDS_SEP'); ?>
						</td>
						<td>
							<input type="text" name="thousands_sep" class="inputbox" value="<?php echo isset($this->config->thousands_sep) ? $this->config->thousands_sep : ','; ?>" size="10" />
						</td>
						<td>
							<?php echo JText::_('OSM_THOUNSANDS_SEP_EXPLAIN'); ?>
						</td>
					</tr>
					
					<tr>
						<td class="key">
							<?php echo JText::_('OSM_CURRENCY_POSITION'); ?>
						</td>
						<td>
							<?php echo $this->lists['currency_position']; ?>
						</td>
						<td>
							&nbsp;
						</td>
					</tr>
					<tr>
						<td class="key">
							<?php echo JText::_('OSM_NUMBER_COLUMNS_IN_COLUMNS_LAYOUT'); ?>
						</td>
						<td>
							<input type="text" name="number_columns" class="inputbox" value="<?php echo $this->config->number_columns ? $this->config->number_columns : 3 ; ?>" size="10" />
						</td>
						<td>
							<?php echo JText::_('OSM_NUMBER_COLUMNS_IN_COLUMNS_LAYOUT_EXPLAIN'); ?>
						</td>
					</tr>			
					<tr>
						<td class="key">
							<?php echo JText::_('OSM_DEFAULT_COUNTRY'); ?>
						</td>
						<td>
							<?php echo $this->lists['country_list']; ?>
						</td>
						<td>
							&nbsp;
						</td>
					</tr>																													
				</table>
			</div>
			<div class="tab-pane" id="message-page">
				<table class="admintable adminform" style="width:100%;">
					<tr>
						<td class="key" width="25%">
							<?php echo JText::_('OSM_FROM_NAME'); ?>					
						</td>
						<td>
							<input type="text" name="from_name" class="inputbox" value="<?php echo $this->config->from_name; ?>" size="50" />
						</td>
						<td>
							<strong><?php echo JText::_('OSM_FROM_NAME_EXPLAIN'); ?></strong>
						</td>
					</tr>			
					<tr>
						<td class="key" width="25%">
							<?php echo JText::_('OSM_FROM_EMAIL'); ?>					
						</td>
						<td>
							<input type="text" name="from_email" class="inputbox" value="<?php echo $this->config->from_email; ?>" size="50" />
						</td>
						<td>
							<strong><?php echo JText::_('OSM_FROM_EMAIL_EXPLAIN'); ?></strong>
						</td>
					</tr>				
					<tr>
						<td class="key" width="25%">
							<?php echo JText::_('OSM_NOTIFICATION_EMAILS'); ?>					
						</td>
						<td>
							<input type="text" name="notification_emails" class="inputbox" value="<?php echo $this->config->notification_emails; ?>" size="50" />
						</td>
						<td>
							<strong><?php echo JText::_('OSM_NOTIFICATION_EMAILS_EXPLAIN'); ?></strong>
						</td>
					</tr>																							
					<tr>
						<td class="key">
							<?php echo JText::_('OSM_ADMIN_EMAIL_SUBJECT'); ?>
						</td>
						<td>
							<input type="text" name="admin_email_subject" class="inputbox" value="<?php echo $this->config->admin_email_subject; ?>" size="50" />
						</td>
						<td>
							<strong><?php echo JText::_('OSM_AVAILABLE_TAGS'); ?> : [PLAN_TITLE]</strong>
						</td>
					</tr>
					<tr>
						<td class="key">
							<?php echo JText::_('OSM_ADMIN_EMAIL_BODY'); ?>
						</td>
						<td>
							<?php echo $editor->display( 'admin_email_body',  $this->config->admin_email_body , '100%', '250', '75', '8' ) ;?>					
						</td>
						<td>
							<strong><?php echo JText::_('OSM_AVAILABLE_TAGS'); ?> :[SUBSCRIPTION_DETAIL], [PLAN_TITLE], [FIRST_NAME], [LAST_NAME], [ORGANIZATION], [ADDRESS], [ADDRESS2], [CITY], [STATE], [ZIP], [COUNTRY], [PHONE], [FAX], [EMAIL], [COMMENT], [AMOUNT], [TRANSACTION_ID], [PAYMENT_METHOD]</strong>
						</td>
					</tr>
					<tr>
						<td class="key">
							<?php echo JText::_('User email subject'); ?>
						</td>
						<td>					
							<input type="text" name="user_email_subject" class="inputbox" value="<?php echo $this->config->user_email_subject; ?>" size="50" />
						</td>
						<td>
							<strong><?php echo JText::_('OSM_AVAILABLE_TAGS'); ?> : [PLAN_TITLE]</strong>
						</td>
					</tr>
					<tr>
						<td class="key">
							<?php echo JText::_('OSM_USER_EMAIL_BODY'); ?>
						</td>
						<td>
							<?php echo $editor->display( 'user_email_body',  $this->config->user_email_body , '100%', '250', '75', '8' ) ;?>					
						</td>
						<td>
							<strong><?php echo JText::_('OSM_AVAILABLE_TAGS'); ?> :[SUBSCRIPTION_DETAIL], [PLAN_TITLE], [FIRST_NAME], [LAST_NAME], [ORGANIZATION], [ADDRESS], [ADDRESS2], [CITY], [STATE], [ZIP], [COUNTRY], [PHONE], [FAX], [EMAIL], [COMMENT], [AMOUNT], [TRANSACTION_ID], [PAYMENT_METHOD]</strong>
						</td>
					</tr>
					<tr>
						<td class="key">
							<?php echo JText::_('OSM_USER_EMAIL_BODY_OFFLINE_PAYMENT'); ?>
						</td>
						<td>
							<?php echo $editor->display( 'user_email_body_offline',  $this->config->user_email_body_offline , '100%', '250', '75', '8' ) ;?>					
						</td>
						<td>
							<strong><?php echo JText::_('OSM_AVAILABLE_TAGS'); ?> :[SUBSCRIPTION_DETAIL], [PLAN_TITLE], [FIRST_NAME], [LAST_NAME], [ORGANIZATION], [ADDRESS], [ADDRESS2], [CITY], [STATE], [ZIP], [COUNTRY], [PHONE], [FAX], [EMAIL], [COMMENT], [AMOUNT], [TRANSACTION_ID], [PAYMENT_METHOD]</strong>
						</td>
					</tr>		
					<tr>
						<td class="key">
							<?php echo JText::_('OSM_SUBSCRIPTION_APPROVED_EMAIL_SUBJECT'); ?>
						</td>
						<td>
							<input type="text" name="subscription_approved_email_subject" class="inputbox" value="<?php echo $this->config->subscription_approved_email_subject; ?>" size="50" />
						</td>
						<td>
							<strong><?php echo JText::_('OSM_AVAILABLE_TAGS'); ?> : [PLAN_TITLE]</strong>
						</td>
					</tr>
					<tr>
						<td class="key">
							<?php echo JText::_('OSM_SUBSCRIPTION_APPROVED_EMAIL_BODY'); ?>
						</td>
						<td>
							<?php echo $editor->display( 'subscription_approved_email_body',  $this->config->subscription_approved_email_body , '100%', '250', '75', '8' ) ;?>					
						</td>
						<td>
							<strong>Available Tags :[PAYMENT_DETAIL], [FORM_TITLE], [FIRST_NAME], [LAST_NAME], [ORGANIZATION], [ADDRESS], [ADDRESS2], [CITY], [STATE], [CITY], [ZIP], [COUNTRY], [PHONE], [FAX], [EMAIL], [COMMENT], [AMOUNT]</strong>
						</td>
					</tr>						
					<tr>
						<td class="key">
							<?php echo JText::_('OSM_SUBSCRIPTION_FORM_MESSAGE'); ?>														
						</td>
						<td>			
							<?php echo $editor->display( 'subscription_form_msg',  $this->config->subscription_form_msg , '100%', '250', '75', '8' ) ;?>							
						</td>
						<td>
							<strong><?php echo JText::_('OSM_SUBSCRIPTION_FORM_MESSAGE_EXPLAIN'); ?></strong>
						</td>
					</tr>									
					<tr>
						<td class="key">
							<?php echo JText::_('OSM_SUBSCRIPTION_CONFIRMATION_FORM_MESSAGE'); ?>												
						</td>
						<td>
							<?php echo $editor->display( 'subscription_confirmation_message',  $this->config->subscription_confirmation_message , '100%', '250', '75', '8' ) ;?>					
						</td>
						<td>
							<?php echo JText::_('OSM_SUBSCRIPTION_CONFIRMATION_FORM_MESSAGE_EXPLAIN'); ?>
						</td>
					</tr>															
					<tr>
						<td class="key">
							<?php echo JText::_('OSM_THANK_MESSAGE'); ?>					
						</td>
						<td>			
							<?php echo $editor->display( 'thanks_message',  $this->config->thanks_message , '100%', '250', '75', '8' ) ;?>							
						</td>
						<td>
							<?php echo JText::_('OSM_THANK_MESSAGE_EXPLAIN'); ?>
						</td>
					</tr>								
					<tr>
						<td class="key">
							<?php echo JText::_('OSM_THANK_MESSAGE_OFFLINE'); ?>					
						</td>
						<td>			
							<?php echo $editor->display( 'thanks_message_offline',  $this->config->thanks_message_offline , '100%', '250', '75', '8' ) ;?>							
						</td>
						<td>
							<?php echo JText::_('OSM_THANK_MESSAGE_OFFLINE_EXPLAIN'); ?>
						</td>
					</tr>
					<tr>
						<td class="key">
							<?php echo JText::_('OSM_PAYMENT_CANCEL_MESSAGE'); ?>					
						</td>
						<td>
							<?php echo $editor->display( 'cancel_message',  $this->config->cancel_message , '100%', '250', '75', '8' ) ;?>					
						</td>
						<td>
							<?php echo JText::_('OSM_PAYMENT_CANCEL_MESSAGE_EXPLAIN'); ?>
						</td>
					</tr>
					<tr>
						<td class="key">
							<?php echo JText::_('OSM_PAYMENT_FAILURE_MESSAGE'); ?>					
						</td>
						<td>
							<?php echo $editor->display( 'failure_message',  $this->config->failure_message , '100%', '250', '75', '8' ) ;?>					
						</td>
						<td>
							<?php echo JText::_('OSM_PAYMENT_FAILURE_MESSAGE_EXPLAIN'); ?>
						</td>
					</tr>
				</table>
			</div>
			<div class="tab-pane" id="subscription-renew-page">
				<table class="admintable adminform" style="width:100%;">
					<tr>
						<td class="key">
							<?php echo JText::_('OSM_SUBSCRIPTION_RENEW_FORM_MESSAGE'); ?>														
						</td>
						<td>			
							<?php echo $editor->display( 'subscription_renew_form_msg',  $this->config->subscription_renew_form_msg , '100%', '250', '75', '8' ) ;?>							
						</td>
						<td>
							<strong><?php echo JText::_('OSM_SUBSCRIPTION_RENEW_FORM_MESSAGE_EXPLAIN'); ?></strong>
						</td>
					</tr>			
					<tr>
						<td class="key">
							<?php echo JText::_('OSM_SUBSCRIPTION_RENEW_CONFIRMATION_FORM_MESSAGE'); ?>												
						</td>
						<td>
							<?php echo $editor->display( 'subscription_renew_confirmation_message',  $this->config->subscription_renew_confirmation_message , '100%', '250', '75', '8' ) ;?>					
						</td>
						<td>
							<?php echo JText::_('OSM_SUBSCRIPTION_RENEW_CONFIRMATION_FORM_MESSAGE_EXPLAIN'); ?>
						</td>
					</tr>								
					<tr>
						<td class="key">
							<?php echo JText::_('OSM_NENEW_ADMIN_EMAIL_SUBJECT'); ?>
						</td>
						<td>
							<input type="text" name="admin_renw_email_subject" class="inputbox" value="<?php echo $this->config->admin_renw_email_subject; ?>" size="50" />
						</td>
						<td>
							<strong><?php echo JText::_('OSM_AVAILABLE_TAGS'); ?> : [PLAN_TITLE]</strong>
						</td>
					</tr>
					<tr>
						<td class="key">
							<?php echo JText::_('OSM_RENEW_ADMIN_EMAIL_BODY'); ?>
						</td>
						<td>
							<?php echo $editor->display( 'admin_renew_email_body',  $this->config->admin_renew_email_body , '100%', '250', '75', '8' ) ;?>					
						</td>
						<td>
							<strong><?php echo JText::_('OSM_AVAILABLE_TAGS'); ?> :[SUBSCRIPTION_DETAIL], [PLAN_TITLE], [FIRST_NAME], [LAST_NAME], [ORGANIZATION], [ADDRESS], [ADDRESS2], [CITY], [STATE], [ZIP], [COUNTRY], [PHONE], [FAX], [EMAIL], [COMMENT], [AMOUNT], [TRANSACTION_ID], [PAYMENT_METHOD]</strong>
						</td>
					</tr>
					<tr>
						<td class="key">
							<?php echo JText::_('OSM_RENEW_USER_EMAIL_SUBJECT'); ?>
						</td>
						<td>					
							<input type="text" name="user_renew_email_subject" class="inputbox" value="<?php echo $this->config->user_email_subject; ?>" size="50" />
						</td>
						<td>
							<strong><?php echo JText::_('OSM_AVAILABLE_TAGS'); ?> : [PLAN_TITLE]</strong>
						</td>
					</tr>
					<tr>
						<td class="key">
							<?php echo JText::_('OSM_RENEW_USER_EMAIL_BODY'); ?>
						</td>
						<td>
							<?php echo $editor->display( 'user_renew_email_body',  $this->config->user_renew_email_body , '100%', '250', '75', '8' ) ;?>					
						</td>
						<td>
							<strong><?php echo JText::_('OSM_AVAILABLE_TAGS'); ?> :[SUBSCRIPTION_DETAIL], [PLAN_TITLE], [FIRST_NAME], [LAST_NAME], [ORGANIZATION], [ADDRESS], [ADDRESS2], [CITY], [STATE], [ZIP], [COUNTRY], [PHONE], [FAX], [EMAIL], [COMMENT], [AMOUNT], [TRANSACTION_ID], [PAYMENT_METHOD]</strong>
						</td>
					</tr>	
					<tr>
						<td class="key">
							<?php echo JText::_('OSM_RENEW_THANK_MESSAGE'); ?>					
						</td>
						<td>			
							<?php echo $editor->display( 'renew_thanks_message',  $this->config->renew_thanks_message , '100%', '250', '75', '8' ) ;?>							
						</td>
						<td>
							<?php echo JText::_('OSM_RENEW_THANK_MESSAGE_EXPLAIN'); ?>
						</td>
					</tr>																																														
				</table>
			</div>
			<div class="tab-pane" id="subscription-upgrade-page">
				<table class="admintable adminform" style="width:100%;">						
					<tr>
						<td class="key">
							<?php echo JText::_('OSM_SUBSCRIPTION_UPGRADE_FORM_MESSAGE'); ?>														
						</td>
						<td>			
							<?php echo $editor->display( 'subscription_upgrade_form_msg',  $this->config->subscription_upgrade_form_msg , '100%', '250', '75', '8' ) ;?>							
						</td>
						<td>
							<strong><?php echo JText::_('OSM_SUBSCRIPTION_UPGRADE_FORM_MESSAGE_EXPLAIN'); ?></strong>
						</td>
					</tr>	
					<tr>
						<td class="key">
							<?php echo JText::_('OSM_SUBSCRIPTION_UPGRADE_CONFIRMATION_FORM_MESSAGE'); ?>												
						</td>
						<td>
							<?php echo $editor->display( 'subscription_upgrade_confirmation_message',  $this->config->subscription_upgrade_confirmation_message , '100%', '250', '75', '8' ) ;?>					
						</td>
						<td>
							<?php echo JText::_('OSM_SUBSCRIPTION_UPGRADE_CONFIRMATION_FORM_MESSAGE_EXPLAIN'); ?>
						</td>
					</tr>								
					<tr>
						<td class="key">
							<?php echo JText::_('OSM_UPGRADE_ADMIN_EMAIL_SUBJECT'); ?>
						</td>
						<td>
							<input type="text" name="admin_upgrade_email_subject" class="inputbox" value="<?php echo $this->config->admin_upgrade_email_subject; ?>" size="50" />
						</td>
						<td>
							<strong><?php echo JText::_('OSM_AVAILABLE_TAGS'); ?> : [PLAN_TITLE], [TO_PLAN_TITLE]</strong>
						</td>
					</tr>
					<tr>
						<td class="key">
							<?php echo JText::_('OSM_UPGRADE_ADMIN_EMAIL_BODY'); ?>
						</td>
						<td>
							<?php echo $editor->display( 'admin_upgrade_email_body',  $this->config->admin_upgrade_email_body , '100%', '250', '75', '8' ) ;?>					
						</td>
						<td>
							<strong><?php echo JText::_('OSM_AVAILABLE_TAGS'); ?> :[SUBSCRIPTION_DETAIL], [PLAN_TITLE], [FIRST_NAME], [LAST_NAME], [ORGANIZATION], [ADDRESS], [ADDRESS2], [CITY], [STATE], [ZIP], [COUNTRY], [PHONE], [FAX], [EMAIL], [COMMENT], [AMOUNT], [TRANSACTION_ID], [PAYMENT_METHOD]</strong>
						</td>
					</tr>
					<tr>
						<td class="key">
							<?php echo JText::_('OSM_UPGRADE_USER_EMAIL_SUBJECT'); ?>
						</td>
						<td>					
							<input type="text" name="user_upgrade_email_subject" class="inputbox" value="<?php echo $this->config->user_upgrade_email_subject; ?>" size="50" />
						</td>
						<td>
							<strong><?php echo JText::_('OSM_AVAILABLE_TAGS'); ?> : [PLAN_TITLE], [TO_PLAN_TITLE]</strong>
						</td>
					</tr>
					<tr>
						<td class="key">
							<?php echo JText::_('OSM_UPGRADE_USER_EMAIL_BODY'); ?>
						</td>
						<td>
							<?php echo $editor->display( 'user_upgrade_email_body',  $this->config->user_upgrade_email_body , '100%', '250', '75', '8' ) ;?>					
						</td>
						<td>
							<strong><?php echo JText::_('OSM_AVAILABLE_TAGS'); ?> :[SUBSCRIPTION_DETAIL], [PLAN_TITLE], [FIRST_NAME], [LAST_NAME], [ORGANIZATION], [ADDRESS], [ADDRESS2], [CITY], [STATE], [ZIP], [COUNTRY], [PHONE], [FAX], [EMAIL], [COMMENT], [AMOUNT], [TRANSACTION_ID], [PAYMENT_METHOD]</strong>
						</td>
					</tr>	
					<tr>
						<td class="key">
							<?php echo JText::_('OSM_UPGRADE_THANK_MESSAGE'); ?>					
						</td>
						<td>			
							<?php echo $editor->display( 'upgrade_thanks_message',  $this->config->upgrade_thanks_message , '100%', '250', '75', '8' ) ;?>							
						</td>
						<td>
							<?php echo JText::_('OSM_UPGRADE_THANK_MESSAGE_EXPLAIN'); ?>
						</td>
					</tr>																																													
				</table>
			</div>
			<div class="tab-pane" id="subscription-reminder-page">
				<table class="admintable adminform" style="width:100%;">												
					<tr>
						<td class="key">
							<?php echo JText::_('OSM_FIRST_REMINDER_EMAIL_SUBJECT'); ?>
						</td>
						<td>
							<input type="text" name="first_reminder_email_subject" class="inputbox" value="<?php echo $this->config->first_reminder_email_subject; ?>" size="50" />
						</td>
						<td>
							<strong><?php echo JText::_('OSM_AVAILABLE_TAGS'); ?> : [PLAN_TITLE], [NUMBER_DAYS]</strong>
						</td>
					</tr>
					<tr>
						<td class="key">
							<?php echo JText::_('OSM_FIRST_REMINDER_EMAIL_BODY'); ?>
						</td>
						<td>
							<?php echo $editor->display( 'first_reminder_email_body',  $this->config->first_reminder_email_body , '100%', '250', '75', '8' ) ;?>					
						</td>
						<td>
							<strong><?php echo JText::_('OSM_AVAILABLE_TAGS'); ?> [PLAN_TITLE], [FIRST_NAME], [LAST_NAME], [NUMBER_DAYS], [EXPIRE_DATE]</strong>
						</td>
					</tr>
					<tr>
						<td class="key">
							<?php echo JText::_('OSM_SECOND_REMINDER_EMAIL_SUBJECT'); ?>
						</td>
						<td>
							<input type="text" name="second_reminder_email_subject" class="inputbox" value="<?php echo $this->config->second_reminder_email_subject; ?>" size="50" />
						</td>
						<td>
							<strong><?php echo JText::_('OSM_AVAILABLE_TAGS'); ?> : [PLAN_TITLE], [NUMBER_DAYS]</strong>
						</td>
					</tr>
					<tr>
						<td class="key">
							<?php echo JText::_('OSM_SECOND_REMINDER_EMAIL_BODY'); ?>
						</td>
						<td>
							<?php echo $editor->display( 'second_reminder_email_body',  $this->config->second_reminder_email_body , '100%', '250', '75', '8' ) ;?>					
						</td>
						<td>
							<strong><?php echo JText::_('OSM_AVAILABLE_TAGS'); ?> [PLAN_TITLE], [FIRST_NAME], [LAST_NAME], [NUMBER_DAYS], [EXPIRE_DATE]</strong>
						</td>
					</tr>																																								
				</table>
			</div>
		</div>	
	</div>									
	<input type="hidden" name="option" value="com_osmembership" />	
	<input type="hidden" name="task" value="" />
	<div class="clearfix"></div>	
</form>