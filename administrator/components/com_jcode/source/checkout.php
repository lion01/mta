<?php defined('_JEXEC') or die('Restricted access');

define('JPATH_ADMIN_TRAVEL', JPATH_COMPONENT_ADMINISTRATOR.'/../com_travel');

require JPATH_COMPONENT.'/../com_users/models/registration.php';
require JPATH_COMPONENT.'/../com_travel/models/sale.php';
require JPATH_COMPONENT.'/../com_travel/models/saleitemsitem.php';
require JPATH_ADMIN_TRAVEL.'/tables/sale.php';
require JPATH_ADMIN_TRAVEL.'/tables/saleitemsitem.php';

$cart = JFactory::getSession()->get('cart', array());
$items = isset($cart['items']) ? $cart['items'] : array();

$registration = new UsersModelRegistration;

$user = JFactory::getUser();

$db = JFactory::getDBO();
$packages = array();

if (empty($cart) || empty($items)) {
    JFactory::getApplication()->redirect('/index.php/travel-packages/cart');
}

$packages_id = array_keys($items);
$query = 'SELECT id, title, price, renewable, commission_rate, unit FROM #__travel_packages WHERE id IN ('.implode(',', $packages_id).')';

$db->setQuery($query);
$rows = $db->loadObjectList();

$shipping = isset($_POST['shipping']) && ($_POST['shipping'] == 1 || $_POST['shipping'] == 2) ? $_POST['shipping'] : 1;
$price = NULL;
$renewable = NULL;

foreach ($rows as $row) {
    $packages[$row->id] = array(
        'unit' => $row->unit,
        'title' => $row->title,
        'price' => $row->price,
        'renewable' => $row->renewable,
        'commission' => $row->commission_rate,
    );

    if ($user->guest) {
        if ($price == NULL || $price < $row->price) {
            $price = $row->price;
            $renewable = $row->id;
        }
    }
}

if (JRequest::getMethod() == 'POST') {
    if (isset($_POST['renewable'])) {
        $cart['renewable'] = $_POST['renewable'];
        $renewable = $cart['renewable'];
    }

    $user_id = $user->get('id');

    $total_commission = 0.0;
    $total_amount = 0.0;
    $total_unit = 0.0;

    foreach ($items as $package_id => $quantity) {
        if (isset($packages[$package_id])) {
            $total_commission += $packages[$package_id]['commission'] * $quantity;
            $total_amount += $packages[$package_id]['price'] * $quantity;
            $total_unit += $packages[$package_id]['unit'] * $quantity;
        }
    }

    if (isset($packages[$renewable])) {
        $total_commission -= $packages[$package_id]['commission'];
    }

    $sale = new TravelModelSale;

    $data = array(
        'id' => NULL,
        'user_id' => $user_id,
        'payment' => 0.0,
        'status' => 1,
        'shipping' => $shipping,
        'total_commission' => $total_commission,
        'total_amount' => $total_amount,
        'total_unit' => $total_unit,
    );

    $sale->save($data);

    foreach ($items as $package_id => $quantity) {

        if ( ! isset($packages[$package_id])) {
            continue;
        }

        $saleitem = new TravelModelSaleitemsitem;

        $data = array(
            'id' => NULL,
            'sale_id' => $sale->id(),
            'package_id' => $package_id,
            'quantity' => $quantity,
            'unit' => $packages[$package_id]['unit'],
            'price' => $packages[$package_id]['price'],
            'commission_rate' => $packages[$package_id]['commission'],
        );

        if ($renewable != NULL && $renewable == $package_id) {
            $data['commission_rate'] = 0.0;
            $date['renewal'] = 1;
            $renewable = NULL;
        }

        $saleitem->save($data);

    }

    JFactory::getSession()->clear('cart');
    JFactory::getApplication()->redirect('/index.php/travel-packages/cart/checkout/confirm');
}
?>

<style>
table tr th,
table tr td,
table tr.lastrow td.summary {
    border: 1px solid #ccc;
    padding: 5px 7px;
}

table tr.lastrow td {
    border: none;
}

input.integer {
    text-align: center;
}

#buttongroup {
    margin-top: 12px;
}

</style>

<script type="text/javascript">
    jQuery(function() {
        jQuery('.renewable').click(function() {
            var previousValue = jQuery(this).attr('previousValue');

            if(previousValue == 'checked') {
                jQuery(this).attr('checked', false);
                jQuery(this).attr('previousValue', false);
            } else {
                jQuery('.renewable').attr('previousValue', false);
                jQuery(this).attr('previousValue', 'checked');
            }
        });

        jQuery('form').submit(function(e) {
            if ( ! confirm('Confirm to checkout your items?')) {
                return false;
            }
        });
    });
</script>

<h1 class='componenetheading'><?php echo JText::_('Checkout'); ?></h1>
<form method='POST' action="/index.php/travel-packages/cart/checkout/summary">
    <?php if ($user->guest): ?>
        <input type="hidden" name="renewable" value="<?php echo $renewable; ?>" />
    <?php endif ?>
    <input type="hidden" id="id_update-only" name="update-only" value="0" />
    <div>
        <label>Shipping</label>:
        <input type="radio" name="shipping" id="pickup" value="1" <?php if ($shipping == 1): ?>checked="checked" <?php endif ?> /><label for="pickup">Pickup</label>
        <input type="radio" name="shipping" id="delivery" value="2" <?php if ($shipping == 2): ?>checked="checked" <?php endif ?>/><label for="delivery">Delivery</label>
    </div>
    <table cellpadding='0' cellspacing='0' width='100%'>
        <thead>
            <tr>
                <th><?php echo JText::_('Package Title'); ?></th>
                <?php if ( ! $user->guest): ?>
                    <th width="75px"><?php echo JText::_('Commission (Unit)'); ?></th>
                <?php endif ?>
                <th width="75px"><?php echo JText::_('Quantity'); ?></th>
                <th width="75px"><?php echo JText::_('Subtotal'); ?></th>
                <?php if ( ! $user->guest): ?>
                    <th width="75px"><?php echo JText::_('Renew Account'); ?></th>
                <?php endif ?>
            </tr>
        </thead>
        <tbody>
            <?php $total = 0.0; ?>
            <?php foreach ($items as $package_id => $quantity): ?>
                <?php if (isset($packages[$package_id])): ?>
                    <tr>
                        <td><?php echo $packages[$package_id]['title']; ?></td>
                        <?php if ( ! $user->guest): ?>
                            <td align="right"><?php echo number_format($packages[$package_id]['commission'], 2); ?></td>
                        <?php endif ?>
                        <td align='center'><?php echo $quantity; ?></td>
                        <td align="right"><?php echo number_format($quantity * $packages[$package_id]['price'], 2); ?></td>
                        <?php if ( ! $user->guest): ?>
                            <td align="center">
                                <?php if ($packages[$package_id]['renewable']): ?>
                                    <input type="radio" class="renewable" name="renewable" value="<?php echo $package_id; ?>" />
                                <?php endif ?>
                            </td>
                        <?php endif ?>
                        <?php $total += $quantity * $packages[$package_id]['price']; ?>
                    </tr>
                <?php endif ?>
            <?php endforeach; ?>
        </tbody>
    </table>

    <?php if ($user->guest): ?>
    <?php endif ?>

    <div id="buttongroup">
        <button name="checkout">Continue</button>
    </div>
</form>
