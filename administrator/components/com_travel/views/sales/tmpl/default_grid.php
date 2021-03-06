<?php
/**                               ______________________________________________
*                          o O   |                                              |
*                 (((((  o      <    Generated with Cook Self Service  V1.5.2   |
*                ( o o )         |______________________________________________|
* --------oOOO-----(_)-----OOOo---------------------------------- www.j-cook.pro --- +
* @version        1.0.0
* @package        Travel
* @subpackage    Sales
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


?>


<div class="grid_wrapper">
    <table id='grid' class='adminlist' cellpadding="0" cellspacing="0">
    <thead>
        <tr>
            <th width="5">
                <?php echo JText::_( 'NUM' ); ?>
            </th>

            <?php if ($this->access->get('core.edit.own') || $this->access->get('core.edit')): ?>
            <th width="20">
                <input type="checkbox" name="toggle" value="" onclick="checkAll(<?php echo count( $this->items ); ?>);" />
            </th>
            <?php endif; ?>

            <th>
                <?php echo JText::_("TRAVEL_FIELD_USER_NAME"); ?>
            </th>

            <th style="text-align:right">
                <?php echo JText::_("TRAVEL_FIELD_RECEIVED_PAYMENT"); ?>
            </th>

            <th style="text-align:right">
                <?php echo JText::_("TRAVEL_FIELD_TOTAL_AMOUNT"); ?>
            </th>

            <th style="text-align:right">
                <?php echo JText::_("TRAVEL_FIELD_TOTAL_COMMISSION"); ?>
            </th>

            <th>
                <?php echo JText::_("TRAVEL_FIELD_TOTAL_UNIT"); ?>
            </th>

            <th style="text-align:center">
                <?php echo JHTML::_('grid.sort',  "TRAVEL_FIELD_STATUS", 'a.status', $this->state->get('list.direction'), $this->state->get('list.ordering') ); ?>
            </th>

            <th style="text-align:center">
                <?php echo JHTML::_('grid.sort',  "TRAVEL_FIELD_SHIPPING", 'a.shipping', $this->state->get('list.direction'), $this->state->get('list.ordering') ); ?>
            </th>

            <th style="text-align:center">
                <?php echo JHTML::_('grid.sort',  "TRAVEL_FIELD_ORDER_DATE", 'a.order_date', $this->state->get('list.direction'), $this->state->get('list.ordering') ); ?>
            </th>



        </tr>
    </thead>

    <tbody>
    <?php
    $k = 0;

    for ($i=0, $n=count( $this->items ); $i < $n; $i++):

        $row = &$this->items[$i];



        ?>

        <tr class="<?php echo "row$k"; ?>">

            <td class='row_id'>
                <?php echo $this->pagination->getRowOffset( $i ); ?>
            </td>

            <?php if ($this->access->get('core.edit.own') || $this->access->get('core.edit')): ?>
            <td>
                <?php echo JDom::_('html.grid.checkedout', array(
                                            'dataObject' => $row,
                                            'num' => $i
                                                ));
                ?>

            </td>
            <?php endif; ?>

            <td>
                <?php echo JDom::_('html.fly', array(
                                                'dataKey' => '_user_id_name',
                                                'dataObject' => $row,
                                                'href' => "javascript:listItemTask('cb" . $i . "', 'edit')"
                                                ));
                ?>
            </td>

            <td style="text-align:right">
                <?php echo JDom::_('html.fly', array(
                                                'dataKey' => 'payment',
                                                'dataObject' => $row,
                                                ));
                ?>
            </td>

            <td style="text-align:right">
                <?php echo JDom::_('html.fly', array(
                                                'dataKey' => 'total_amount',
                                                'dataObject' => $row
                                                ));
                ?>
            </td>

            <td style="text-align:right">
                <?php echo JDom::_('html.fly', array(
                                                'dataKey' => 'total_commission',
                                                'dataObject' => $row
                                                ));
                ?>
            </td>

            <td>
                <?php echo JDom::_('html.fly', array(
                                                'dataKey' => 'total_unit',
                                                'dataObject' => $row
                                                ));
                ?>
            </td>

            <td style="text-align:center">
                <?php echo JDom::_('html.fly.enum', array(
                                                'dataKey' => 'status',
                                                'dataObject' => $row,
                                                'list' => $this->lists['enum']['sales.status'],
                                                'listKey' => 'value',
                                                'labelKey' => 'text'
                                                ));
                ?>
            </td>

            <td style="text-align:center">
                <?php echo JDom::_('html.fly.enum', array(
                                                'dataKey' => 'shipping',
                                                'dataObject' => $row,
                                                'list' => $this->lists['enum']['sales.shipping'],
                                                'listKey' => 'value',
                                                'labelKey' => 'text'
                                                ));
                ?>
            </td>

            <td style="text-align:center">
                <?php echo JDom::_('html.grid.datetime', array(
                                        'dataKey' => 'order_date',
                                        'dataObject' => $row,
                                        'dateFormat' => "%d-%m-%Y, %H:%I"
                                            ));
                ?>
            </td>



        </tr>
        <?php
        $k = 1 - $k;

    endfor;
    ?>
    </tbody>
    </table>




</div>

<?php echo JDom::_('html.pagination', null, $this->pagination);?>


