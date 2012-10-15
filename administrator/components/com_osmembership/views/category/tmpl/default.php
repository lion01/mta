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
if (version_compare(JVERSION, '1.6.0', 'ge')) {
	$param = null ;
} else {
	$param = 0 ;
}
?>
<script language="javascript" type="text/javascript">

	<?php
		if (version_compare(JVERSION, '1.6.0', 'ge')) {
		?>
			Joomla.submitbutton = function(pressbutton)
			{
				var form = document.adminForm;
				if (pressbutton == 'category.cancel') {
					Joomla.submitform(pressbutton, form);
					return;				
				} else {
					//Validate the entered data before submitting
					if (form.title.value == '') {
						alert("<?php echo JText::_('OSM_ENTER_CATEGORY_TITLE'); ?>");
						form.title.focus();
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
				if (pressbutton == 'category.cancel') {
					submitform( pressbutton );
					return;				
				} else {
					if (form.title.value == '') {
						alert("<?php echo JText::_('OSM_ENTER_CATEGORY_TITLE'); ?>");
						form.title.focus();
						return ;
					}
					
					submitform( pressbutton );
				}
			}	
		<?php	
		}	
	?>
	
</script>

<form action="index.php" method="post" name="adminForm" id="adminForm">
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
	<?php echo JHTML::_( 'form.token' ); ?>
	<input type="hidden" name="option" value="com_osmembership" />
	<input type="hidden" name="cid[]" value="<?php echo $this->item->id; ?>" />
	<input type="hidden" name="task" value="" />
</form>