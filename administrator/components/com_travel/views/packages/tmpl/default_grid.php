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


?>


<div class="grid_wrapper">
    <table id='grid' class='adminlist' cellpadding="0" cellspacing="0">
    <thead>
        <tr>
            <th width="5">
                <?php echo JText::_( 'No.' ); ?>
            </th>

            <?php if ($this->access->get('core.edit.own') || $this->access->get('core.edit')): ?>
            <th width="20">
                <input type="checkbox" name="toggle" value="" onclick="checkAll(<?php echo count( $this->items ); ?>);" />
            </th>
            <?php endif; ?>

            <th style="text-align:left">
                <?php echo JHTML::_('grid.sort',  "TRAVEL_FIELD_TITLE", 'a.title', $this->state->get('list.direction'), $this->state->get('list.ordering') ); ?>
            </th>

            <th style="text-align:right">
                <?php echo JText::_("TRAVEL_FIELD_PRICE"); ?>
            </th>

            <th style="text-align:right">
                <?php echo JText::_("TRAVEL_FIELD_COMMISSSION_RATE"); ?>
            </th>

            <th>
                <?php echo JText::_("TRAVEL_FIELD_UNIT"); ?>
            </th>

            <th>
                <?php echo JText::_("TRAVEL_FIELD_RENEWABLE"); ?>
            </th>

            <?php if ($this->access->get('core.edit') || $this->access->get('core.edit.state')): ?>
            <th class="order" style="text-align:center">
                <?php echo JHTML::_('grid.sort',  'Order', 'a.ordering', $this->lists['order_Dir'], $this->lists['order'] ); ?>
                <?php echo JDom::_('html.grid.header.saveorder', array('list' => $this->items));?>
            </th>
            <?php endif; ?>

            <?php if ($this->access->get('core.edit.state') || $this->access->get('core.view.own')): ?>
            <th style="text-align:center">
                <?php echo JText::_("TRAVEL_FIELD_PUBLISHED"); ?>
            </th>
            <?php endif; ?>

            <th style="text-align:left">
                <?php echo JHTML::_('grid.sort',  "TRAVEL_FIELD_CREATION_DATE", 'a.creation_date', $this->state->get('list.direction'), $this->state->get('list.ordering') ); ?>
            </th>

            <th style="text-align:left">
                <?php echo JHTML::_('grid.sort',  "TRAVEL_FIELD_MODIFICATION_DATE", 'a.modification_date', $this->state->get('list.direction'), $this->state->get('list.ordering') ); ?>
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

            <td style="text-align:right">
                <?php echo JDom::_('html.fly', array(
                                                'dataKey' => 'commisssion_rate',
                                                'dataObject' => $row
                                                ));
                ?>
            </td>

            <td>
                <?php echo JDom::_('html.fly', array(
                                                'dataKey' => 'unit',
                                                'dataObject' => $row
                                                ));
                ?>
            </td>

            <td>
                <?php echo JDom::_('html.grid.bool', array(
                                        'dataKey' => 'renewable',
                                        'dataObject' => $row,
                                        'num' => $i
                                            ));
                ?>
            </td>

            <?php if ($this->access->get('core.edit') || $this->access->get('core.edit.state')): ?>
            <td class="order" style="text-align:center">
                <?php echo JDom::_('html.grid.ordering', array(
                                        'dataKey' => 'ordering',
                                        'dataObject' => $row,
                                        'num' => $i,
                                        'ordering' => $this->state->get('list.ordering'),
                                        'direction' => $this->state->get('list.direction'),
                                        'list' => $this->items,
                                        'ctrl' => 'packages',
                                        'pagination' => $this->pagination
                                            ));
                ?>
            </td>
            <?php endif; ?>

            <?php if ($this->access->get('core.edit.state') || $this->access->get('core.view.own')): ?>
            <td style="text-align:center">
                <?php echo JDom::_('html.grid.publish', array(
                                        'dataKey' => 'published',
                                        'dataObject' => $row,
                                        'num' => $i
                                            ));
                ?>
            </td>
            <?php endif; ?>

            <td style="text-align:left">
                <?php echo JDom::_('html.grid.datetime', array(
                                        'dataKey' => 'creation_date',
                                        'dataObject' => $row,
                                        'dateFormat' => "%d-%m-%Y"
                                            ));
                ?>
            </td>

            <td style="text-align:left">
                <?php echo JDom::_('html.grid.datetime', array(
                                        'dataKey' => 'modification_date',
                                        'dataObject' => $row,
                                        'dateFormat' => "%d-%m-%Y"
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


