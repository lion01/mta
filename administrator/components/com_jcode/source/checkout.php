<?php defined('_JEXEC') or die('Restricted access');

define('JPATH_ADMIN_TRAVEL', JPATH_COMPONENT_ADMINISTRATOR.'/../com_travel');
@define('LN', "\n");

require JPATH_COMPONENT.'/../com_users/models/registration.php';
require JPATH_COMPONENT.'/../com_travel/models/sale.php';
require JPATH_COMPONENT.'/../com_travel/models/saleitem.php';
require JPATH_COMPONENT.'/../com_travel/models/commission.php';
require JPATH_ADMIN_TRAVEL.'/models/agent.php';
require JPATH_ADMIN_TRAVEL.'/tables/sale.php';
require JPATH_ADMIN_TRAVEL.'/tables/agent.php';
require JPATH_ADMIN_TRAVEL.'/tables/saleitem.php';
require JPATH_ADMIN_TRAVEL.'/tables/commission.php';
require JPATH_ADMIN_TRAVEL.'/helpers/helper.php';
require JPATH_ADMIN_TRAVEL.'/helpers/html/validator.php';

$doc = JFactory::getDocument();
$site_url = str_replace("\\", "/", JURI::root(true));

$doc->addScript($site_url.'/media/system/js/core.js');
$doc->addScriptDeclaration("var Moo = document.id;");
$doc->addScript('http://code.jquery.com/jquery.min.js');
$doc->addScript('http://code.jquery.com/ui/1.8.24/jquery-ui.min.js');
$doc->addScript($site_url.'/administrator/components/com_travel/js/jquery.validationEngine.js');
$doc->addStyleSheet($site_url.'administrator/components/com_travel/css/validationEngine.jquery.css');
JHtmlValidator::loadLanguageScript();
$doc->addScriptDeclaration("var $" ." = Moo;");

$bank_choices = array('Maybank', 'CIMB', 'Public Bank', 'RHB', 'Alliance Bank');
$state_choices = array('Kuala Lumpur', 'Johor', 'Kedah', 'Kelantan', 'Melaka', 'Negeri Sembilan', 'Pahang', 'Perak', 'Perlis', 'Penang', 'Sabah', 'Sarawak', 'Selangor', 'Terrengganu', 'Labuan');

$cart = JFactory::getSession()->get('cart', array());
$items = isset($cart['items']) ? $cart['items'] : array();

$user = JFactory::getUser();
$guest = $user->guest;

$db = JFactory::getDBO();
$packages = array();

if (empty($cart) || empty($items)) {
    JFactory::getApplication()->redirect('/index.php/travel-packages/cart');
}

$packages_id = array_keys($items);
$query = 'SELECT id, code, title, price, renewable, commission_rate, unit FROM #__travel_packages WHERE id IN ('.implode(',', $packages_id).')';

$db->setQuery($query);
$rows = $db->loadObjectList();

$shipping = isset($_POST['shipping']) && ($_POST['shipping'] == 1 || $_POST['shipping'] == 2) ? $_POST['shipping'] : 1;
$price = NULL;
$renewable = NULL;

