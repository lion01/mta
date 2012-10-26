<?php
$user = JFactory::getUser();
$db = JFactory::getDBO();

$today = date('Y-m-d');
// Personal
$date = isset($_GET['personal-date']) ? date('Y-m-d', strtotime($_GET['personal-date'])) : date('Y-m-d');

$query = 'SELECT SUM(total_commission) as total_commission FROM #__travel_sales WHERE status = 2 AND DATE_FORMAT(order_date, "%Y-%m") = "'.date('Y-m', strtotime($date)).'"';

$db->setQuery($query);
$rows = $db->loadObjectList();

$total_commission = count($rows) == 1 ? $rows[0]->total_commission : 0.00;

$query = 'SELECT SUM(amount) as total_paid FROM #__travel_commissions WHERE DATE_FORMAT(payment_date, "%Y-%m") = "'.date('Y-m', strtotime($date)).'"';

$db->setQuery($query);
$rows = $db->loadObjectList();

$total_paid = count($rows) == 1 ? $rows[0]->total_paid : 0.00;

$query = 'SELECT * FROM #__travel_sales WHERE DATE_FORMAT(order_date, "%Y-%m") = "'.date('Y-m', strtotime($date)).'" AND user_id = '.$user->get('id').' AND status = 2';
$db->setQuery($query);
$sales = $db->loadObjectList();
// End of personal info
// Group commission
$query = 'SELECT u.id AS id, u.name AS name, a.expired_date AS expired_date FROM #__travel_agents a INNER JOIN #__users u ON a.user_id = u.id WHERE parent = '.$user->get('id');
$db->setQuery($query);
$rows = $db->loadObjectList();

$downlines = array();
foreach ($rows as $row) {
    $downlines[$row->id] = array(
        'name' => $row->name,
        'expired_date' => $row->expired_date,
        'unit' => 0,
    );
}

if ( ! empty($downlines)) {
    $query = 'SELECT SUM(total_unit) AS total_unit, user_id FROM #__travel_sales WHERE DATE_FORMAT(order_date, "%Y-%m") = "'.date('Y-m', strtotime($date)).'" AND user_id IN ('.implode(',', array_keys($downlines)).') GROUP BY user_id';
    $db->setQuery($query);
    $rows = $db->loadObjectList();

    foreach ($rows as $row) {
        if (isset($downlines[$row->user_id])) {
            $downlines[$row->user_id]['unit'] = $row->total_unit;
        }
    }
}

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

    jQuery(function() {
        jQuery('#personal-link').click(function() {
            jQuery('.group-content').hide();
            jQuery('#personal').fadeIn();
            return false;
        })

        jQuery('#group-link').click(function() {
            jQuery('.group-content').hide();
            jQuery('#group').fadeIn();
            return false;
        })

        jQuery('#yearly-link').click(function() {
            jQuery('.group-content').hide();
            jQuery('#yearly').fadeIn();
            return false;
        })
    });
</script>
<div>
    <a id="personal-link" href="#">Personal Commission</a> | <a id="group-link" href="#">Group Commission</a> | <a id="yearly-link" href="#">Yearly Incentive</a>

    <div id="personal" class="group-content">
        <div class="filter">
            <form method="GET">
                <label for="id_date">Month</label> : <input type="text" name="personal-date" id="id_date" />
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
                            <td><?php echo date('d-m-Y', strtotime($sale->order_date)); ?></td>
                            <td><?php echo $sale->total_amount; ?></td>
                            <td><?php echo $sale->total_commission; ?></td>
                        </tr>
                    <?php endforeach ?>
                <?php endif ?>
            </tbody>
        </table>
    </div>
    <div id="group" class="group-content">
        <table cellpadding="0" cellspacing="0" width="100%">
            <thead>
                <tr>
                    <th>Agent Name</th>
                    <th>Unit</th>
                </tr>
            </thead>
            <tbody>
                <?php if (empty($downlines)): ?>
                    <tr>
                        <td colspan="2" align="center">No agents was found</td>
                    </tr>
                <?php else: ?>
                    <?php foreach ($downlines as $user_id => $downline): ?>
                        <tr>
                            <td><?php echo $downline['name']; ?></td>
                            <td><?php echo $downline['unit']; ?></td>
                        </tr>
                    <?php endforeach ?>
                <?php endif ?>
            </tbody>
        </table>
    </div>
    <div id="yearly" class="group-content">
    </div>
</div>
