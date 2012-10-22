<?php
$user = JFactory::getUser();
$db = JFactory::getDBO();
$apps = JFactory::getApplication();

$id = isset($_GET['id']) ? $_GET['id'] : 0;

$query = 'SELECT * FROM #__travel_sales WHERE user_id = '.$user->get('id').' AND id = '.$id;

$db->setQuery($query);
$rows = $db->loadObjectList();

if (count($rows) == 1) {
    $sale = $rows[0];
} else {
    $apps->redirect('index.php/404');
    return;
}

$query = 'SELECT p.id AS package_id, p.title AS package_name, s.quantity AS quantity, s.price AS price FROM #__travel_saleitems s LEFT JOIN #__travel_packages p ON s.package_id = p.id  WHERE sale_id = '.$id;
$db->setQuery($query);
$items = $db->loadObjectList();
?>

<style>
table#sale tr td,
table#saleitem tr td,
table#saleitem tr th {
    border: 1px solid #ccc;
    padding: 7px 8px;
}

table#saleitem tr th,
table#sale tr td.label {
    min-width: 120px;
    font-weight: bold;
    text-transform: uppercase;
}

table#sale tr td.value {
    padding-right: 28px;
}

.subtitle {
    margin: 12px 0;
    font-size: 16px;
    font-weight: bold;
}
</style>

<h1>Order</h1>
<table cellpadding="0" cellspacing="0" id="sale">
    <tr>
        <td class="label">Order Date: </td class="value">
        <td class="value"><?php echo date('d-m-Y', strtotime($sale->creation_date)); ?></td class="value">
    </tr>
    <?php if ($sale->completed): ?>
        <tr>
            <td class="label">Order Complete: </td class="value">
            <td class="value"><?php echo date('d-m-Y', strtotime($sale->completion_date)); ?></td>
       </tr>
    <?php endif ?>
    <tr>
        <td class="label">Total Amount: </td class="value">
        <td class="value"><?php echo number_format($sale->total_amount, 2); ?></td>
    </tr>
    <tr>
        <td class="label">Payment Made: </td class="value">
        <td class="value"><?php echo number_format($sale->payment, 2); ?></td>
    </tr>
    <tr>
        <td class="label">Balance: </td class="value">
        <td class="value"><?php echo number_format($sale->total_amount - $sale->payment, 2); ?></td>
    </tr>
</table>

<div class="subtitle">Items</div>
<table cellpadding="0" cellspacing="0" width="100%" id="saleitem">
    <thead>
        <tr>
            <th>Package Name</th>
            <th width="80px">Quantity</th>
            <th width="100px">Unit Price</th>
            <th width="100px">Total</th>
        </tr>
    </thead>
    <tbody>
        <?php $total = 0.0; ?>
        <?php foreach ($items as $item): ?>
            <tr>
                <td><a href="/index.php/agent/travel-packages/package/package/<?php echo $item->package_id; ?>"><?php echo $item->package_name; ?></a></td>
                <td><?php echo $item->quantity; ?></td>
                <td align="right"><?php echo number_format($item->price, 2); ?></td>
                <td align="right"><?php echo number_format($item->price * $item->quantity, 2); ?></td>
            </tr>
            <?php $total += $item->price * $item->quantity; ?>
        <?php endforeach ?>
    </tbody>
</table>
