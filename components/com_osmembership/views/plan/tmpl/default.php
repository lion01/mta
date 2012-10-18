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

JHtml::_('behavior.modal');
$item = $this->item ;
if ($item->thumb)
	$imgSrc = JURI::base().'media/com_osmembership/'.$item->thumb ;
$signUpUrl = JRoute::_('index.php?option=com_osmembership&view=register&id='.$item->id.'&Itemid='.$this->Itemid);

?>
<div id="dm_docs">
	<div class="dm_row">
		<div class="dm_cat">
			<?php
				if ($item->thumb) {
				?>
					<img src="<?php echo $imgSrc; ?>" alt="<?php echo $item->title; ?>" class="dm_thumb-left" />
				<?php
				}
			?>
				<h1 class="dm_title">
					<?php echo $item->title; ?>
				</h1>
				<dl class="dm_props">
					<div class="dm_prop">
						<dt>
							<?php echo JText::_('OSM_DURATION'); ?>:
						</dt>
						<dd>
							<?php echo $item->subscription_length.' '.JText::_('OSM_DAYS') ; ?>
						</dd>
					</div>
					<div class="dm_prop">
						<dt>
							<?php echo JText::_('OSM_PRICE'); ?>:
						</dt>
						<dd>
							<?php echo OSMembershipHelper::formatCurrency($item->price, $this->config); ?>
						</dd>
					</div>
				</dl>
				<div class="dm_description">
					<?php echo $item->description ; ?>
				</div>
			</div>
			<div class="clr"></div>
			<div class="dm_taskbar">
			    <ul>
					<li>
						<a href="javascript:window.history.go(-1)"><?php echo JText::_('OSM_BACK'); ?></a>
					</li>
			    	<li>
						<a href="<?php echo $signUpUrl; ?>"><?php echo JText::_('OSM_SIGNUP'); ?></a>
					</li>
			    </ul>
			    <div class="clr"></div>
			</div>
	</div>
</div>
