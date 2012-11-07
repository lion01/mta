<?php

function calculate_commission($total_unit) {
    if ($total_unit >= 10 && $total_unit < 20) {
        return $total_unit * 20;
    } elseif ($total_unit >= 20 && $total_unit < 25) {
        return $total_unit * 25;
    } elseif ($total_unit >= 25 && $total_unit < 30) {
        return $total_unit * 28;
    } elseif ($total_unit >= 30 && $total_unit < 35) {
        return ($total_unit * 33) + 10;
    } elseif ($total_unit >= 35 && $total_unit < 40) {
        return ($total_unit * 42) + 30;
    } elseif ($total_unit >= 40 && $total_unit < 45) {
        return $total_unit * 50;
    } elseif ($total_unit >= 45 && $total_unit < 50) {
        return ($total_unit * 55) + 25;
    } elseif ($total_unit >= 50) {
        return $total_unit * 60;
    }
}
$user = JFactory::getUser();
$db = JFactory::getDBO();

$today = date('Y-m-d');
// Personal
$personal_date = isset($_GET['personal-date']) ? date('Y-m-d', strtotime($_GET['personal-date'])) : $today;

$query = 'SELECT SUM(c.total_commission) AS total_commission FROM #__travel_commissions c INNER JOIN #__travel_sales s ON s.id = c.sale_id WHERE s.status = 2 AND DATE_FORMAT(s.order_date, "%Y-%m") = "'.date('Y-m', strtotime($personal_date)).'" AND c.user_id = '.$user->get('id');

$db->setQuery($query);
$row = $db->loadObject();

$personal_commission = empty($row->total_commission) ? 0.00 : $row->total_commission;;

$query = 'SELECT SUM(amount) as total_paid FROM #__travel_payouts WHERE DATE_FORMAT(payment_date, "%Y-%m") = "'.date('Y-m', strtotime($personal_date)).'" AND type = 1';

$db->setQuery($query);
$rows = $db->loadObjectList();

$personal_paid = count($rows) == 1 ? $rows[0]->total_paid : 0.00;

$query = 'SELECT * FROM #__travel_commissions c INNER JOIN #__travel_sales s ON s.id = c.sale_id WHERE DATE_FORMAT(s.order_date, "%Y-%m") = "'.date('Y-m', strtotime($personal_date)).'" AND c.user_id = '.$user->get('id').' AND s.status = 2';
$db->setQuery($query);
$sales = $db->loadObjectList();
// End of personal info
// Group commission
$group_date = isset($_GET['group-date']) ? date('Y-m-d', strtotime($_GET['group-date'])) : $today;
$total_unit = 0.0;
$total_commission = 0.0;
$group_commission = 0.0;
$bonus_commission_count = 0;
$bonus_commission_total = 0;
$bonus_commission_total_unit = 0;

$query = 'SELECT u.id AS id, u.name AS name, a.expired_date AS expired_date FROM #__travel_agents a INNER JOIN #__users u ON a.user_id = u.id WHERE parent = '.$user->get('id');
$db->setQuery($query);
$rows = $db->loadObjectList();

$downlines = array();
foreach ($rows as $row) {
    $downlines[$row->id] = array(
        'name' => $row->name,
        'expired_date' => $row->expired_date,
        'unit' => 0,
        'commission' => 0.0,
    );
}

$query = 'SELECT SUM(amount) as total_paid FROM #__travel_payouts WHERE DATE_FORMAT(payment_date, "%Y-%m") = "'.date('Y-m', strtotime($group_date)).'" AND user_id = '.$user->get('id').' ABD type = 2';
$db->setQuery($query);
$rows = $db->loadObjectList();

$group_paid = count($rows) == 1 ? $rows[0]->total_paid : 0.00;

if ( ! empty($downlines)) {
    $query = 'SELECT SUM(total_unit) AS total_unit, user_id FROM #__travel_sales WHERE DATE_FORMAT(order_date, "%Y-%m") = "'.date('Y-m', strtotime($group_date)).'" AND user_id IN ('.implode(',', array_keys($downlines)).') AND status = 2 GROUP BY user_id';
    $db->setQuery($query);
    $rows = $db->loadObjectList();

    foreach ($rows as $row) {
        if (isset($downlines[$row->user_id])) {
            $downlines[$row->user_id]['unit'] = $row->total_unit;
            $downlines[$row->user_id]['commission'] = calculate_commission($row->total_unit);
            $total_unit += $row->total_unit;

            if ($row->total_unit >= 10) {
                $total_commission += $downlines[$row->user_id]['commission'];
            }

            if ($row->total_unit >= 50 && $row->user_id != $user->get('id')) {
                $bonus_commission_count ++;
                //$bonus_commission_total += $downlines[$row->user_id]['commission'];
                $bonus_commission_total_unit += $row->total_unit;
            }
        }
    }
}

