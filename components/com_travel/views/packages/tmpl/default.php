<?php
/**
 * default.php
 *
 * @package default
 *
 *                               ______________________________________________
 *                          o O   |                                              |
 *                 (((((  o      <    Generated with Cook Self Service  V1.5.2   |
 *                ( o o )         |______________________________________________|
 * --------oOOO-----(_)-----OOOo---------------------------------- www.j-cook.pro --- +
 *
 * @version  1.0.0
 * @subpackage Packages
 * @copyright Copyright 2012, All rights reserved
 * @license  GNU/GPL
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
 * @author  Edward Khor - www.enfonius.com - edward@enfonius.com
 * @package  Travel
 */
defined( '_JEXEC' ) or die( 'Restricted access' );
?>

<?php
TravelHelper::headerDeclarations();
?>



<?php
JHTML::_( 'behavior.tooltip' );
?>
<?php
JHTML::_( 'behavior.calendar' );
?>


<?php
$this->token = JUtility::getToken();
?>

<h1 class='componentheading'><?php
echo JText::_( "TRAVEL_LAYOUT_PACKAGES" );
?></h1>
<script language="javascript" type="text/javascript">
	function submitbutton(pressbutton)
	{

		return Joomla.submitform(pressbutton);
	}
</script>

<form action="<?php
echo JRoute::_( "index.php" );
?>" method="post" name="adminForm" id="adminForm" class="">

	<input name="_download" type="hidden" id="_download" value=""/>





	<div>
		<?php
echo $this->loadTemplate( 'grid' );
?>
	</div>









	<?php
echo JDom::_( 'html.form.footer', array(
     'values' => array(
         'option' => "com_travel",
        'view' => "packages",
        'layout' => "default",
        'boxchecked' => "0",
        'filter_order' => $this->lists[ 'order' ],
        'filter_order_Dir' => $this->lists[ 'order_Dir' ] 
    ) 
) );
?>


</form>
