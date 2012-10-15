<?php
/**
 * @version		1.5.0
 * @package		Joomla
 * @subpackage	OS Membership
 * @author  Tuan Pham Ngoc
 * @copyright	Copyright (C) 2012 Ossolution Team
 * @license		GNU/GPL, see LICENSE.php
 */
// no direct access
defined( '_JEXEC' ) or die ;
/**
 * Subscription Plan Table Class
 *
 */
class PlanOSMembership extends JTable
{
	/**
	 * Primary Key
	 *
	 * @var int
	 */
	var $id = null;
	/**
	 * Plan category
	 * @var int
	 */
	var $category_id = null ;
	/**
	 * 
	 * The title
	 * @var Int
	 */
	var $title = null ;
	/**
	 * 
	 * Subscription length
	 * @var string
	 */
	var $subscription_length = null ;
	/**
	 * thumb
	 * @var string
	 */
	var $thumb = null ;
	/**
	 * 
	 * short description
	 * @var string
	 * 
	 */
	var $short_description = null ;
	/**
	 * 
	 * 	description
	 * @var string
	 */
	var $description = null ;
	/**
	 * 
	 * price
	 * @var decimal
	 */
	var $price = null ;
	/**
	 * The date where all subscribers will be marked as expired
	 * @var DateTime
	 */
	var $expired_date = null ;
	/**
	 * 
	 * 	Enable cancel subscription
	 * @var tinyint
	 */
	var $enable_cancel = null ;
	/**
	 * 
	 * cancel before number days
	 * @var int
	 */
	var $cancel_before_number_days = null ;
	/**
	 *
	 * send_first_reminder
	 * @var tinyint
	 */
	var $send_first_reminder = null ;
	/**
	 *
	 * send_second_reminder
	 * @var tinyint
	 */
	var $send_second_reminder = null;	
	/**
	 * This plan is recurring subscription or not
	 * @var Tinyint
	 */
	var $recurring_subscription = null ;
	/**
	 * Enable renewal or not
	 * @var TinyInt
	 */
	var $enable_renewal = null ;
	/**
	 * Trial amount
	 * @var Decimal
	 */
	var $trial_amount = null ;
	/**
	 * Total number of recurring occurrencies
	 * @var Int
	 */
	var $number_payments = null ;
	/**
	 * 
	 * 	params
	 * @var string
	 */
	var $params = null ;
	/**
	 * 
	 * ordering
	 * @var int
	 */
	var $ordering = null;
	/**
	 * 
	 * 	published
	 * @var tinyint
	 */
	var $published = null ;	
	/**
	 * Constructor
	 *
	 * @param object Database connector object
	 * @since 1.5
	 */
	function __construct(& $db) {
		parent::__construct('#__osmembership_plans', 'id', $db);
	}		
}
/**
 * Coupon Table class
 *
 */
class CouponOSMembership extends JTable
{
	/**
	 * Primary Key
	 *
	 * @var int
	 */
	var $id = null;
	/**
	 * coupon code
	 *
	 * @var string
	 */
	var $code = null ;
	/**
	 * Coupon Type
	 *
	 * @var int
	 */
	var $coupon_type = null ;	
	/**
	 *  Discount Amount
	 *
	 * @var int
	 */	
	var $discount = null ;
	/**
	 * Subscription Plan ID
	 *
	 * @var int
	 */
	var $plan_id = null ;
	/**
	 * Total used times enabled
	 *
	 * @var int
	 */
	var $times = null ;
	/**
	 * Times used 
	 *
	 * @var int
	 */
	var $used = null;
	/**
	 * Valid from date
	 *
	 * @var DateTime
	 */
	var $valid_from = null ;
	/**
	 * Valid to date
	 * @var DateTime
	 */
	var $valid_to = null ;
	/**
	 * Published status
	 *
	 * @var tinyint
	 */
	var $published = 0 ;
	/**
	 * Constructor
	 *
	 * @param object Database connector object
	 * @since 1.5
	 */
	function __construct(& $db) {
		parent::__construct('#__osmembership_coupons', 'id', $db);
	}
}
/**
 * Custom Field Table Class
 *
 */
