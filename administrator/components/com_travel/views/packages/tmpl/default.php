<?php
/**                               ______________________________________________
*                          o O   |                                              |
*                 (((((  o      <    Generated with Cook Self Service  V1.5.2   |
*                ( o o )         |______________________________________________|
* --------oOOO-----(_)-----OOOo---------------------------------- www.j-cook.pro --- +
* @version		1.0.0
* @package		Travel
* @subpackage	Packages
* @copyright	Copyright 2012, All rights reserved
* @author		Edward Khor - www.enfonius.com - edward@enfonius.com
* @license		GNU/GPL
*
* /!\  Joomla! is free software.
* This version may have been modified pursuant to the GNU General Public License,
* and as distributed it includes or is derivative of works licensed under the
* GNU General Public License or other free or open source software licenses.
*
*             .oooO  Oooo.     See COPYRIGHT.php for copyright notices and details.
*             (   )  (   )
* -------------\ (----) /----------------------------------------------------------- +
*               \_)  (_/
*/

defined('_JEXEC') or die('Restricted access'); ?>

<?php TravelHelper::headerDeclarations(); ?>


<?php JHTML::_('behavior.tooltip');?>
<?php JHTML::_('behavior.calendar');?>


<?php
	JToolBarHelper::title(JText::_("TRAVEL_LAYOUT_PACKAGES"), 'travel_packages' );
	$this->token = JUtility::getToken();
?>

<script language="javascript" type="text/javascript">
	function submitbutton(pressbutton)
	{
		switch(pressbutton)
		{
			case 'delete':

				var deleteConfirmMessage;
				if (document.adminForm.boxchecked.value > 1)
					deleteConfirmMessage = "<?php echo(addslashes(JText::_("JDOM_ALERT_ASK_BEFORE_REMOVE_MULTIPLE"))); ?>";
				else
					deleteConfirmMessage = "<?php echo(addslashes(JText::_("JDOM_ALERT_ASK_BEFORE_REMOVE"))); ?>";

				if (window.confirm(deleteConfirmMessage))
					return Joomla.submitform(pressbutton);
				else
					return;
				break;

		}

		return Joomla.submitform(pressbutton);
	}
</script>

<form action="<?php echo(JRoute::_("index.php")); ?>" method="post" name="adminForm" id="adminForm" class="">





	<div>
		<?php echo $this->loadTemplate('grid'); ?>
	</div>










	<input name="_download" type="hidden" id="_download" value=""/>

	<?php echo JDom::_('html.form.footer', array(
		'values' => array(
				'option' => "com_travel",
				'view' => "packages",
				'layout' => "default",
				'boxchecked' => "0",
				'filter_order' => $this->lists['order'],
				'filter_order_Dir' => $this->lists['order_Dir']
			)));
	?>

</form>