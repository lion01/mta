<?php defined('_JEXEC') or die('Restricted Access');

if (JRequest::getMethod() != 'POST') {
    JFactory::getApplication()->redirect('/index.php/travel-packages/cart/checkout');
}

if (isset($_POST['renewal'])) {
    echo $_POST['renewal'];
}
?>
