<?php 
/**
 * @version		1.5.0
 * @package		Joomla
 * @subpackage	OS Membership
 * @author  Tuan Pham Ngoc
 * @copyright	Copyright (C) 2012 Ossolution Team
 * @license		GNU/GPL, see LICENSE.php
 */
// Check to ensure this file is included in Joomla!
defined('_JEXEC') or die ;
?>
<table class="os_table" width="100%">				
	<tr>			
		<td class="title_cell" width="35%">
			<?php echo  JText::_('OSM_PLAN') ?>
		</td>
		<td class="field_cell">
			<?php echo $this->planTitle ; ?>
		</td>
	</tr>	
	<tr>
		<td class="title_cell">
			<?php echo JText::_('OSM_SUBSCRIPTION_START_DATE'); ?>
		</td>
		<td class="field_cell">
			<?php echo JHTML::_('date', $this->row->from_date, $this->config->date_format); ?>
		</td>
	</tr>				
	<tr>
		<td class="title_cell">
			<?php echo JText::_('OSM_SUBSCRIPTION_END_DATE'); ?>
		</td>
		<td class="field_cell">
			<?php echo JHTML::_('date', $this->row->to_date, $this->config->date_format); ?>
		</td>
	</tr>
	<?php	
		$db = & JFactory::getDBO() ;				
		$jcFields = new OSMFields($this->row->plan_id);
		if ($jcFields->getTotal()) {					
			$sql = 'SELECT field_id, field_value FROM #__osmembership_field_value WHERE subscriber_id='.$this->row->id;
			$db->setQuery($sql);
			$rowFields = $db->loadObjectList();
			$values = array() ;
			for ($i = 0, $n = count($rowFields) ; $i < $n; $i++) {
				$rowField = $rowFields[$i] ;
				$values[$rowField->field_id] = $rowField->field_value ;	
			}
			for ($i = 0, $n = count($jcFields->_fields) ; $i < $n; $i++) {
				$field = $jcFields->_fields[$i] ;				
			?>			
				<tr>
					<td class="title_cell">
						<?php echo $field->title ; ?>																					
					</td>
					<td class="field_cell">
						<?php
							if ($field->is_core) {
								$fieldName = $field->name ;
								$value = $this->row->$fieldName ;																		
							} else {
								$value = isset($values[$field->id]) ?  $values[$field->id] :  '' ;
								if ($field->field_type == FIELD_TYPE_UPLOAD) {
									$pos = strpos($value, '_') ;
									$value = substr($value, $pos + 1) ;
								}
							}																
						?>							
						<?php echo $value ; ?>											
					</td>
				</tr>
			    <?php																											
			}
		}						
		if ($this->row->amount > 0) {
		?>
			<tr>
				<td class="title_cell">
					<?php echo JText::_('OSM_PAYMENT_OPTION'); ?>
				</td>					
				<td class="field_cell">
					<?php
						$method = os_payments::loadPaymentMethod($this->row->payment_method) ;
						echo JText::_($method->title);
					?>					
				</td>
			</tr>
			<tr>
			<td class="title_cell">
				<?php echo JText::_('OSM_TRANSACTION_ID'); ?>
			</td>
			<td class="field_cell">
				<?php echo $this->row->transaction_id ; ?>
			</td>
		</tr>
		<?php    
		}		
	?>														
</table>	