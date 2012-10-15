<?php
/**
 * @version		1.5.0
 * @package		Joomla
 * @subpackage	OS Membership
 * @author  Tuan Pham Ngoc
 * @copyright	Copyright (C) 2012 Ossolution Team
 * @license		GNU/GPL, see LICENSE.php
 */
defined('_JEXEC') or die ;

define('NUMBER_OPTION_PER_LINE', 3) ;
define('FIELD_TYPE_TEXTBOX', 0) ;
define('FIELD_TYPE_TEXTAREA', 1) ;
define('FIELD_TYPE_DROPDOWN', 2) ;
define('FIELD_TYPE_CHECKBOXLIST', 3) ;
define('FIELD_TYPE_RADIOLIST', 4) ;
define('FIELD_TYPE_DATETIME', 5) ;
define('FIELD_TYPE_HEADING', 6) ;
define('FIELD_TYPE_MESSAGE', 7) ;
define('FIELD_TYPE_MULTISELECT', 8) ;
define('FIELD_TYPE_UPLOAD', 9) ;
/**
 * Custom Fields helper class
 *
 */
class OSMFields {
	/**
	 * List of custom fields used in the system
	 *
	 * @var array
	 */
	var $_fields = null ;
	/**
	 * Constructor function
	 *
	 * @return JCFields
	 */
	function OSMFields($planId, $loadFromProfile = false) {
		if (empty($this->_fields)) {			
			$db = & JFactory::getDBO() ;
			$user = & JFactory::getUser() ;
			$userId = $user->get('id');
			$integration = OSMembershipHelper::getConfigValue('cb_integration') ;														   
			//Load data from user profile					
			if ($integration && $userId && $loadFromProfile) {
				if ($integration == 1) {
					$sql = 'SELECT * FROM #__comprofiler WHERE user_id='.$userId;
					$db->setQuery($sql) ;
					$rowProfile = $db->loadObject();			
				} elseif ($integration == 2) {
					$sql = 'SELECT cf.fieldcode , fv.value FROM #__community_fields AS cf '
						. ' INNER JOIN #__community_fields_values AS fv '
						. ' ON cf.id = fv.field_id '
						. ' WHERE fv.user_id = '.$userId 
					;				
					$db->setQuery($sql);			
					$rows = $db->loadObjectList();
					$rowProfile = new stdClass() ;
					for ($i = 0 , $n = count($rows) ; $i < $n ; $i++) {
						$row = $rows[$i] ;
						$fieldName = $row->fieldcode ;
						$fieldValue = $row->value ;
						if ($fieldName)
							$rowProfile->$fieldName = $fieldValue ;			
					}
				}	
			}			

			if ($userId) {
				$sql = 'SELECT * FROM #__osmembership_subscribers WHERE user_id='.$userId.' ORDER BY id DESC';
				$db->setQuery($sql);
				$subscriptionRecord = $db->loadObject();
			} else {
				$subscriptionRecord = null ;
			}
																	    				
			$sql = 'SELECT * FROM #__osmembership_fields WHERE published=1 AND (plan_id=0 OR plan_id='.$planId.') ORDER BY ordering';			
			$db->setQuery($sql);											
			$rows = $db->loadObjectList();

			
			if ($subscriptionRecord) { //Load data from subscription record instead of loading from profile
				$sql = 'SELECT a.name, b.field_value FROM #__osmembership_fields AS a '
				.' INNER JOIN #__osmembership_field_value AS b '
				.' ON a.id = b.field_id '
				.' WHERE b.subscriber_id='.$subscriptionRecord->id
				;
				$db->setQuery($sql);
				$rowFields = $db->loadObjectList();
				$fieldValues = array();
				foreach($rowFields as $rowField) {
					$fieldValues[$rowField->name] = $rowField->field_value ;
				}
				
				for ($i =  0 , $n = count($rows) ; $i < $n; $i++) {
					$row = $rows[$i] ;
					if ($row->is_core) {
						$row->default_values = $subscriptionRecord->{$row->name} ;
					} else {
						$row->default_values = @$fieldValues[$row->name] ;
					}
				}
			} elseif ($userId && $integration && $loadFromProfile) {
				for ($i = 0 , $n = count($rows) ; $i < $n ; $i++) {
					$row = & $rows[$i] ;
					if ($row->field_mapping) {
						$fieldName = $row->field_mapping ;
						if ($fieldName && isset($rowProfile->$fieldName)) {
							$defaultValues = $rowProfile->$fieldName ;
							$defaultValues = str_replace('|*|', "\r\n", $defaultValues) ;
							$row->default_values = $defaultValues ;
						}
					}
				}
			}	
																					
			for ($i = 0 , $n = count($rows) ; $i < $n ; $i++) {
				$row = & $rows[$i] ;
				if ($row->name == 'email' && $row->default_values == '') {
					$row->default_values = $user->get('email');
				}
				$row->tab_index = $i + 1 ;
			}
			$this->_fields = $rows ;					
		}		
	}	
	/**
	 * Get custom fields
	 *
	 * @return array of objects
	 */
	function getFields() {
		$rows = $this->_fields ;			
		$fieldsOutput = array() ;	
		for ($i = 0 , $n = count($rows) ; $i < $n ; $i++) {
			$row = & $rows[$i] ;
			$row->output = $this->getFieldOutput($row) ;
			$fieldsOutput[$row->name] = $row->output ;										
		}
		return array($rows, $fieldsOutput) ;
	}
	/**
	 * Get total custom fields
	 *
	 * @return int
	 */	
	function getTotal() {
		return count($this->_fields);		
	}	
	/**
	 * Textbox output
	 *
	 * @param object $row
	 */
	function _renderTextBoxOutput($row) {
		$postedValue = JRequest::getVar($row->name,  $row->default_values) ;
	?>			
		<input type="text" id=<?php echo $row->name; ?> name="<?php echo $row->name ; ?>" class="<?php echo $row->css_class; ?>" size="<?php echo $row->size ; ?>" value="<?php echo $postedValue ; ?>" <?php echo $row->extra ; ?> />
		<?php
			if ($row->name == 'email') {
				$errorCode =  JRequest::getVar('registration_error_code');
				if ($errorCode == 2) {
				?>
					<span class="invalid"><?php echo JText::_('OSM_INVALID_EMAIL'); ?></span>
				<?php					
				}
			}
		?>					
	<?php
	}	
	/**
	 * Render textbox when edit a donor
	 *
	 * @param object $row
	 * @param string $value
	 */
	function _renderTextBoxEdit($row, $value) {
	?>
		<tr>
			<td class="title_cell key">
				<?php echo $row->title ; ?>
			</td>
			<td>
				<input type="text" id="<?php echo $row->name ; ?>" name="<?php echo $row->name ; ?>" class="<?php echo $row->css_class; ?>" size="<?php echo $row->size ; ?>" value="<?php echo $value ; ?>" <?php echo $row->extra ; ?> />	
			</td>
		</tr>
	<?php	
	}	
	/**
	 * Gender validation for textbox 
	 *
	 * @param object $row
	 */
	function _renderTextBoxValidation($row) {
	?>
		if (form.<?php echo $row->name; ?>.value == "") {
			alert("<?php echo $row->title ;?> <?php echo JText::_('OSM_IS_REQUIRED') ; ?>");
			form.<?php echo $row->name; ?>.focus();
			return ;
		}			
		//Other check
		<?php
			if ($row->datatype_validation == 1){
				//Integer number	
			?>
				if (!parseInt(form.<?php echo $row->name; ?>.value)) {
					alert("<?php echo $row->title.JText::_('OSM_INTEGER_VALUE') ?>");
					form.<?php echo $row->name; ?>.focus();
					return ;
				}
			<?php					
			} elseif ($row->datatype_validation == 2) {
				//Float number
			?>
				if (isNaN(form.<?php echo $row->name; ?>.value)) {
					alert("<?php echo $row->title.JText::_('OSM_FLOAT_VALUE') ?>");
					form.<?php echo $row->name; ?>.focus();
					return ;
				}
			<?php	
				
			} elseif ($row->datatype_validation == 3) {
				//Email
			?>
				var emailFilter = /^\w+[\+\.\w-]*@([\w-]+\.)*\w+[\w-]*\.([a-z]{2,4}|\d+)$/i
				var ret = emailFilter.test(form.<?php echo $row->name ; ?>.value);
				if (!ret) {
					alert("<?php echo $row->title.JText::_('OSM_EMAIL_VALUE') ?>");
					return ;
				}								
			<?php	
			}
		?>
					
	<?php		
	}
	/**
	 * Output values which users entered in the textbox field
	 *
	 * @param object $row
	 */
	function _renderTextboxConfirmation($row) {			
	?>
			<tr>
    			<td class="title_cell key">
    				<?php echo $row->title ; ?>
    			</td>
    			<td>
    				<?php
    					$name = $row->name ;
    					echo JRequest::getVar($name, '', 'post') ;    					    					
    				?>	
    			</td>				
    		</tr>
	<?php    					
	}
	/**
	 * Render hidden field for textbox 
	 *
	 * @param object $row
	 */
	function _renderTextboxHidden($row) {
		$name = $row->name ;		
		$postedValue = JRequest::getVar($name, '', 'post') ;
	?>
		<input type="hidden" name="<?php echo $name ; ?>" value="<?php echo $postedValue; ?>" />
	<?php			
	}	
	/**
	 * Render the output of text area
	 *
	 * @param object $row
	 */
	function _renderTextareaOutput($row) {
		$postedValue = JRequest::getVar($row->name,  $row->default_values) ;
	?>		
		<textarea id="<?php echo $row->name ; ?>" name="<?php echo $row->name ; ?>" rows="<?php echo $row->rows; ?>" cols="<?php echo $row->cols ; ?>" class="<?php echo $row->css_class; ?>" <?php echo $row->extra; ?>><?php echo $postedValue; ?></textarea>					
	<?php	
	}
	/**
	 * Render textarea in edit mode
	 *
	 * @param object $row
	 * @param string $value
	 */
	function _renderTextareaEdit($row, $value) {		
	?>
		<tr>
			<td class="key">
				<?php echo $row->title ; ; ?>
			</td>
			<td>
				<textarea id="<?php echo $row->name ; ?>" name="<?php echo $row->name ; ?>" rows="<?php echo $row->rows; ?>" cols="<?php echo $row->cols ; ?>" class="<?php echo $row->css_class; ?>" <?php echo $row->extra ; ?>><?php echo $value; ?></textarea>	
			</td>
		</tr>		
	<?php	
	}
	/**
	 * Gender validation for textarea 
	 *
	 * @param object $row
	 */
	function _renderTextAreaValidation($row) {
	?>				
		if (form.<?php echo $row->name; ?>.value == "") {
			alert("<?php echo $row->title ;?> <?php echo JText::_('OSM_IS_REQUIRED') ; ?>");
			form.<?php echo $row->name; ?>.focus();
			return ;
		}	
	<?php		
	}
	/**
	 * Output values which users entered in the textarea field
	 *
	 * @param object $row
	 */
	function _renderTextAreaConfirmation($row) {	
		$name = $row->name ;
		$postedValue = JRequest::getVar($name, '', 'post') ;
	?>
		<tr>
			<td class="title_cell key">
				<?php echo $row->title ; ?>
			</td>
			<td>
				<?php echo $postedValue ; ?>
			</td>
		</tr>
	<?php			
	}
	/**
	 * Render hidden field for textarea
	 *
	 * @param object $row
	 */
	function _renderTextAreaHidden($row) {
		$name = $row->name ;		
		$postedValue = JRequest::getVar($name, '', 'post') ;
	?>
		<input type="hidden" name="<?php echo $name ; ?>" value="<?php echo $postedValue; ?>" />
	<?php			
	}			
	/**
	 * Render output of the dropdown
	 */
	function _renderDropdownOutput($row) {
		if ($row->name == 'country') {
			$this->_renderCountry($row);
		} else {
			$postedValue = JRequest::getVar($row->name, $row->default_values, 'post') ;			
			$options = array() ;
			$options[] = JHTML::_('select.option', '', JText::_('OSM_SELECT'));		
			$values = explode("\r\n", $row->values) ;
			for ($i = 0 , $n = count($values) ; $i < $n ; $i++) {
				$options[] = JHTML::_('select.option', $values[$i], $values[$i]) ;
			}	
			echo JHTML::_('select.genericlist', $options, $row->name, '', 'value', 'text', $postedValue);
		}												
	}
	/**
	 * Render the dropdown in edit mode
	 *
	 * @param object $row
	 * @param string $value 
	 */
	function _renderDropdownEdit($row, $value) {					
		$options = array() ;
		$options[] = JHTML::_('select.option', '', JText::_('OSM_SELECT'));		
		$values = explode("\r\n", $row->values) ;
		for ($i = 0 , $n = count($values) ; $i < $n ; $i++) {
			$options[] = JHTML::_('select.option', $values[$i], $values[$i]) ;
		}
		?>
			<tr>
				<td class="title_cell key">
					<?php echo $row->title ; ?>
				</td>
				<td>
					<?php
						echo JHTML::_('select.genericlist', $options, $row->name, '', 'value', 'text', $value);			
					?>
				</td>
			</tr>
		<?php								
	}
	/**
	 * Gender validation for dropdown 
	 *
	 * @param object $row
	 */
	function _renderDropdownValidation($row) {
	?>		
		if (form.<?php echo $row->name; ?>.selectedIndex == 0) {
			alert("<?php echo $row->title ;?> <?php echo JText::_('OSM_IS_REQUIRED') ; ?>");
			form.<?php echo $row->name; ?>.focus();
			return ;
		}	
	<?php		
	}
	/**
	 * Output values which users choosed in the dropdown
	 *
	 * @param object $row
	 */
	function _renderDropDownConfirmation($row) {
		$name = $row->name ;
		$postedValue = JRequest::getVar($name, '', 'post') ;
	?>
		<tr>
			<td class="title_cell key">
				<?php echo $row->title ; ?>
			</td>
			<td class="field_cell">
				<?php echo $postedValue ; ?>
			</td>
		</tr>
	<?php				
	}
	/**
	 * Render hidden field for textbox 
	 *
	 * @param object $row
	 */
	function _renderDropdownHidden($row) {
		$name = $row->name ;		
		$postedValue = JRequest::getVar($name, '', 'post') ;
	?>
		<input type="hidden" name="<?php echo $name ; ?>" value="<?php echo $postedValue; ?>" />
	<?php			
	}				
	/**
	 * Render multi-select output
	 *
	 * @param object $row
	 */
	function _renderMultiSelectOutput($row) {		
		if (isset($_POST[$row->name])) {
			$selectedValues = $_POST[$row->name] ;	
		} else {
			$selectedValues = explode("\r\n", $row->default_values) ;
		}			
		$options = array() ;			
		$values = explode("\r\n", $row->values) ;
		for ($i = 0 , $n = count($values) ; $i < $n ; $i++) {
			$options[] = JHTML::_('select.option', $values[$i], $values[$i]) ;
		}		
		$selectedOptions = array() ;
		for ($i = 0 , $n = count($selectedValues); $i < $n; $i++) {
			$selectedOptions[] = JHTML::_('select.option', $selectedValues[$i], $selectedValues[$i]) ;
		}	 	
		echo JHTML::_('select.genericlist', $options, $row->name.'[]', ' multiple="multiple" size="4" ', 'value', 'text', $selectedValues);							
	}			
	/**
	 * Render the dropdown in edit mode
	 *
	 * @param object $row
	 * @param string $value 
	 */
	function _renderMultiSelectEdit($row, $value) {					
		$options = array() ;			
		$values = explode("\r\n", $row->values) ;
		for ($i = 0 , $n = count($values) ; $i < $n ; $i++) {
			$options[] = JHTML::_('select.option', $values[$i], $values[$i]) ;
		}
		$selectedValues = explode(',', $value) ;
		$selectedOptions = array() ;
		for ($i = 0 , $n = count($selectedValues); $i < $n; $i++) {
			$selectedOptions[] = JHTML::_('select.option', $selectedValues[$i], $selectedValues[$i]) ;
		}
		?>
			<tr>
				<td class="title_cell key">
					<?php echo $row->title ; ?>
				</td>
				<td>
					<?php
						echo JHTML::_('select.genericlist', $options, $row->name.'[]', ' multiple="multiple" size="4" ', 'value', 'text', $selectedOptions);			
					?>
				</td>
			</tr>
		<?php								
	}
	/**
	 * Gender validation for dropdown 
	 *
	 * @param object $row
	 */
	function _renderMultiSelectValidation($row) {
	?>
		var selectTag =  document.getElementById('<?php echo $row->name; ?>');
		if (selectTag.selectedIndex == -1) {
			alert("<?php echo $row->title ;?> <?php echo JText::_('OSM_IS_REQUIRED') ; ?>");
			form.<?php echo $row->name; ?>.focus();
			return ;
		}			
	<?php		
	}
	/**
	 * Output values which users choosed in the dropdown
	 *
	 * @param object $row
	 */
	function _renderMultiSelectConfirmation($row) {
		$name = $row->name ;
		$postedValue = JRequest::getVar($name, array(), 'post') ;
		$postedValue = implode(',', $postedValue);
	?>
		<tr>
			<td class="title_cell key">
				<?php echo $row->title ; ?>
			</td>
			<td class="field_cell">
				<?php echo $postedValue ; ?>
			</td>
		</tr>
	<?php				
	}
	/**
	 * Render hidden field for textbox 
	 *
	 * @param object $row
	 */
	function _renderMultiSelectHidden($row) {
		$name = $row->name ;		
		$postedValue = JRequest::getVar($name, array(), 'post') ;
		for ($i = 0 , $n = count($postedValue) ; $i < $n ; $i++) {
			?>
				<input type="hidden" name="<?php echo $name ; ?>[]" value="<?php echo $postedValue[$i]; ?>" />
			<?php	
		}			
	}				
	/**
	 * Render checkbox list output
	 *
	 * @param object $row
	 */
	function _renderCheckboxListOutput($row) {
	    $optionsPerLine = $row->size ? $row->size : NUMBER_OPTION_PER_LINE ;
		$values = explode("\r\n", $row->values);
		if (isset($_POST[$row->name])) {
			$defaultValues = $_POST[$row->name] ;	
		} else {
			$defaultValues = explode("\r\n", $row->default_values) ;
		}
		?>				
		<table class="os_list" cellspacing="3" cellpadding="3" width="100%">
			<?php
				for ($i = 0 , $n = count($values) ; $i < $n ; $i++) {
					$value = $values[$i] ;
					if ($i % $optionsPerLine == 0) {
					?>
						<tr>
					<?php	
					}					
					?>
						<td>
							<input class="inputbox" value="<?php echo $value; ?>" type="checkbox" name="<?php echo $row->name; ?>[]" <?php if (in_array($value, $defaultValues)) echo ' checked="checked" ' ; ?>><?php echo $value;?>
						</td>	
					<?php	
					if (($i+1) % $optionsPerLine == 0) {
					?>
						</tr>
					<?php	
					}					
				}
				if ($i % $optionsPerLine != 0) {
					$colspan = $optionsPerLine - $i % $optionsPerLine ;
				?>
						<td colspan="<?php echo $colspan; ?>">&nbsp;</td>
					</tr>
				<?php	
				}				
			?>
		</table>																
	<?php			
	}	
	/**
	 * Render checkboxlist in edit mode
	 *
	 * @param object $row
	 */
	function _renderCheckboxListEdit($row, $savedValues) {
	    $optionsPerLine = $row->size ? $row->size : NUMBER_OPTION_PER_LINE ;
		$values = explode("\r\n", $row->values);
		$defaultValues = explode(',', $savedValues) ;
	?>
		<tr>
			<td class="key">
				<?php echo $row->title ; ?>
			</td>
			<td>
				<table cellspacing="3" cellpadding="3" width="100%">
					<?php
						for ($i = 0 , $n = count($values) ; $i < $n ; $i++) {
							$value = $values[$i] ;
							if ($i % $optionsPerLine == 0) {
							?>
								<tr>
							<?php	
							}					
							?>
								<td>
									<input class="inputbox" value="<?php echo $value; ?>" type="checkbox" name="<?php echo $row->name; ?>[]" <?php if (in_array($value, $defaultValues)) echo ' checked="checked" ' ; ?>><?php echo $value;?>
								</td>	
							<?php	
							if (($i+1) % $optionsPerLine == 0) {
							?>
								</tr>
							<?php	
							}					
						}
						if ($i % $optionsPerLine != 0) {
							$colspan = $optionsPerLine - $i % $optionsPerLine ;
						?>
								<td colspan="<?php echo $colspan; ?>">&nbsp;</td>
							</tr>
						<?php	
						}				
					?>
				</table>					
			</td>
		</tr>
	<?php			
	}
	/**
	 * Gender validation for textbox 
	 *
	 * @param object $row
	 */
	function _renderCheckBoxListValidation($row) {				
	?>
		var checked = false ;		
		if (form["<?php echo $row->name; ?>[]"].length) {
			for (var i=0; i < form["<?php echo $row->name; ?>[]"].length; i++) {
				if (form["<?php echo $row->name; ?>[]"][i].checked == true) {
					checked = true ;
					break ;
				}
			}
		} else {
			if (form["<?php echo $row->name; ?>[]"].checked) {
				checked = true ;
			}
		}
		if (!checked) {
			alert("<?php echo $row->title ;?> <?php echo JText::_('OSM_IS_REQUIRED') ; ?>");
			form.<?php echo $row->name; ?>.focus();
			return ;
		}		
	<?php		
	}
	/**
	 * Output values which users selectd in the checkboxlist
	 *
	 * @param object $row
	 */
	function _renderCheckBoxListConfirmation($row) {
	?>
		<tr>
			<td class="title_cell key">
				<?php echo $row->title ; ?>
			</td>
			<td>
				<?php
					$name = $row->name ;
					$postedValue = JRequest::getVar($name, array(), 'post') ;
					echo implode(',',  $postedValue) ;			
				?>
			</td>
		</tr>
	<?php			
	}
	/**
	 * Render hidden field for textbox 
	 *
	 * @param object $row
	 */
	function _renderCheckBoxListHidden($row) {
		$name = $row->name ;		
		$postedValue = JRequest::getVar($name, array(), 'post') ;
		for ($i = 0 , $n = count($postedValue) ; $i < $n ; $i++) {
			$value = $postedValue[$i];
		?>
			<input type="hidden" name="<?php echo $name ; ?>[]" value="<?php echo $value; ?>" />
		<?php			
		}				
	}	
	/**
	 * Render output of radiolist
	 *
	 * @param object $row
	 */
	function _renderRadioListOutput(&$row) {
	    $optionsPerLine = $row->size ? $row->size : NUMBER_OPTION_PER_LINE ;
		$postedValue = JRequest::getVar($row->name, $row->default_values, 'post') ;
		$values = explode("\r\n",  $row->values);		
	?>
		<table cellspacing="3" cellpadding="3" width="100%">
			<?php
				for ($i = 0 , $n = count($values) ; $i < $n ; $i++) {
					$value = $values[$i] ;
					if ($i % $optionsPerLine == 0) {
					?>
						<tr>
					<?php	
					}					
					?>
						<td>
							<input class="inputbox" value="<?php echo $value; ?>" type="radio" name="<?php echo $row->name; ?>" <?php if ($value == $postedValue) echo ' checked="checked" ' ; ?>><?php echo $value;?>
						</td>	
					<?php	
					if (($i+1) % $optionsPerLine == 0) {
					?>
						</tr>
					<?php	
					}					
				}
				if ($i % $optionsPerLine != 0) {
					$colspan = $optionsPerLine - $i % $optionsPerLine ;
				?>
						<td colspan="<?php echo $colspan; ?>">&nbsp;</td>
					</tr>
				<?php	
				}				
			?>
		</table>	
	<?php								
	}	
	/**
	 * Reder radio list in edit mode
	 *
	 * @param object $row
	 * @param string $value
	 */
	function _renderRadioListEdit(&$row, $value) {	
	    $optionsPerLine = $row->size ? $row->size : NUMBER_OPTION_PER_LINE ;
	    $values = explode("\r\n",  $row->values);
	    $postedValue = $value ;
	?>
		<tr>
			<td class="title_cell key"><?php echo $row->title; ?></td>
			<td>
				<table cellspacing="3" cellpadding="3" width="100%">
        			<?php
        				for ($i = 0 , $n = count($values) ; $i < $n ; $i++) {
        					$value = $values[$i] ;
        					if ($i % $optionsPerLine == 0) {
        					?>
        						<tr>
        					<?php	
        					}					
        					?>
        						<td>
        							<input class="inputbox" value="<?php echo $value; ?>" type="radio" name="<?php echo $row->name; ?>" <?php if ($value == $postedValue) echo ' checked="checked" ' ; ?>><?php echo $value;?>
        						</td>	
        					<?php	
        					if (($i+1) % $optionsPerLine == 0) {
        					?>
        						</tr>
        					<?php	
        					}					
        				}
        				if ($i % $optionsPerLine != 0) {
        					$colspan = $optionsPerLine - $i % $optionsPerLine ;
        				?>
        						<td colspan="<?php echo $colspan; ?>">&nbsp;</td>
        					</tr>
        				<?php	
        				}				
        			?>
        		</table>					
			</td>
		</tr>
	<?php		
	}
	/**
	 * Gender validation for RadioList 
	 *
	 * @param object $row
	 */
	function _renderRadioListValidation($row) {
	?>
		var checked = false ;
		if (form.<?php echo $row->name; ?>.length) {
			for (var i=0 ; i < form.<?php echo $row->name; ?>.length ; i++) {
				if (form.<?php echo $row->name; ?>[i].checked == true) {
					checked = true ;
					break ;
				}
			}
		} else {
			if (form.<?php echo $row->name; ?>.checked == true)
				checked = true ;
		}
		if (!checked) {
			alert("<?php echo $row->title . ' '.JText::_('OSM_IS_REQUIRED');?>");
			return ;
		}
	<?php		
	}
	/**
	 * Output values which users entered in the textarea field
	 *
	 * @param object $row
	 */
	function _renderRadioListConfirmation($row) {
		$name = $row->name ;
		$postedValue = JRequest::getVar($name, '', 'post') ;
		?>
			<tr>
				<td class="title_cell key">
					<?php echo $row->title ; ?>
				</td>
				<td class="field_cell">
					<?php echo $postedValue; ?>
				</td>
			</tr>
		<?php
	}
	/**
	 * Render hidden tag for radio list
	 *
	 * @param object $row
	 */		
	function _renderRadioListHidden($row) {
		$name = $row->name ;		
		$postedValue = JRequest::getVar($name, '', 'post') ;		
		?>
			<input type="hidden" name="<?php echo $name ; ?>" value="<?php echo $postedValue; ?>" />
		<?php									
	}					
	/**
	 * Render output of datetime field type
	 *
	 * @param object $row
	 */
	function _renderDateTimeOutput(&$row) {			
		$dateFormat = OSMembershipHelper::getConfigValue('date_format');	
		$postedValue = JRequest::getVar($row->name,  $row->default_values) ;	
		echo JHTML::_('calendar', $postedValue, $row->name, $row->name) ;						
	}
	/**
	 * Render datetime inputbox in edit mode
	 *
	 * @param object $row
	 * @param string $value
	 */
	function _renderDateTimeEdit(&$row, $value) {
		$dateFormat = OSMembershipHelper::getConfigValue('date_format');
		?>
			<tr>
				<td class="title_cell key">
					<?php echo $row->title ; ?>
				</td>
				<td>
					<?php echo JHTML::_('calendar', $value, $row->name, $row->name) ; ?>
				</td>
			</tr>
		<?php
	}	
	/**
	 * Gender validation for RadioList 
	 *
	 * @param object $row
	 */
	function _renderDateTimeValidation($row) {
	?>
		if (form.<?php echo $row->name;?>.value == "") {
			alert("<?php echo $row->title.' '.JText::_('OSM_IS_REQUIRED'); ?>");
			form.<?php echo $row->name; ?>.focus();
			return ;	
		}		
	<?php		
	}
	/**
	 * Output values which users entered in the textarea field
	 *
	 * @param object $row
	 */
	function _renderDateTimeConfirmation($row) {
		$name = $row->name ;
		$postedValue = JRequest::getVar($name, '', 'post') ;
	?>
		<tr>
			<td class="title_cell key">
				<?php echo $row->title ; ?>
			</td>
			<td class="field_cell">	
				<?php echo $postedValue ; ?>
			</td>
		</tr>
	<?php
	}
	/**
	 * Render hidden tag for radio list
	 *
	 * @param object $row
	 */		
	function _renderDateTimeHidden($row) {
		$name = $row->name ;		
		$postedValue = JRequest::getVar($name, '', 'post') ;		
		?>
			<input type="hidden" name="<?php echo $name ; ?>" value="<?php echo $postedValue; ?>" />
		<?php									
	}						
	/**
	 * File upload output
	 *
	 * @param object $row
	 */
	function _renderFileUploadOutput($row) {
		$postedValue = JRequest::getVar($row->name,  $row->default_values) ;
	?>			
		<input type="file" id="<?php echo $row->name ; ?>" name="<?php echo $row->name ; ?>" class="<?php echo $row->css_class; ?>" size="<?php echo $row->size ; ?>" />
		<?php
		if ($postedValue) {
			echo JText::_('PF_OLD_FILE');
			$pos = strpos($postedValue, '_') ;
			$fileName = substr($postedValue, $pos + 1) ;						
		?>
			: <a href="index.php?option=com_pmform&task=download_file&file_name=<?php echo $postedValue; ?>"><?php echo $fileName; ?></a>
			<input type="hidden" name="file_<?php echo $row->name; ?>" value="<?php echo $postedValue; ?>" />
		<?php	
		}		
	}	
	/**
	 * Render textbox when edit a donor
	 *
	 * @param object $row
	 * @param string $value
	 */
	function _renderFileUploadEdit($row, $value) {			
		$mainframe = & JFactory::getApplication() ;
	?>
		<tr>
			<td class="key title_cell">
				<?php echo $row->title ; ?>
				<?php 
					if ($row->required)
						echo '<span class="required">*</span>';									
				?>
			</td>
			<td>
				<input type="file" id="<?php echo $row->name ; ?>" name=<?php echo $row->name; ?> class="inputbox" size="<?php echo $this->size; ?>" />
				<?php
					if ($value) {
						if ($mainframe->isAdmin()) {
							echo 'Uploaded File';		
						} else {
							echo JText::_('OSM_OLD_FILE');
						}	
						$pos = strpos($value, '_') ;
						$showedValue = substr($value, $pos + 1);							
					?>
						: <a href="index.php?option=com_osmembership&task=download_file&file_name=<?php echo $value; ?>"><?php echo $showedValue ; ?></a>
						<input type="hidden" name="file_<?php echo $row->name; ?>" value="<?php echo $value; ?>" />
					<?php	
					}	
				?>	
			</td>
		</tr>
	<?php	
	}	
	/**
	 * Gender validation for textbox 
	 *
	 * @param object $row
	 */
	function _renderFileUploadValidation($row, $id) {
		$value = '';		
		if ($id) {
			$db = & JFactory::getDBO() ;
			$sql = 'SELECT field_value FROM #__osm_field_value WHERE field_id='.$row->id.' AND subscriber_id='.$id;
			$db->setQuery($sql);										
			$value = $db->loadResult();			
		}		
		if (!$value) {
			$value = JRequest::getVar($row->name, '', 'post') ;
		}			
		if ($value)
			return ;
	?>
		if (form.<?php echo $row->name; ?>.value == "") {
			alert("<?php echo $row->title ;?> <?php echo JText::_('OSM_IS_REQUIRED') ; ?>");
			form.<?php echo $row->name; ?>.focus();
			return ;
		}									
	<?php		
	}
	/**
	 * Output values which users entered in the textbox field
	 *
	 * @param object $row
	 */
	function _renderFileUploadConfirmation($row) {		
		jimport('joomla.filesystem.folder') ;
		jimport('joomla.filesystem.file') ;
		$pathUpload = OSMembershipHelper::getConfigValue('path_upload') ;
		if (!JFolder::exists($pathUpload))
			JFolder::create($pathUpload, 0777) ;
		$allowedExtensions = OSMembershipHelper::getConfigValue('allowed_extensions') ;		
		$postedValue = '' ;
		if ($_FILES[$row->name]['name'] != '') {			
			$allowedExtensions =  explode(',', $allowedExtensions) ;
			$fileName = $_FILES[$row->name]['name'] ;
			$fileExt = JFile::getExt($fileName) ;
			if (in_array(strtolower($fileExt), $allowedExtensions)) {
				$targetFileName = time().'_'.$fileName ;
				JFile::upload($_FILES[$row->name]['tmp_name'], $pathUpload.'/'.$targetFileName) ;
				$postedValue = $targetFileName ;
				JRequest::setVar($row->name, $postedValue, 'post') ;
			}
		}elseif (isset($_POST['file_'.$row->name])) {
			$postedValue = $_POST['file_'.$row->name] ;
			JRequest::setVar($row->name, $postedValue, 'post') ;
		}
	?>
		<tr>
			<td class="title_cell key">
				<?php echo $row->title ; ?>
			</td>
			<td>
				<?php			
					$pos = strpos($postedValue, '_') ;
					$postedValue = substr($postedValue, $pos + 1) ;		
					echo $postedValue ;
				?>	
			</td>				
		</tr>
	<?php				
	}	
	/**
	 * Render hidden value for field upload
	 *
	 * @param object $row
	 */
	function _renderFileUploadHidden($row) {
		$name = $row->name ;		
		$postedValue = JRequest::getVar($name, '', 'post') ;		
	?>
		<input type="hidden" name="<?php echo $name ; ?>" value="<?php echo $postedValue; ?>" />
	<?php			
	}		
	/**
	 * Render js validation code
	 *
	 */
	function renderJSValidation() {
		ob_start();		
		for($i=0, $n = count($this->_fields) ; $i < $n ; $i++) {
			$row = $this->_fields[$i] ;
			if ($row->required) {
				switch ($row->field_type) {
					case FIELD_TYPE_TEXTBOX :				
						$this->_renderTextBoxValidation($row);
						break ;
					case FIELD_TYPE_TEXTAREA :						
						$this->_renderTextAreaValidation($row);
						break ;
					case FIELD_TYPE_DROPDOWN :					
						$this->_renderDropdownValidation($row);				
						break ;
					case FIELD_TYPE_CHECKBOXLIST :					
						$this->_renderCheckBoxListValidation($row);
						break ;
					case FIELD_TYPE_RADIOLIST :				
						$this->_renderRadioListValidation($row);
						break ;
					case FIELD_TYPE_DATETIME :					
						$this->_renderDateTimeValidation($row);
						break ;	
					case FIELD_TYPE_MULTISELECT :
						$this->_renderMultiSelectValidation($row);
						break ;
					case FIELD_TYPE_UPLOAD :
						$this->_renderFileUploadValidation($row, 0);
						break ;				
				}
			}				 	
		}
		$output = ob_get_contents();
		ob_end_clean();
		return $output ;
	}	
	/**
	 * Render output in the confirmation page
	 *
	 */
	function renderConfirmation() {
		ob_start();			
		for ($i = 0 , $n = count($this->_fields) ; $i < $n ; $i++) {
			$row = $this->_fields[$i];
			switch ($row->field_type) {
				case FIELD_TYPE_HEADING :
				?>
					<tr>
						<td class="heading" colspan="2">
							<?php echo $row->title ; ?>
						</td>
					</tr>
				<?php	
					break ;	
				case FIELD_TYPE_TEXTBOX :							
					$this->_renderTextboxConfirmation($row);
					break ;
				case FIELD_TYPE_TEXTAREA :								
					$this->_renderTextAreaConfirmation($row);
					break ;
				case FIELD_TYPE_DROPDOWN :								
					$this->_renderDropDownConfirmation($row);				
					break ;
				case FIELD_TYPE_CHECKBOXLIST :								
					$this->_renderCheckBoxListConfirmation($row);
					break ;
				case FIELD_TYPE_RADIOLIST :								
					$this->_renderRadioListConfirmation($row);
					break ;
				case FIELD_TYPE_DATETIME :								
					$this->_renderDateTimeConfirmation($row);
					break ;	
				case FIELD_TYPE_MULTISELECT :
					$this->_renderMultiSelectConfirmation($row);
					break ;
				case FIELD_TYPE_UPLOAD :
					$this->_renderFileUploadConfirmation($row);
					break ;																	
			}																	
		}
		$output = ob_get_contents() ;
		ob_end_clean() ;
		return $output ;
	}				
	/**
	 * Render hidden fields to pass to the next form
	 *
	 */
	function renderHiddenFields() {
		ob_start();
		for($i=0, $n = count($this->_fields) ; $i < $n ; $i++) {
			$row = $this->_fields[$i] ;
			switch ($row->field_type) {
				case FIELD_TYPE_TEXTBOX :					
					$this->_renderTextboxHidden($row);
					break ;
				case FIELD_TYPE_TEXTAREA :						
					$this->_renderTextAreaHidden($row);
					break ;
				case FIELD_TYPE_DROPDOWN :					
					$this->_renderDropdownHidden($row);				
					break ;
				case FIELD_TYPE_CHECKBOXLIST :					
					$this->_renderCheckBoxListHidden($row);
					break ;
				case FIELD_TYPE_RADIOLIST :					
					$this->_renderRadioListHidden($row);
					break ;
				case FIELD_TYPE_DATETIME :					
					$this->_renderDateTimeHidden($row);
					break ;	
				case FIELD_TYPE_MULTISELECT :
					$this->_renderMultiSelectHidden($row);
					break ;	
				case FIELD_TYPE_UPLOAD :
					$this->_renderFileUploadHidden($row);
					break ;			
			}	 		
		}	
		$output = ob_get_contents();		
		ob_end_clean();
		return $output ;
	}			
	/**
	 * Save Field Value 
	 *
	 * @param int $id
	 * @return boolean
	 */
	function saveFieldValues($subscriberId) {
		$db = & JFactory::getDBO();
		$rowFieldValue = & JTable::getInstance('OsMembership', 'FieldValue') ;		
		for ($i = 0, $n = count($this->_fields) ; $i < $n ; $i++) {
			$row = $this->_fields[$i];					
			if ($row->field_type == FIELD_TYPE_HEADING || $row->field_type == FIELD_TYPE_MESSAGE)
				continue ;
			if ($row->is_core == true)
				continue ;	
			$name = $row->name ;	
			if ($row->field_type ==  FIELD_TYPE_UPLOAD) {
				//If there are field, we need to upload the file to server and save it !				
				if (isset($_FILES[$name])) {
					if ($_FILES[$name]['name'] != '') {
						$pathUpload = OSMembershipHelper::getConfigValue('path_upload') ;
						$allowedExtensions = OSMembershipHelper::getConfigValue('allowed_extensions') ;
						$allowedExtensions =  explode(',', $allowedExtensions) ;
						$fileName = $_FILES[$row->name]['name'] ;
						$fileExt = JFile::getExt($fileName) ;
						if (in_array(strtolower($fileExt), $allowedExtensions)) {
							$targetFileName = time().'_'.$fileName ;
							JFile::upload($_FILES[$row->name]['tmp_name'], $pathUpload.'/'.$targetFileName) ;
							$postedValue = $targetFileName ;
							JRequest::setVar($row->name, $postedValue, 'post') ;
						}
					}
				} elseif (!isset($_POST[$row->name])) {
					$hiddenFileName = 'file_'.$row->name ;
					$postedValue = JRequest::getVar($hiddenFileName, '', 'post') ;
					JRequest::setVar($row->name, $postedValue, 'post') ;
				} 
			}									
			$postedValue = JRequest::getVar($name, '', 'post');
			if (is_array($postedValue))
				$postedValue = implode(',', $postedValue);
			$rowFieldValue->id = 0 ;
			$rowFieldValue->field_id = $row->id ;
			$rowFieldValue->subscriber_id = $subscriberId ;
			$rowFieldValue->field_value = $postedValue ; 
			$rowFieldValue->store() ;										
		}
		return true ;
	}
	/**
	 * Render custom fields in edit mode
	 *
	 * @param object $donorId
	 */
	function renderCustomFieldsEdit($subscriberId) {
		$db = & JFactory::getDBO() ;
		$sql = 'SELECT field_id, field_value FROM #__osmembership_field_value WHERE subscriber_id='.(int)$subscriberId ;
		$db->setQuery($sql);		
		$rowFields = $db->loadObjectList() ;		
		$values = array() ;
		for ($i = 0 , $n = count($rowFields) ; $i < $n ; $i++) {
			$rowField = $rowFields[$i] ;
			$values[$rowField->field_id] = $rowField->field_value ;
		}									
		ob_start();		
		for ($i = 0 , $n = count($this->_fields) ; $i < $n ; $i++) {
			$row = $this->_fields[$i];
			if ($row->is_core)
				continue ;				
			if (isset($values[$row->id]))
				$value = $values[$row->id];
			else 
				$value = '' ;	
			switch ($row->field_type) {
				case FIELD_TYPE_HEADING :
					?>
						<tr>
							<td colspan="2" class="key">
								<?php echo $row->title ; ?>
							</td>
						</tr>
					<?php
					break ;
				case FIELD_TYPE_TEXTBOX :							
					$this->_renderTextBoxEdit($row, $value);
					break ;
				case FIELD_TYPE_TEXTAREA :								
					$this->_renderTextareaEdit($row, $value);
					break ;
				case FIELD_TYPE_DROPDOWN :							
					$this->_renderDropdownEdit($row, $value);				
					break ;
				case FIELD_TYPE_CHECKBOXLIST :							
					$this->_renderCheckboxListEdit($row, $value);
					break ;
				case FIELD_TYPE_RADIOLIST :									
					$this->_renderRadioListEdit($row, $value);
					break ;
				case FIELD_TYPE_DATETIME :							
					$this->_renderDateTimeEdit($row, $value);
					break ;	
				case FIELD_TYPE_MULTISELECT :
					$this->_renderMultiSelectEdit($row, $value);
					break ;	
				case FIELD_TYPE_UPLOAD :
					$this->_renderFileUploadEdit($row, $value);
					break ;						
			}																
		}
		$output = ob_get_contents() ;
		ob_end_clean();
		return $output ;								
	}
	/**
	 * Get output for one field
	 *
	 * @param object $row
	 */
	function getFieldOutput($row) {
		ob_start() ;
		switch ($row->field_type) {
			case FIELD_TYPE_HEADING :
				echo $row->title ;
				break ;
			case FIELD_TYPE_MESSAGE :
				echo $row->description ;
				break ;	
			case FIELD_TYPE_TEXTBOX :					
				$this->_renderTextBoxOutput($row);
				break ;
			case FIELD_TYPE_TEXTAREA :						
				$this->_renderTextareaOutput($row);
				break ;
			case FIELD_TYPE_DROPDOWN :					
				$this->_renderDropdownOutput($row);				
				break ;
			case FIELD_TYPE_CHECKBOXLIST :					
				$this->_renderCheckboxListOutput($row);
				break ;
			case FIELD_TYPE_RADIOLIST :					
				$this->_renderRadioListOutput($row);
				break ;
			case FIELD_TYPE_DATETIME :					
				$this->_renderDateTimeOutput($row);
				break ;	
			case FIELD_TYPE_MULTISELECT :
				$this->_renderMultiSelectOutput($row);
				break ;
			case FIELD_TYPE_UPLOAD :
				$this->_renderFileUploadOutput($row);
				break ;				
		}
		$output = ob_get_contents();
		ob_end_clean() ;
		return $output ;
	}			
	/**
	 * Render countrylist Dropdown
	 *
	 */
	function _renderCountry($row) {
		$db = & JFactory::getDBO() ;
		$country = JRequest::getVar('country', $row->default_values ? $row->default_values : OSMembershipHelper::getConfigValue('default_country'), 'post') ;
		$sql  = 'SELECT name AS value, name AS text FROM #__osmembership_countries WHERE published = 1 ORDER BY name';
		$db->setQuery($sql);
		$rowCountries = $db->loadObjectList();
		$options = array();
		$options[] = JHTML::_('select.option', '', JText::_('OSM_SELECT_COUNTRY'));
		$options = array_merge($options, $rowCountries);		
		
		echo JHTML::_('select.genericlist', $options, 'country' ,'', 'value', 'text', $country);
	}
	/**
	 * Render custom field value
	 * @param int $subscriberId
	 */
	function renderCustomFieldsValue($subscriberId) {
		$db = & JFactory::getDBO() ;
		$sql = 'SELECT field_id, field_value FROM #__osmembership_field_value WHERE subscriber_id='.(int)$subscriberId ;
		$db->setQuery($sql);
		$rowFields = $db->loadObjectList() ;
		$values = array() ;
		for ($i = 0 , $n = count($rowFields) ; $i < $n ; $i++) {
			$rowField = $rowFields[$i] ;
			$values[$rowField->field_id] = $rowField->field_value ;
		}
		ob_start();
		for ($i = 0 , $n = count($this->_fields) ; $i < $n ; $i++) {
			$row = $this->_fields[$i];
			if ($row->is_core)
				continue ;
			if (isset($values[$row->id]))
				$value = $values[$row->id];
			else
				$value = '' ;
			switch ($row->field_type) {
				case FIELD_TYPE_HEADING :
					?>
					<tr>
						<td colspan="2" class="key">
							<?php echo $row->title ; ?>
						</td>
					</tr>
				<?php
				break ;
				default :
				?>
					<tr>
						<td class="key title_cell">
							<?php echo $row->title ; ?>
						</td>
						<td class="field_cell">
							<?php echo $value ; ?>
						</td>
					</tr>
				<?php	
				break;				
			}																
		}
		$output = ob_get_contents() ;
		ob_end_clean();
		return $output ;		
	}	
}
?>