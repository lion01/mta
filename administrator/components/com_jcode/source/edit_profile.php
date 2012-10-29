<?php defined('_JEXEC') or die('Restricted access');

define('JPATH_ADMIN_TRAVEL', JPATH_COMPONENT_ADMINISTRATOR.'/../com_travel');
@define('LN', "\n");

require JPATH_ADMIN_TRAVEL.'/models/agent.php';
require JPATH_ADMIN_TRAVEL.'/tables/agent.php';
require JPATH_ADMIN_TRAVEL.'/helpers/html/validator.php';

$db = JFactory::getDBO();
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


$user = JFactory::getUser();
$query = 'SELECT * FROM #__travel_agents WHERE user_id = '.$user->get('id');
$db->setQuery($query);
$agent = $db->loadObject();

$form = array(
    'email' => $user->email,
    'bank' => $agent->bank,
    'bank_account_number' => $agent->bank_account_number,
    'organization' => $agent->organization,
    'street_address' => $agent->street_address,
    'address' => $agent->address,
    'postcode' => $agent->postcode,
    'state' => $agent->state,
    'city' => $agent->city,
    'country' => $agent->country,
    'contact_phone' => $agent->contact_phone,
);

if (JRequest::getMethod() == 'POST') {
    foreach ($form as $field => $value) {
        if (isset($_POST[$field])) {
            $form[$field] = $_POST[$field];
        }
    }

    if ( ! $user->bind($form)) {
        JError::raiseWarning('', JText::_($user->getError()));
        $error = TRUE;
    }

    if ( ! $user->save()) {
        JError::raiseWarning('', JText::_($user->getError()));
        $error = TRUE;
    }

    $travel_agent = new TravelModelAgent;
    $travel_agent->update($agent->id, $form);

}

?>

<style>
#buttongroup {
    margin-top: 12px;
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
        jQuery('form').validationEngine();

        <?php if (isset($errors)): ?>
            <?php foreach ($errors as $field => $message): ?>
                jQuery('input#id_<?php echo $field; ?>').validationEngine('showPrompt', '<?php echo $message; ?>', 'error', 'topRight', true);
            <?php endforeach ?>
        <?php endif ?>
    });
</script>

<div id="user-registration">
    <div>
        <label for="id_email">Email</label>
        <input class="validate[required, custom[email]]"  type="email" name="email" id="id_email" value="<?php $form['email']; ?>" /> *
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

    <div id="buttongroup">
        <button name="checkout">Continue</button>
    </div>
</div>
