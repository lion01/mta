<?php
/**
 * @package		Joomla.Site
 * @copyright	Copyright (C) 2005 - 2012 Open Source Matters, Inc. All rights reserved.
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;
require_once('lib/gantry/gantry.php');
gantry_import('core.gantryfeature');

$app = JFactory::getApplication();
global $gpath;
$gpath = $this->baseurl."/templates/".$this->template;
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="<?php echo $this->language; ?>" lang="<?php echo $this->language; ?>" dir="<?php echo $this->direction; ?>">
<head>
	<jdoc:include type="head" />

	<link rel="stylesheet" href="<?php echo $gpath; ?>/css/template.css" type="text/css" />
	<link rel="stylesheet" href="<?php echo $gpath; ?>/css/framework-reset.css" type="text/css" />
	<link rel="stylesheet" href="<?php echo $gpath; ?>/css/style1.css" type="text/css" />
	<link rel="stylesheet" href="<?php echo $gpath; ?>/css/responsive.css" type="text/css" />

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<script src="<?php echo $gpath; ?>/js/jquery.countdown.js"></script>
</head>
<body>
<jdoc:include type="message" />

	<div id="frame" class="outline">
		<div class="frameInner">
			<?php if ($app->getCfg('offline_image')) : ?>
			<img src="<?php echo $app->getCfg('offline_image'); ?>" alt="<?php echo htmlspecialchars($app->getCfg('sitename')); ?>" />
			<?php endif; ?>
			<h1 class="constrSiteName"><?php echo htmlspecialchars($app->getCfg('sitename')); ?></h1>

		<?php if ($app->getCfg('display_offline_message', 1) == 1 && str_replace(' ', '', $app->getCfg('offline_message')) != ''): ?>
			<p><?php echo $app->getCfg('offline_message'); ?></p>
		<?php elseif ($app->getCfg('display_offline_message', 1) == 2 && str_replace(' ', '', JText::_('JOFFLINE_MESSAGE')) != ''): ?>
			<p><?php echo JText::_('JOFFLINE_MESSAGE'); ?></p>
		<?php  endif; ?>

		<?php if($gantry->get('counter-enabled') == TRUE ){ ?>

		<p class="estim"><?php echo JText::_('TPL_CONSTRUCT_ESTIMATED'); ?></p>

			<div id="counter"></div>
			<div class="counter_desc">
				<div class="fleft days"><?php echo JText::_('TPL_CONSTRUCT_DAYS'); ?></div>
				<div class="fleft"><?php echo JText::_('TPL_CONSTRUCT_HOURS'); ?></div>
				<div class="fleft"><?php echo JText::_('TPL_CONSTRUCT_MINUTES'); ?></div>
				<div class="fleft"><?php echo JText::_('TPL_CONSTRUCT_SECONDS'); ?></div>
			</div>

		<?php }; ?>

			<form action="<?php echo JRoute::_('index.php', true); ?>" method="post" id="form-login">
			<fieldset class="input">
				<p id="form-login-username">
					<label for="username"><?php echo JText::_('JGLOBAL_USERNAME') ?></label>
					<input name="username" id="username" type="text" class="inputbox" alt="<?php echo JText::_('JGLOBAL_USERNAME') ?>" size="18" />
				</p>
				<p id="form-login-password">
					<label for="passwd"><?php echo JText::_('JGLOBAL_PASSWORD') ?></label>
					<input type="password" name="password" class="inputbox" size="18" alt="<?php echo JText::_('JGLOBAL_PASSWORD') ?>" id="passwd" />
				</p>
				<p id="form-login-remember">
					<label for="remember"><?php echo JText::_('JGLOBAL_REMEMBER_ME') ?></label>
					<input type="checkbox" name="remember" class="inputbox" value="yes" alt="<?php echo JText::_('JGLOBAL_REMEMBER_ME') ?>" id="remember" />
				</p>
				<input type="submit" name="Submit" class="button" value="<?php echo JText::_('JLOGIN') ?>" />
				<input type="hidden" name="option" value="com_users" />
				<input type="hidden" name="task" value="user.login" />
				<input type="hidden" name="return" value="<?php echo base64_encode(JURI::base()) ?>" />
				<?php echo JHtml::_('form.token'); ?>
			</fieldset>
			</form>

		</div>
	</div>

	<script type="text/javascript">
		jQuery(document).ready(function($) {

	        var _date = new Date();
		        _date.setMonth(<?php echo $gantry->get('counter-launchMonth'); ?>-1);
		        _date.setDate(<?php echo $gantry->get('counter-launchDay'); ?>);
		        _date.setHours(<?php echo $gantry->get('counter-launchHour'); ?>);
		        _date.setMinutes(<?php echo $gantry->get('counter-launchMin'); ?>);
		        _date.setSeconds(<?php echo $gantry->get('counter-launchSec'); ?>);

			$('#counter').countdown({
	            startTime: _date,
	            stepTime: 1,
	            digitImages: 6,
	            digitWidth: 53,
	            digitHeight: 77,
	            image: '<?php echo $gpath; ?>/images/system/digits.png',
	            timerEnd: function(){}
            });
		});
	</script>

</body>
</html>
