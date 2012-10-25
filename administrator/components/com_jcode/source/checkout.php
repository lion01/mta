<?php defined('_JEXEC') or die('Restricted access');

$cart = JFactory::getSession()->get('cart', array());
$user = JFactory::getUser();

$db = JFactory::getDBO();
$packages = array();

if (empty($cart)) {
    JFactory::getApplication()->redirect('/index.php/travel-packages/cart');
}

$packages_id = array_keys($cart);
$query = 'SELECT id, title, price, renewable, commisssion_rate FROM #__travel_packages WHERE id IN ('.implode(',', $packages_id).')';

$db->setQuery($query);
$rows = $db->loadObjectList();

foreach ($rows as $row) {
    $packages[$row->id] = array(
        'title' => $row->title,
        'price' => $row->price,
        'renewable' => $row->renewable,
        'commission' => $row->commisssion_rate,
    );
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
    });
</script>

<h1 class='componenetheading'><?php echo JText::_('Shopping Cart'); ?></h1>
<form method='POST' action="/index.php/travel-packages/cart/checkout/summary">
    <input type="hidden" id="id_update-only" name="update-only" value="0" />
    <table cellpadding='0' cellspacing='0' width='100%'>
        <thead>
            <tr>
                <th><?php echo JText::_('Package Title'); ?></th>
                <?php if ( ! $user->guest): ?>
                    <th width="75px"><?php echo JText::_('Commission (Unit)'); ?></th>
                <?php endif ?>
                <th width="75px"><?php echo JText::_('Quantity'); ?></th>
                <th width="75px"><?php echo JText::_('Subtotal'); ?></th>
                <th width="75px"><?php echo JText::_('Renew Account'); ?></th>
            </tr>
        </thead>
        <tbody>
            <?php $total = 0.0; ?>
            <?php foreach ($cart as $package_id => $quantity): ?>
                <?php if (isset($packages[$package_id])): ?>
                    <tr>
                        <td><?php echo $packages[$package_id]['title']; ?></td>
                        <?php if ( ! $user->guest): ?>
                            <td align="right"><?php echo number_format($packages[$package_id]['commission'], 2); ?></td>
                        <?php endif ?>
                        <td align='center'><?php echo $quantity; ?></td>
                        <td align="right"><?php echo number_format($quantity * $packages[$package_id]['price'], 2); ?></td>
                        <td align="center">
                            <?php if ($packages[$package_id]['renewable']): ?>
                            <input type="radio" class="renewable" name="renewable" value="<?php echo $package_id; ?>" />
                            <?php endif ?>
                        </td>
                        <?php $total += $quantity * $packages[$package_id]['price']; ?>
                    </tr>
                <?php endif ?>
            <?php endforeach; ?>
        </tbody>
    </table>

    <div id="buttongroup">
        <button name="checkout">Continue</button>
    </div>
</form>