class FieldOSMembership extends JTable
{
	/**
	 * Primary Key
	 *
	 * @var int
	 */
	var $id = null;	
	/**
	 * Plan ID
	 *
	 * @var int
	 */
	var $plan_id = null ;
	/**
	 * Name of the field
	 *
	 * @var string
	 */
	var $name = null ;	
	/**
	 * Field title
	 *
	 * @var varchar
	 */
	var $title = null ;
	/**
	 * Description of field
	 *
	 * @var string
	 */
	var $description = null ;
	/**
	 * Field type
	 *
	 * @var tinyint
	 */
	var $field_type = null ;	
	/**
	 * Field is required or not
	 *
	 * @var tinyint
	 */
	var $required = null ;
	/**
	 * Values of fields, used for dropdown and radio list
	 *
	 * @var text
	 */
	var $values = null ;
	/**
	 * Selected values, used for dropdown and radio list
	 *
	 * @var text
	 */
	var $default_values = null ;
	/**
	 * Rows for textarea
	 *
	 * @var int
	 */
	var $rows = null ;	
	/**
	 * Cols for textarea
	 *
	 * @var int
	 */
	var $cols = null ;
	/**
	 * Size for textbox
	 *
	 * @var int
	 */
	var $size = null ;
	/**
	 * Css class 
	 *
	 * @var string
	 */
	var $css_class = null ;
	/**
	 * Extra
	 *
	 * @var string
	 */
	var $extra =  null ;	
	/**
	 * Datatype validation
	 *
	 * @var string
	 */
	var $datatype_validation = null ;
	/**
	 * Field mapping
	 *
	 * @var string
	 */
	var $field_mapping = null ;
	/**
	 * Is core
	 *
	 * @var int
	 */
	var $is_core = null ;	
	/**
	 * Ordering of the field
	 *
	 * @var int
	 */
	var $ordering = null ;
	
	/**
	 * Published
	 *
	 * @var int
	 */
	var $published = null ;	
	/**
	 * Constructor
	 *
	 * @param object Database connector object
	 * @since 1.5
	 */
	function __construct(& $db) {
		parent::__construct('#__osmembership_fields', 'id', $db);
	}
}
/**
 * Subscriber Table Class
 *
 */
class SubscriberOSMembership extends JTable
{
	/**
	 * Primary Key
	 *
	 * @var int
	 */
	var $id = 0;
	/**
	 * Membership Id
	 * @var int
	 */
	var $membership_id = 0 ;
	/**
	 * Plan ID
	 *
	 * @var int
	 */
	var $plan_id = 0 ;
	/**
	 * User ID
	 *
	 * @var Int
	 */
	var $user_id = 0 ;
	/**
	 * Coupon Id
	 *
	 * @var int
	 */
	var $coupon_id = 0 ;
	/**
	 * First Name
	 *
	 * @var string
	 */
	var $first_name = null ;
	/**
	 * Last Name
	 *
	 * @var string
	 */
	var $last_name = null ;
	/**
	 * Organization
	 *
	 * @var string
	 */
	var $organization = null ;
	/**
	 * Address
	 *
	 * @var string
	 */
	var $address = null ;
	/**
	 * Address 2
	 *
	 * @var string
	 */
	var $address2 = null ;
	/**
	 * City
	 *
	 * @var string
	 */
	var $city = null ;
	/**
	 * State
	 *
	 * @var string
	 */
	var $state = null ;
	/**
	 * Zip
	 *
	 * @var string
	 */
	var $zip = null ;
	/**
	 * Country
	 *
	 * @var string
	 */
	var $country = null ;
	/**
	 * Phone
	 *
	 * @var string
	 */
	var $phone = null ;
	/**
	 * Fax
	 *
	 * @var string
	 */
	var $fax = null ;
	/**
	 * Email
	 *
	 * @var string
	 */
	var $email = null ;
	/**
	 * 	Comment
	 *
	 * @var string
	 */	
	var $comment =  null ;
	/**
	 * 	Created date
	 *
	 * @var Datetime
	 */	
	var $created_date = null ;
	/**
	 * payment date
	 *
	 * @var Datetime
	 */	
	var $payment_date = null ;
	/**
	 * 	Subscription Start Date
	 *
	 * @var datetime
	 */	
	var $from_date =  null ;
	/**
	 * Subscription End Date
	 *
	 * @var datetime
	 */	
	var $to_date = null ;	
	/**
	 * Net amount
	 *
	 * @var decimal
	 */	
	var $amount = null ;
	/**
	 * tax amount
	 *
	 * @var decimal
	 */	
	var $tax_amount = null ;
	/**
	 * discount amount
	 *
	 * @var decimal
	 */	
	var $discount_amount = null ;
	/**
	 * gross amount
	 *
	 * @var decimal
	 */	
	var $gross_amount = null ;	
	/**
	 * Payment method
	 *
	 * @var string
	 */	
	var $payment_method = null ;
	/**
	 * transaction Id
	 *
	 * @var string
	 */	
	var $transaction_id = null ;
	/**
	 * Total payment made
	 * @var Int
	 */
	var $payment_made = null ;
	/**
	 * 	Random unique code for the subscription
	 *
	 * @var string
	 */
	var $subscription_code = null ;
	/**
	 * act
	 *
	 * @var string
	 */	
	var $act = null ;
	/**
	 * From subscription id, only used when renew or upgrade subscription
	 * @var int
	 */
	var $from_subscription_id = 0 ;
	/**
	 * 
	 * Renew subscription option ID
	 * @var int
	 */
	var $renew_option_id = 0 ;
	/**
	 * Upgrade subscription rule ID 
	 * @var int
	 */
	var $upgrade_option_id = 0 ;
	/**
	 * 
	 * First Reminder Sending Status
	 * @var int
	 */
	var $first_reminder_sent = 0 ;
	/**
	 * Second Reminder Sending Status
	 * @var int
	 */
	var $second_reminder_sent = 0 ;	
	/**
	 * Subscription Status
	 * @var tinyint
	 */
	var $published = null ;
	/**
	 * Constructor
	 *
	 * @param object Database connector object
	 * @since 1.5
	 */
	function __construct(& $db) {
		parent::__construct('#__osmembership_subscribers', 'id', $db);
	}
}
/**
 * Upgrade Rule table class
 *
 */
