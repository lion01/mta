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



$isNew        = ($this->sale->id < 1);
$actionText = $isNew ? JText::_( "TRAVEL_NEW" ) : JText::_( "TRAVEL_EDIT" );
?>

<fieldset class="fieldsform">
    <legend><?php echo $actionText;?></legend>

    <table class="admintable">

        <tr>
            <td align="right" class="key">
                <label for="user_id">
                    <?php echo JText::_( "TRAVEL_FIELD_USER_NAME" ); ?> :
                </label>
            </td>
            <td>
                <?php echo JDom::_('html.form.input.select', array(
                                                'dataKey' => 'user_id',
                                                'dataObject' => $this->sale,
                                                'list' => $this->lists['fk']['user_id'],
                                                'listKey' => 'id',
                                                'labelKey' => 'name',
                                                'nullLabel' => "TRAVEL_JSEARCH_SELECT_USER",
                                                'domClass' => "validate[required]",
                                                'required' => true
                                                ));
                ?>
            </td>
        </tr>
        <tr>
            <td align="right" class="key">
                <label for="payment">
                    <?php echo JText::_( "TRAVEL_FIELD_RECEIVED_PAYMENT" ); ?> :
                </label>
            </td>
            <td>
                <?php echo JDom::_('html.form.input.text', array(
                                                'dataKey' => 'payment',
                                                'dataObject' => $this->sale,
                                                'size' => "15",
                                                'domClass' => "validate[custom[positive_decimal]]",
                                                'validatorHandler' => "positive_decimal",
                                                'validatorRegex' => "/(^\d*\.?\d*[0-9]+\d*$)|(^[0-9]+\d*\.\d*$)/"
                                                ));
                ?>
            </td>
        </tr>
        <tr>
            <td align="right" class="key">
                <label for="total_amount">
                    <?php echo JText::_( "TRAVEL_FIELD_TOTAL_AMOUNT" ); ?> :
                </label>
            </td>
            <td>
                <?php echo JDom::_('html.form.input.text', array(
                                                'dataKey' => 'total_amount',
                                                'dataObject' => $this->sale,
                                                'size' => "15",
                                                'domClass' => "validate[required,custom[decimal]]",
                                                'validatorHandler' => "decimal",
                                                'required' => true,
                                                'validatorRegex' => "/^-?\d*\.?\d*$/"
                                                ));
                ?>
            </td>
        </tr>
        <tr>
            <td align="right" class="key">
                <label for="total_commission">
                    <?php echo JText::_( "TRAVEL_FIELD_TOTAL_COMMISSION" ); ?> :
                </label>
            </td>
            <td>
                <?php echo JDom::_('html.form.input.text', array(
                                                'dataKey' => 'total_commission',
                                                'dataObject' => $this->sale,
                                                'size' => "15",
                                                'domClass' => "validate[required,custom[decimal]]",
                                                'validatorHandler' => "decimal",
                                                'required' => true,
                                                'validatorRegex' => "/^-?\d*\.?\d*$/"
                                                ));
                ?>
            </td>
        </tr>
        <tr>
            <td align="right" class="key">
                <label for="total_unit">
                    <?php echo JText::_( "TRAVEL_FIELD_TOTAL_UNIT" ); ?> :
                </label>
            </td>
            <td>
                <?php echo JDom::_('html.form.input.text', array(
                                                'dataKey' => 'total_unit',
                                                'dataObject' => $this->sale,
                                                'size' => "10",
                                                'domClass' => "validate[required,custom[decimal]]",
                                                'validatorHandler' => "decimal",
                                                'required' => true,
                                                'validatorRegex' => "/^-?\d*\.?\d*$/"
                                                ));
                ?>
            </td>
        </tr>
        <tr>
            <td align="right" class="key">
                <label for="status">
                    <?php echo JText::_( "TRAVEL_FIELD_STATUS" ); ?> :
                </label>
            </td>
            <td>
                <?php echo JDom::_('html.form.input.select', array(
                                                'dataKey' => 'status',
                                                'dataObject' => $this->sale,
                                                'list' => $this->lists['select']['status']->list,
                                                'listKey' => 'value',
                                                'labelKey' => 'text',
                                                'nullLabel' => "",
                                                'domClass' => "validate[required]",
                                                'required' => true
                                                ));
                ?>
            </td>
        </tr>
        <tr>
            <td align="right" class="key">
                <label for="shipping">
                    <?php echo JText::_( "TRAVEL_FIELD_SHIPPING" ); ?> :
                </label>
            </td>
            <td>
                <?php echo JDom::_('html.form.input.select', array(
                                                'dataKey' => 'shipping',
                                                'dataObject' => $this->sale,
                                                'list' => $this->lists['select']['shipping']->list,
                                                'listKey' => 'value',
                                                'labelKey' => 'text',
                                                'nullLabel' => "",
                                                'domClass' => "validate[required]",
                                                'required' => true
                                                ));
                ?>
            </td>
        </tr>
        <tr>
            <td align="right" class="key">
                <label for="payment_reference_code">
                    <?php echo JText::_( "TRAVEL_FIELD_PAYMENT_REFERENCE_CODE" ); ?> :
                </label>
            </td>
            <td>
                <?php echo JDom::_('html.form.input.text', array(
                                                'dataKey' => 'payment_reference_code',
                                                'dataObject' => $this->sale,
                                                'size' => "32"
                                                ));
                ?>
            </td>
        </tr>


    </table>

    <?php if ( ! empty($this->sale_items)): ?>
        <h2>Sale Items</h2>
        <table cellpadding='0' cellspacing='0' width='100%' id='sale_items'>
            <thead>
                <tr>
                    <th>Package</th>
                    <th>Quantity</th>
                    <th>Unit</th>
                    <th>Price</th>
                    <th>Total Price</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($this->sale_items as $item): ?>
                    <tr>
                        <td><?php echo $item->package_name; ?></td>
                        <td><?php echo $item->quantity; ?></td>
                        <td><?php echo $item->unit; ?></td>
                        <td><?php echo $item->price; ?></td>
                        <td><?php echo number_format($item->price * $item->quantity, 2); ?></td>
                    </tr>
                <?php endforeach ?>
            </tbody>
        </table>
    <?php endif ?>

</fieldset>
