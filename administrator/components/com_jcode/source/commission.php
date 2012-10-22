<?php
$user = JFactory::getUser();
$db = JFactory::getDBO();

$date = isset($_GET['date']) ? date('Y-m-d', strtotime($_GET['date'])) : date('Y-m-d');

$query = 'SELECT SUM(total_commission) as total_commission FROM #__travel_sales WHERE completed = 1 AND DATE_FORMAT(completion_date, "%Y-%m") = "'.date('Y-m', strtotime($date)).'"';

$db->setQuery($query);
$rows = $db->loadObjectList();

$total_commission = count($rows) == 1 ? $rows[0]->total_commission : 0.00;

$query = 'SELECT SUM(total_paid) as total_paid FROM #__travel_withdraws WHERE DATE_FORMAT(creation_date, "%Y-%m") = "'.date('Y-m', strtotime($date)).'"';

$db->setQuery($query);
$rows = $db->loadObjectList();

$total_paid = count($rows) == 1 ? $rows[0]->total_paid : 0.00;

$query = 'SELECT * FROM #__travel_sales WHERE DATE_FORMAT(creation_date, "%Y-%m") = "'.date('Y-m', strtotime($date)).'" AND user_id = '.$user->get('id').' AND completed = 1';
$db->setQuery($query);
$sales = $db->loadObjectList();

plgSystemDatePicker::calendarJs();
?>
<style>
table tr th,
table tr td {
    border: 1px solid #ccc;
}

.filter {
    margin: 12px 0;
}

.currency {
    float: right;
}

.summary {
    margin-bottom: 12px;
}
</style>

<script type="text/javascript">
    window.addEvent('domready', function() {
        picker = new Picker.Date($$('#id_date'), {
            pickOnly: 'months',
            pickerClass: 'datepicker_dashboard',
            format: '%B, %Y',
            canAlwaysGoUp: false
        });
        var date = Date.parse('<?php echo $date; ?>');
        picker.select(date);
    });
</script>
<div>
    <a href="#">Personal Commission</a> | <a href="#">Group Commission</a>

    <div class="filter">
        <form method="GET">
            <label for="id_date">Month</label> : <input type="text" name="date" id="id_date" />
            <button>View</button>
        </form>
    </div>
    <div class="summary">
        <div>
            <b>Current Month Total Commission: </b><span class="currency">RM<?php echo number_format($total_commission, 2); ?></span>
        </div>
        <div>
            <b>Total Commission Cashout: </b><span class="currency">RM<?php echo number_format($total_paid, 2); ?></span>
        </div>
        <div>
            <b>Balance: </b><span class="currency">RM<?php echo number_format($total_commission - $total_paid, 2); ?></span>
        </div>
    </div>

    <table cellpadding="0" cellspacing="0" width="100%">
        <thead>
            <tr>
                <th>Order Date</th>
                <th>Sales</th>
                <th>Commission</th>
            </tr>
        </thead>
        <tbody>
            <?php if (empty($sales)): ?>
                <tr>
                    <td colspan="3" align="center">No records was found</td>
                </tr>
            <?php else: ?>
                <?php foreach ($sales as $sale): ?>
                    <tr>
                        <td><?php echo $sale->completion_date; ?></td>
                        <td><?php echo $sale->total_amount; ?></td>
                        <td><?php echo $sale->total_commission; ?></td>
                    </tr>
                <?php endforeach ?>
            <?php endif ?>
        </tbody>
    </table>
</div>