if ($bonus_commission_count > 1) {
    $bonus_commission_total = ($bonus_commission_total_unit * 798) * (1 / 100);
}

$query = 'SELECT SUM(total_unit) AS total_unit FROM #__travel_sales WHERE DATE_FORMAT(order_date, "%Y-%m") = "'.date('Y-m', strtotime($group_date)).'" AND user_id = '.$user->get('id').' AND status = 2';
$db->setQuery($query);
$row = $db->loadObject();

$total_unit += $group_personal_unit = $row->total_unit;

$group_commission += calculate_commission($total_unit);
$group_commission -= $total_commission;
// end of group commission
// yearly incentive
$yearly_date = isset($_GET['yearly-date']) ? date('Y-m-d', strtotime($_GET['yearly-date'])) : $today;
$total_unit = 0.0;
$monthly_sales = array(
    '1' => array('personal' => 0, 'group' => 0),
    '2' => array('personal' => 0, 'group' => 0),
    '3' => array('personal' => 0, 'group' => 0),
    '4' => array('personal' => 0, 'group' => 0),
    '5' => array('personal' => 0, 'group' => 0),
    '6' => array('personal' => 0, 'group' => 0),
    '7' => array('personal' => 0, 'group' => 0),
    '8' => array('personal' => 0, 'group' => 0),
    '9' => array('personal' => 0, 'group' => 0),
    '10' => array('personal' => 0, 'group' => 0),
    '11' => array('personal' => 0, 'group' => 0),
    '12' => array('personal' => 0, 'group' => 0),
);


$query = 'SELECT SUM(c.total_unit) AS total_unit, DATE_FORMAT(s.order_date, "%m") AS month FROM #__travel_commissions c INNER JOIN #__travel_sales s ON s.id = c.sale_id WHERE DATE_FORMAT(s.order_date, "%Y") = "'.date('Y', strtotime($yearly_date)).'" AND c.user_id = '.$user->get('id').' AND s.status = 2 GROUP BY DATE_FORMAT(s.order_date, "%m")';
$db->setQuery($query);
$rows = $db->loadObjectList();

foreach ($rows as $row) {
    $monthly_sales[$row->month]['personal'] = $row->total_unit;
    $total_unit += $row->total_unit;
}

if ( ! empty($downlines)) {
    $query = 'SELECT SUM(c.total_unit) AS total_unit, DATE_FORMAT(s.order_date, "%m") AS month FROM #__travel_commissions c INNER JOIN #__travel_sales s ON s.id = c.sale_id WHERE DATE_FORMAT(s.order_date, "%Y") = "'.date('Y', strtotime($yearly_date)).'" AND c.user_id IN ('.implode(',', array_keys($downlines)).') AND s.status = 2 GROUP BY DATE_FORMAT(s.order_date, "%m")';
    $db->setQuery($query);
    $rows = $db->loadObjectList();

    foreach ($rows as $row) {
        $monthly_sales[$row->month]['group'] = $row->total_unit;
        $total_unit += $row->total_unit;
    }
}

$yearly_commission = 0.0;
$total_sales_per_day = floor($total_unit / 264);

if ($total_sales_per_day >= 1) {
    $yearly_commission = $total_sales_per_day * 10000;
}

$query = 'SELECT SUM(amount) as total_paid FROM #__travel_commissions WHERE DATE_FORMAT(payment_date, "%Y") = "'.date('Y', strtotime($yearly_date)).'" AND user_id = '.$user->get('id').' AND type = 3';
$db->setQuery($query);
$rows = $db->loadObjectList();

$yearly_paid = count($rows) == 1 ? $rows[0]->total_paid : 0.00;
// end of yearly incentive

plgSystemDatePicker::calendarJs();
?>
<style>
hr {
    margin: 9px 0;
    border-color: #aaa;
}

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

.group-content {
    display: none;
}

#<?php echo isset($_GET['tab']) ? $_GET['tab'] : 'personal' ?> {
    display: block;
}
</style>

