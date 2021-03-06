<?php
/**                               ______________________________________________
*                          o O   |                                              |
*                 (((((  o      <    Generated with Cook Self Service  V1.5.2   |
*                ( o o )         |______________________________________________|
* --------oOOO-----(_)-----OOOo---------------------------------- www.j-cook.pro --- +
* @version        1.0.0
* @package        Travel
* @subpackage    Agents
* @copyright    Copyright 2012, All rights reserved
* @author        Edward Khor - www.enfonius.com - edward@enfonius.com
* @license        GNU/GPL
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





<?php    JToolBarHelper::title(JText::_("TRAVEL_LAYOUT_AGENT"), 'travel_agents' );?>

<script language="javascript" type="text/javascript">
jQuery(document).ready(function(){
    jQuery("#adminForm").validationEngine();

    jQuery('#id_search_user').keyup(function() {
        var value = jQuery(this).val();
        if (jQuery('#user_id option[value=' + value + ']').length > 0) {
            jQuery('#user_id').val(value);
        } else {
            jQuery('#user_id').val(null);
        }
    });

    jQuery('#id_search_parent').keyup(function() {
        var value = jQuery(this).val();
        if (jQuery('#parent option[value=' + value + ']').length > 0) {
            jQuery('#parent').val(value);
        } else {
            jQuery('#parent').val(null);
        }
    });
});

Joomla.submitform = function(pressbutton)
{
    //Unlock the page
    holdForm = false;

    var parts = pressbutton.split('.');

    jQuery("#task").val(pressbutton);
    switch(parts[parts.length-1])
    {
        case 'delete':
        case 'cancel':
            jQuery("#adminForm").validationEngine('detach');
            break;
    }

    jQuery("#adminForm").submit();
}

//Secure the user navigation on the page, in order preserve datas.
var holdForm = true;
window.onbeforeunload = function closeIt(){    if (holdForm) return false;};
</script>

<form action="<?php echo(JRoute::_("index.php")); ?>" method="post" name="adminForm" id="adminForm" class='form-validate' enctype='multipart/form-data'>




    <div>
        <?php echo $this->loadTemplate('form'); ?>
    </div>









    <input name="_download" type="hidden" id="_download" value=""/>

    <?php echo JDom::_('html.form.footer', array(
        'dataObject' => $this->agent,
        'values' => array(
                'option' => "com_travel",
                'view' => "agent",
                'layout' => "agent"
                )));
    ?>

</form>
