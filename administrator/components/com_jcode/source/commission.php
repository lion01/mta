<?php
$user = JFactory::getUser();
$db = JFactory::getDBO();

$query = 'SELECT SUM(total_commission) as total_commission FROM #__travel_sales WHERE completed = 1 AND DATE_FORMAT(completion_date, "%m") = '.date('m');

$db->setQuery($query);
$rows = $db->loadObjectList();

$total_commission = count($rows) == 1 ? $rows[0]->total_commission : 0.00;

$query = 'SELECT SUM(total_paid) as total_paid FROM #__travel_withdraws WHERE DATE_FORMAT(creation_date, "%m") = '.date('m');

$db->setQuery($query);
$rows = $db->loadObjectList();

$total_paid = count($rows) == 1 ? $rows[0]->total_paid : 0.00;

?>

<div>
    <b>Current Month Total Commission: </b>RM<?php echo number_format($total_commission, 2); ?>
</div>
<div>
    <b>Total Commission Payout: </b>RM<?php echo number_format($total_paid, 2); ?> <a href="#">Cashout</a>
</div>