class RuleOSMembership extends JTable
{
	/**
	 * Primary Key
	 *
	 * @var int
	 */
	var $id = 0;
	/**
	 * From Plan ID
	 *
	 * @var int
	 */
	var $from_plan_id = 0 ;
	/**
	 * To plan ID
	 *
	 * @var Int
	 */
	var $to_plan_id = 0 ;
	/**
	 * Upgrade Price
	 *
	 * @var decimal
	 */
	var $price = 0 ;
	/**
	 * Min presence
	 *
	 * @var int
	 */
	var $min_presence = null ;
	/**
	 * max presence
	 *
	 * @var string
	 */
	var $max_presence = null ;
	/**
	 * published
	 *
	 * @var tinyint
	 */
	var $published = null ;
	/**
	 * Constructor
	 *
	 * @param object Database connector object
	 * @since 1.5
	 */
	function __construct(& $db) {
		parent::__construct('#__osmembership_upgraderules', 'id', $db);
	}
}
/**
 * Config Table Class
 *
 */
class ConfigOsMembership extends JTable
{
	/**
	 * Primary Key
	 *
	 * @var int
	 */
	var $id = null;		
	/**
	 * 
	 * Config key
	 * @var string
	 */
	var $config_key = null ;
	/**
	 * Config value	 
	 * @var string
	 */
	var $config_value = null ;	
	/**
	 * Constructor
	 *
	 * @param object Database connector object
	 * @since 1.5
	 */
	function __construct(& $db) {
		parent::__construct('#__osmembership_configs', 'id', $db);
	}
}
/**
 * Custom Field Value Table Class
 *
 */
class FieldValueOsMembership extends JTable
{
	/**
	 * Primary Key
	 *
	 * @var int
	 */
	var $id = null;
	/**
	 * Subscriber ID
	 * @var int
	 */
	var $subscriber_id = null ;
	/**
	 *
	 * Field ID
	 * @var int
	 */
	var $field_id = null ;
	/**
	 * Field Value
	 * @var string
	 */
	var $field_value = null ;	
	/**
	 * Constructor
	 *
	 * @param object Database connector object
	 * @since 1.5
	 */
	function __construct(& $db) {
		parent::__construct('#__osmembership_field_value', 'id', $db);
	}
}
/**
 * Payment Plugin Table Class
 *
 */
class PluginOSMembership extends JTable
{
	/**
	 * Primary Key
	 *
	 * @var int
	 */
	var $id = null ;	
	/**
	 * name
	 *
	 * @var string
	 */
	var $name = null;		
	/**
	 * Title of the image
	 *
	 * @var string
	 */
	var $title = null;
	/**
	 * Author of the plugin
	 *
	 * @var string
	 */
	var $author = null ;	
	/**
	 * Creation Date
	 *
	 * @var string
	 */
	var $creation_date = null ;
	/**
	 * Copyright
	 *
	 * @var string
	 */
	var $copyright = null ;
	/**
	 * License
	 *
	 * @var string
	 */
	var $license = null;
	/**
	 * Author email
	 *
	 * @var string
	 */
	var $author_email =  null;
	/**
	 * Authro url
	 *
	 * @var string
	 */
	var $author_url = null;
	/**
	 * Plugin version
	 *
	 * @var string
	 */
	var $version =  null;
	/**
	 * Description
	 *
	 * @var string
	 */
	var $description = null;
	/**
	 * Support recurring subscription or not
	 * @var TinyInt
	 */
	var $support_recurring_subscription = 0 ;
	/**
	 * Plugin parameters
	 *
	 * @var string
	 */
	var $params = null;	
	/**
	 * Plugin ordering
	 *
	 * @var int
	 */
	var $ordering = null ;
	/**
	 * Published
	 *
	 * @var tinyint
	 */	
	var $published = 0;
	/**
	 * Constructor
	 *
	 * @param object Database connector object
	 * @since 1.5
	 */
	function __construct(& $db) {
		parent::__construct('#__osmembership_plugins', 'id', $db);
	}
}
/**
 * Category Table Class
 *
 */
class CategoryOSMembership extends JTable
{
	/**
	 * Primary Key
	 *
	 * @var int
	 */
	var $id = null ;
	/**
	 * Title of the image
	 *
	 * @var string
	 */
	var $title = null;

	/**
	 * Description
	 *
	 * @var string
	 */
	var $description = null;

	/**
	 * Published
	 *
	 * @var tinyint
	 */
	var $published = 0;
	/**
	 * Constructor
	 *
	 * @param object Database connector object
	 * @since 1.5
	 */
	function __construct(& $db) {
		parent::__construct('#__osmembership_categories', 'id', $db);
	}
}