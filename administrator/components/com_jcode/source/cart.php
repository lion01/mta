<?php defined('_JEXEC') or die('Restricted access');

$cart = JFactory::getSession()->get('cart', array());
$items = isset($cart['items']) ? $cart['items'] : array();

$user = JFactory::getUser();

$db = JFactory::getDBO();
$packages = array();

if (JRequest::getMethod() == 'POST') {
    $packages_id = array_keys($items);

    foreach ($packages_id as $package_id) {
        if (isset($_POST['quantity_id_'.$package_id])) {
            $quantity = intval($_POST['quantity_id_'.$package_id]);

            if ($quantity <= 0) {
                unset($items[$package_id]);
            } else {
                $items[$package_id] = $quantity;
            }
        }
    }

    $cart['items'] = $items;

    JFactory::getSession()->set('cart', $cart);

    if (isset($_POST['update-only']) && $_POST['update-only'] == 1) {
        JFactory::getApplication()->redirect(JURI::current());
    } else {
        JFactory::getApplication()->redirect('/index.php/travel-packages/cart/checkout');
    }
}

if ( ! empty($items)) {
    $query = 'SELECT id, title, price FROM #__travel_packages WHERE id IN ('.implode(',', array_keys($items)).')';
    $db->setQuery($query);
    $rows = $db->loadObjectList();

    foreach ($rows as $row) {
        $packages[$row->id] = array('title' => $row->title, 'price' => $row->price);
    }
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
        jQuery('.update').click(function() {
            var selector = jQuery('input.selector:checked');

            jQuery(selector).each(function() {
                var package_id = jQuery(this).val();
                jQuery('input[name=quantity_id_' + package_id + ']').val('0');
            });

            jQuery('#id_update-only').val('1');
            jQuery('form').submit();

            return false;
        });
    });
</script>

<h1 class='componenetheading'><?php echo JText::_('Shopping Cart'); ?></h1>

<?php if ( ! empty($items)): ?>
<form method='POST'>
    <input type="hidden" id="id_update-only" name="update-only" value="0" />
    <table cellpadding='0' cellspacing='0' width='100%'>
        <thead>
            <tr>
                <th width="20px"></th>
                <th><?php echo JText::_('Package Title'); ?></th>
                <th width="75px"><?php echo JText::_('Quantity'); ?></th>
                <th width="75px"><?php echo JText::_('Subtotal'); ?></th>
            </tr>
        </thead>
        <tbody>
            <?php $total = 0.0; ?>
            <?php foreach ($items as $package_id => $quantity): ?>
                <?php if (isset($packages[$package_id])): ?>
                    <tr>
                        <td align="center"><input type='checkbox' class="selector" name='cid[]' value='<?php echo $package_id; ?>' /></td>
                        <td><?php echo $packages[$package_id]['title']; ?></td>
                        <td align='center'><input type="text" class="integer" name="quantity_id_<?php echo $package_id; ?>" value="<?php echo $quantity; ?>" size="1" /></td>
                        <td align="right"><?php echo number_format($quantity * $packages[$package_id]['price'], 2); ?></td>
                        <?php $total += $quantity * $packages[$package_id]['price']; ?>
                    </tr>
                <?php endif ?>
            <?php endforeach; ?>
            <tr class="lastrow">
                <td colspan="3" align="right">Total</td>
                <td class="summary" align="right"><?php echo number_format($total, 2); ?></td>
            </tr>
        </tbody>
    </table>

    <div id="buttongroup">
        <button class="update" name="update">Delete</button>
        <button class="update" name="update">Update</button>
        <button name="checkout">Checkout</button>
    </div>
</form>

<?php else: ?>
    <center><b>There is no items in your Cart.</b></center>
<?php endif ?>
