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
<h1 class="osm_title"><?php echo JText::_('OSM_SUBSCRIPTION_FAILURE'); ?></h1>
<table width="100%">	
	<tr>
		<td colspan="2">
			<input type="button" class="button btn btn-primary" value="<?php echo JText::_('EB_BACK'); ?>" onclick="window.history.go(-1);" />
		</td>
	</tr>	