<?php


/**                               ______________________________________________
*                          o O   |                                              |
*                 (((((  o      <    Generated with Cook Self Service  V1.5.2   |
*                ( o o )         |______________________________________________|
* --------oOOO-----(_)-----OOOo---------------------------------- www.j-cook.pro --- +
* @version        1.0.0
* @package        Travel
* @subpackage    Packages
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

defined('_JEXEC') or die('Restricted access');

$user = JFactory::getUser();

?>





<div class="grid_wrapper">
    <table id='grid' class='adminlist' cellpadding="0" cellspacing="0">
    <thead>
        <tr>
            <th width="20">
                &nbsp;
            </th>

            <th>
                <?php echo JText::_("TRAVEL_FIELD_CODE"); ?>
            </th>

            <th style="text-align:left">
                <?php echo JHTML::_('grid.sort',  "TRAVEL_FIELD_TITLE", 'a.title', $this->state->get('list.direction'), $this->state->get('list.ordering') ); ?>
            </th>

            <th style="text-align:right">
                <?php echo JHTML::_('grid.sort',  "TRAVEL_FIELD_PRICE", 'a.price', $this->state->get('list.direction'), $this->state->get('list.ordering') ); ?>
            </th>

            <?php if ( ! $user->guest): ?>
                <th style="text-align:right">
                    <?php echo JHTML::_('grid.sort',  "TRAVEL_FIELD_COMISSION", 'a.commission_rate', $this->state->get('list.direction'), $this->state->get('list.ordering') ); ?>
                </th>

                <th style="text-align:center">
                    <?php echo JText::_("TRAVEL_FIELD_UNIT"); ?>
                </th>
            <?php endif ?>



        </tr>
    </thead>

    <tbody>
    <?php
    $k = 0;

    for ($i=0, $n=count( $this->items ); $i < $n; $i++):

        $row = &$this->items[$i];



        ?>

        <tr class="<?php echo "row$k"; ?>">

            <td align="center">
                <?php echo JDom::_('html.grid.checkedout', array(
                                        'dataObject' => $row,
                                        'num' => $i
                                            ));
                ?>
            </td>

            <td>
                <?php echo JDom::_('html.fly', array(
                                                'dataKey' => 'code',
                                                'dataObject' => $row
                                                ));
                ?>
            </td>

            <td style="text-align:left">
                <?php echo JDom::_('html.fly', array(
                                                'dataKey' => 'title',
                                                'dataObject' => $row,
                                                'route' => array('view' => 'package','layout' => 'package','cid[]' => $row->id)
                                                ));
                ?>
            </td>

            <td style="text-align:right">
                <?php echo JDom::_('html.fly', array(
                                                'dataKey' => 'price',
                                                'dataObject' => $row
                                                ));
                ?>
            </td>

            <?php if ( ! $user->guest): ?>
                <td style="text-align:right">
                    <?php echo JDom::_('html.fly', array(
                                                    'dataKey' => 'commission_rate',
                                                    'dataObject' => $row
                                                    ));
                    ?>
                </td>

                <td style="text-align:center">
                    <?php echo JDom::_('html.fly', array(
                                                    'dataKey' => 'unit',
                                                    'dataObject' => $row
                                                    ));
                    ?>
                </td>
            <?php endif ?>



        </tr>
        <?php
        $k = 1 - $k;

    endfor;
    ?>
    </tbody>
    </table>

    <button name="order">Add to Cart</button>


</div>

<?php echo JDom::_('html.pagination', array(
                                        'pagination' => $this->pagination,
                                        'showLimit' => true,
                                        'showCounter' => true,

                                            ));
?>


