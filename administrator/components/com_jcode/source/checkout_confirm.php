<?php defined('_JEXEC') or die('Restricted Access') ?>

<h1>Thank You</h1>
<?php echo isset($_GET['sale_id']) ? '<p>Your order ID is '.$_GET['sale_id'].'</p>' : ''; ?>
<p>We are processing your order and will send you and email confirmation shortly,<br />
Please send your payment ASAP to complete your order.</p>
