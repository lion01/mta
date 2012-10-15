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
<table width="100%">		<tr>		<td colspan="2" align="left">			<?php echo  JText::_('OSM_FAILURE_MESSAGE'); ?>		</td>	</tr>		<tr>		<td valign="top">			<?php echo JText::_('OSM_REASON'); ?>		</td>		<td>			<p class="info"><?php echo $this->reason; ?></p>		</td>	</tr>
	<tr>
		<td colspan="2">
			<input type="button" class="button btn btn-primary" value="<?php echo JText::_('EB_BACK'); ?>" onclick="window.history.go(-1);" />
		</td>
	</tr>	</table>