foreach ($rows as $row) {
    $packages[$row->id] = array(
        'unit' => $row->unit,
        'code' => $row->code,
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

if ($user->guest) {
    $form = array(
        'name' => NULL,
        'username' => NULL,
        'password' => NULL,
        'verify_password' => NULL,
        'email' => NULL,
        'confirm_email' => NULL,
        'ic_number' => NULL,
        'bank' => NULL,
        'bank_account_number' => NULL,
        'organization' => NULL,
        'street_address' => NULL,
        'address' => NULL,
        'postcode' => NULL,
        'state' => NULL,
        'city' => NULL,
        'country' => 'Malaysia',
        'contact_phone' => NULL,
        'referrer' => NULL,
    );

    if (JRequest::getMethod() == 'POST') {
        foreach ($form as $field => $value) {
            if (isset($_POST[$field])) {
                $form[$field] = $_POST[$field];
            }
        }
    }

    $errors = array();
}


if (JRequest::getMethod() == 'POST') {
    if (isset($_POST['renewable'])) {
        $cart['renewable'] = $_POST['renewable'];
        $renewable = $cart['renewable'];
    }

    if ($user->guest) {
        $user_id = JFactory::getSession()->get('registered-id');

        if (empty($user_id)) {
            $query = 'SELECT COUNT(*) AS count FROM #__users WHERE username = "'.$form['username'].'"';
            $db->setQuery($query);
            $row = $db->loadObject();

            if ($row->count > 0) {
                $errors['username'] = 'Username is already registered';
            }

            $query = 'SELECT COUNT(*) AS count FROM #__users WHERE email = "'.$form['email'].'"';
            $db->setQuery($query);
            $row = $db->loadObject();

            if ($row->count > 0) {
                $errors['email'] = 'Email is already registered';
            }

            if ( ! empty($form['referrer'])) {
                $query = 'SELECT id FROM #__users WHERE username = "'.$form['referrer'].'"';
                $db->setQuery($query);
                $rows = $db->loadObjectList();

                if (count($rows) == 0) {
                    $errors['referrer'] = 'Referrer not found';
                } else {
                    $form['parent'] = $rows[0]->id;
                    $referrer_id = $form['parent'];
                }
            }

            if (count($form['ic_number']) != 12 || ! is_numeric($form['ic_number'])) {
                $errors['ic_number'] = 'Invalid IC Number. Please enter the IC number with the dash "-"';
            }

            if (empty($errors)) {
                $user = JFactory::getUser(0);

                $form['password2'] = $form['password'];
                $form['sendEmail'] = 1;
                $form['usertype'] = 'Registered';
                $form['block'] = 0;


                if ( ! $user->bind($form)) {
                    JError::raiseWarning('', JText::_($user->getError()));
                    $error = TRUE;
                }

                if ( ! $user->save()) {
                    JError::raiseWarning('', JText::_($user->getError()));
                    $error = TRUE;
                }

                $query = 'SELECT id FROM #__usergroups WHERE title="Registered"';
                $db->setQuery($query);
                $row = $db->loadObject();

                $query = 'INSERT INTO #__user_usergroup_map VALUES('.$user->get('id').', '.$row->id.')';
                $db->setQuery($query);
                $db->query();

                $agent = new TravelModelAgent;
                $form['id'] = NULL;
                $form['expired_date'] = '0000-00-00';
                $form['user_id'] = $user->get('id');

                $agent->save($form);

                JFactory::getSession()->set('registered-id', $user->get('id'));
            }
        }
    }

    if (empty($errors) && ! isset($error)) {
        $user_id = isset($user_id) ? $user_id : $user->get('id');

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
            $total_commission -= $packages[$renewable]['commission'];
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

        $email_items = '';

        foreach ($items as $package_id => $quantity) {

            if ( ! isset($packages[$package_id])) {
                continue;
            }

            $saleitem = new TravelModelSaleitem;

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
                $data['renewal'] = TRUE;
                $renewable = NULL;
            }

            $email_items .= '<tr><td>'.$packages[$package_id]['title'].'</td><td>'.$quantity.'</td><td>'.$packages[$package_id]['price'].'</td></tr>';

            $saleitem->save($data);

        }

        $commission = new TravelModelCommission;

        if ($guest && isset($referrer)) {
            $data = array(
                'user_id' => $referrer,
                'total_commission' => $total_commission,
                'total_unit' => $total_unit,
                'paid' => FALSE,
                'sale_id' => $sale->id(),
            );

            $commission->save($data);
        } elseif ( ! $guest) {
            $data = array(
                'user_id' => $user_id,
                'total_commission' => $total_commission,
                'total_unit' => $total_unit,
                'paid' => FALSE,
                'sale_id' => $sale->id(),
            );

            $commission->save($data);
        }

        $mailer = JFactory::getMailer();

        $mailer->setSender('mail@mta2u.com');
        $mailer->addRecipient($user->email);
        $mailer->addBCC('mail@mta2u.com');
        $mailer->setSubject('Confirmation of your Order, ID: '.$sale->id());

        $email = '<p>Hi, '.$user->name.'</p><br />';
        $email .= '<p>Thank you for order at Mta2u. The items you ordered has been confirmed below:</p>';
        $email .= '<table><thead><tr><td>Package</td><td>Quantity</td><td>Price</td></tr></thead><tbody>'.$email_items.'</tbody></table>';
        $email .= '<p>Please send the total amount of RM'.$total_amount.' to our respective bank accounts to continue your order</p>';
        $email .= '<br /><p>Regards,<br />Mta2u</p>';

        $mailer->setBody($email);
        $mailer->isHTML();
        $mailer->send();

        JFactory::getSession()->clear('cart');
        JFactory::getSession()->clear('registered-id');
        JFactory::getApplication()->redirect('/index.php/travel-packages/cart/checkout/confirm?sale_id='.$sale->id());
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

label {
    min-width: 80px;
    display: inline-block;
    font-weight: bold;
    margin: 10px 0;
}

#user-registration label {
    min-width: 120px;
    display: block;
    line-height: 1.5em;
}

#user-registration input,
#user-registration select {
    width: 60%;
    height: 34px;
    line-height: 34px;
    padding 0 1em;
    background-color: rgba(0, 0, 0, 0.5);
    border: 1px solid #221A10;
    color: white;
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
            if (jQuery('input#id_term_condition').attr('checked')) {
                if ( ! confirm('Confirm to checkout your items?')) {
                    return false;
                }
            }

            alert('You must agree to our Terms & Condition to continue');
            return false;
        });

        jQuery('form').validationEngine();

        <?php if (isset($errors)): ?>
            <?php foreach ($errors as $field => $message): ?>
                jQuery('input#id_<?php echo $field; ?>').validationEngine('showPrompt', '<?php echo $message; ?>', 'error', 'topRight', true);
            <?php endforeach ?>
        <?php endif ?>
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
                <th><?php echo JText::_('Code'); ?></th>
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
                        <td><?php echo $packages[$package_id]['code']; ?></td>
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
    <br /><br />
    <h2>New User</h2>
    <div id="user-registration">
        <div>
            <label for="id_name">Name</label>
            <input class="validate[required]" type="text" name="name" id="id_name" value="<?php $form['name']; ?>" /> *
        </div>
        <div>
            <label for="id_username">Username</label>
            <input class="validate[required]" type="text" name="username" id="id_username" value="<?php $form['username']; ?>" /> *
        </div>
        <div>
            <label for="id_email">Email</label>
            <input class="validate[required, custom[email]]"  type="email" name="email" id="id_email" value="<?php $form['email']; ?>" /> *
        </div>
        <div>
            <label for="id_email_confirm">Email Confirm</label>
            <input class="validate[required, custom[email], equals[id_email]]" type="email" name="email_confirm" id="id_email_confirm" /> *
        </div>
        <div>
            <label for="id_password">Password</label>
            <input class="validate[required]" type="password" name="password" id="id_password" value="<?php $form['password']; ?>" /> *
        </div>
        <div>
            <label for="id_verify_password">Verify Password</label>
            <input class="validate[required, equals[id_password]]" type="password" name="verify_password" id="id_verify_password" /> *
        </div>
        <div>
            <label for="id_ic_number">IC No.</label>
            <input class="validate[required]" type="text" name="ic_number" id="id_ic_number" value="<?php $form['ic_number']; ?>" /> *
        </div>
        <div>
            <label for="id_bank">Bank</label>
            <select class="validate[required]" name="bank" id="id_bank">
                <option value>Choose a bank option</option>
                <?php foreach ($bank_choices as $bank_choice): ?>
                    <option value="<?php echo $bank_choice; ?>"><?php echo $bank_choice; ?></option>
                <?php endforeach ?>
            </select> *
        </div>
        <div>
            <label for="id_bank_account_number">Bank Account No.</label>
            <input class="validate[required]" type="text" name="bank_account_number" id="id_bank_account_number" value="<?php $form['bank_account_number']; ?>" /> *
        </div>
        <div>
            <label for="id_organization">Organization</label>
            <input type="text" name="organization" id="id_organization" value="<?php $form['organization']; ?>" /> *
        </div>
        <div>
            <label for="id_street_address">Street Address</label>
            <input class="validate[required]" type="text" name="street_address" id="id_street_address" value="<?php $form['street_address']; ?>" /> *
        </div>
        <div>
            <label for="id_address">Address</label>
            <input type="text" name="address" id="id_address" value="<?php $form['address']; ?>" />
        </div>
        <div>
            <label for="id_postcode">Postcode</label>
            <input class="validate[required]" type="text" name="postcode" id="id_postcode" value="<?php $form['postcode']; ?>" /> *
        </div>
        <div>
            <label for="id_city">City</label>
            <input class="validate[required]" type="text" name="city" id="id_city" value="<?php $form['city']; ?>" /> *
        </div>
        <div>
            <label for="id_state">State</label>
            <select class="validate[required]" name="state" id="id_state">
                <option value>Choose a state</option>
                <?php foreach ($state_choices as $state_choice): ?>
                    <option value="<?php echo $state_choice; ?>"><?php echo $state_choice; ?></option>
                <?php endforeach ?>
            </select> *
        </div>
        <div>
            <label for="id_country">Country</label>
            <input class="validate[required]" type="text" name="country" id="id_country" value="Malaysia" readonly="readonly" /> *
        </div>
        <div>
            <label for="id_contact_phone">Contact Phone</label>
            <input type="text" name="contact_phone" id="id_contact_phone" value="<?php $form['contact_phone']; ?>" /> *
        </div>
        <div>
            <label for="id_referrer">Referrer Username</label>
            <input type="text" name="referrer" id="id_referrer" value="<?php $form['referrer']; ?>" />
        </div>
    </div>
    <?php endif ?>

    <br />
    <input type="checkbox" name="term_agreement" id="id_term_condition" /> I Agree to the <a href="index.php/travel-packages/term-condition" target="_blank">Terms and Condition</a>
    <div id="buttongroup">
        <button name="checkout">Confirm</button>
    </div>
</form>