<script type="text/javascript">
    window.addEvent('domready', function() {
        personal_picker = new Picker.Date($$('#id_personal_date'), {
            pickOnly: 'months',
            pickerClass: 'datepicker_dashboard',
            format: '%B, %Y',
            canAlwaysGoUp: false
        });

        group_picker = new Picker.Date($$('#id_group_date'), {
            pickOnly: 'months',
            pickerClass: 'datepicker_dashboard',
            format: '%B, %Y',
            canAlwaysGoUp: false
        });
        yearly_picker = new Picker.Date($$('#id_yearly_date'), {
            pickOnly: 'years',
            pickerClass: 'datepicker_dashboard',
            format: '%Y',
            canAlwaysGoUp: false
        });
        var date = Date.parse('<?php echo $personal_date; ?>');
        personal_picker.select(date);
        date = Date.parse('<?php echo $group_date; ?>');
        group_picker.select(date);
        date = Date.parse('<?php echo $yearly_date; ?>');
        yearly_picker.select(date);

    });

    jQuery(function() {
        jQuery('#personal-link').click(function() {
            jQuery('.group-content').hide();
            jQuery('#personal').fadeIn();
        })

        jQuery('#group-link').click(function() {
            jQuery('.group-content').hide();
            jQuery('#group').fadeIn();
        })

        jQuery('#yearly-link').click(function() {
            jQuery('.group-content').hide();
            jQuery('#yearly').fadeIn();
        })
    });
</script>
<div>
    <a id="personal-link" href="#personal_commission">Personal Commission</a> | <a id="group-link" href="#group_commission">Group Commission</a> | <a id="yearly-link" href="#yearly_incentive">Yearly Incentive</a>

    <div id="personal" class="group-content">
        <h1>Personal Commission</h1>
        <div class="filter">
            <form method="GET">
                <input type="hidden" name="tab" value="personal" />
                <label for="id_personal_date">Month</label> : <input type="text" name="personal-date" id="id_personal_date" />
                <button>View</button>
            </form>
        </div>
        <div class="summary">
            <div>
                <b>Current Month Total Commission: </b><span class="currency">RM<?php echo number_format($personal_commission, 2); ?></span>
            </div>
            <div>
                <b>Total Commission Cashout: </b><span class="currency">RM<?php echo number_format($personal_paid, 2); ?></span>
            </div>
            <div>
                <b>Balance: </b><span class="currency">RM<?php echo number_format($personal_commission - $personal_paid, 2); ?></span>
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
        <h1>Group Commission</h1>
        <div class="filter">
            <form method="GET">
                <input type="hidden" name="tab" value="group" />
                <label for="id_group_date">Month</label> : <input type="text" name="group-date" id="id_group_date" />
                <button>View</button>
            </form>
        </div>
        <div class="summary">
            <div>
                <b>Current Month Total Commission: </b><span class="currency">RM<?php echo number_format($group_commission + $bonus_commission_total, 2); ?></span>
            </div>
            <div>
                <b>Total Commission Cashout: </b><span class="currency">RM<?php echo number_format($group_paid, 2); ?></span>
            </div>
            <div>
                <b>Balance: </b><span class="currency">RM<?php echo number_format(($group_commission + $bonus_commission_total) - $group_paid, 2); ?></span>
            </div>
            <hr />
            <div>
                <b>Personal Unit: </b><span class='currency'><?php echo $group_personal_unit; ?></span>
            </div>
            <div>
                <b>Group Commission: </b><span class='currency'><?php echo $group_commission; ?></span>
            </div>
            <?php if ($bonus_commission_count > 1): ?>
                <hr />
                <div>
                    <b>Bonus Commission: </b><span class='currency'>RM<?php echo number_format($bonus_commission_total, 2); ?></span>
                </div>
            <?php endif ?>
        </div>
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
        <h1>Yearly Incentive</h1>
        <div class="filter">
            <form method="GET">
                <input type="hidden" name="tab" value="yearly" />
                <label for="id_yearly_date">Year</label> : <input type="text" name="yearly-date" id="id_yearly_date" />
                <button>View</button>
            </form>
        </div>
        <div class="summary">
            <div>
                <b>Total Commission: </b><span class="currency">RM<?php echo number_format($yearly_commission, 2); ?></span>
            </div>
            <div>
                <b>Total Commission Cashout: </b><span class="currency">RM<?php echo number_format($yearly_paid, 2); ?></span>
            </div>
            <div>
                <b>Balance: </b><span class="currency">RM<?php echo number_format($yearly_commission - $yearly_paid, 2); ?></span>
            </div>
        </div>
        <table cellpadding="0" cellspacing="0" width="100%">
            <thead>
                <tr>
                    <th>Month</th>
                    <th>Personal Unit</th>
                    <th>Group Unit</th>
                </tr>
            </thead>
            <tbody>
                <?php if (empty($monthly_sales)): ?>
                    <tr>
                        <td colspan="3" align="center">No sales was found</td>
                    </tr>
                <?php else: ?>
                    <?php foreach ($monthly_sales as $month => $data): ?>
                        <tr>
                            <td align="center"><?php echo date('F', mktime(0, 0, 0, $month)); ?></td>
                            <td align="center"><?php echo $data['personal']; ?></td>
                            <td align='center'><?php echo $data['group']; ?></td>
                        </tr>
                    <?php endforeach ?>
                <?php endif ?>
            </tbody>
        </table>
    </div>
</div>
