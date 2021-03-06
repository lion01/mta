<?php

/**                               ______________________________________________
*                          o O   |                                              |
*                 (((((  o      <    Generated with Cook Self Service  V1.5.2   |
*                ( o o )         |______________________________________________|
* --------oOOO-----(_)-----OOOo---------------------------------- www.j-cook.pro --- +
* @version		1.0.0
* @package		Travel
* @subpackage	Packages
* @copyright	Copyright 2012, All rights reserved
* @author		Edward Khor - www.enfonius.com - edward@enfonius.com
* @license		GNU/GPL
*
* /!\  Joomla! is free software.
* This version may have been modified pursuant to the GNU General Public License,
* and as distributed it includes or is derivative of works licensed under the
* GNU General Public License or other free or open source software licenses.
*
*             .oooO  Oooo.     See COPYRIGHT.php for copyright notices and details.
*             (   )  (   )
* -------------\ (----) /----------------------------------------------------------- +
*               \_)  (_/
*/

defined('_JEXEC') or die('Restricted access'); ?>

<script language="javascript" type="text/javascript">
<!--


function resetFilters()
{
	if (typeof(jQuery) != 'undefined')
	{
		jQuery('.filters :input').val('');

	/* TODO : Uncomment this if you want that the reset action proccess also on sorting values
		jQuery('#filter_order').val('');
		jQuery('#filter_orderDir').val('');
	*/
		document.adminForm.submit();
		return;
	}

//Deprecated
	if ($('filter_search') != null)
	    $('filter_search').value='';
	if ($('filter_creation_date_from') != null)
		$('filter_creation_date_from').value='';
	if ($('filter_creation_date_to') != null)
		$('filter_creation_date_to').value='';
	if ($('filter_published') != null)
	    $('filter_published').value='';


/* TODO : Uncomment this if you want that the reset action proccess also on sorting values
	if ($('filter_order') != null)
	    $('filter_order').value='';
	if ($('filter_orderDir') != null)
	    $('filter_orderDir').value='';
*/

	document.adminForm.submit();
}

-->
</script>


<fieldset id="filters" class="filters">
	<legend><?php echo JText::_( "JSEARCH_FILTER_LABEL" ); ?></legend>



	<div style="float:right;">
		<div style="float:left">
			<!-- SEARCH : filter_search : search on Title  -->

				<div class='search filter filter_search'>

					<?php echo JDom::_('html.form.input.search', array(
											'domID' => 'filter_search',
											'dataKey' => 'filter_search',
											'dataValue' => $this->filters['search']->value,
											'label' => 'TRAVEL_FILTER_SEARCH_SEARCH_TITLE'
												));


						?>
				</div>


		</div>
		<div style="float:left">
				<div class="filter filter_buttons">
					<button onclick="this.form.submit();"><?php echo(JText::_("JSEARCH_FILTER_SUBMIT")); ?></button>
					<button onclick="resetFilters()"><?php echo(JText::_("JSEARCH_FILTER_CLEAR")); ?></button>
				</div>
		</div>
	</div>

	<div>
		<div style="float:left">
			<!-- RANGE : Creation Date  -->

				<div class='filter range filter_creation_date'>
		

					<?php echo JDom::_('html.form.input.range', array(
												'rangeNameSpace' => 'html.form.input.calendar',
												'dataKey' => 'filter_creation_date',
												'dataValueFrom' => $this->filters['creation_date']->from,
												'dataValueTo' => $this->filters['creation_date']->to,
												'labelFrom' => "TRAVEL_JSEARCH_CREATION_DATE_FROM",
												'labelTo' => "TRAVEL_JSEARCH_TO",
												'size' => 10,
												'alignHz' => true,
												'styles' => array('width' => '80px'),
												'dateFormat' => '%Y-%m-%d'
													));
					?>
				</div>


		</div>
		<div style="float:left">
			<!-- SELECT : Published  -->

					<div class='filter filter_published'>
			
						<?php
						$choices = array();
						$choices[] = array("value" => null, 'text'=>JText::_( "TRAVEL_FILTER_NULL_PUBLISHED" ));
						$choices[] = array("value" => '0', 'text'=>JText::_( "JNO" ));
						$choices[] = array("value" => '1', 'text'=>JText::_( "JYES" ));

						echo JDom::_('html.form.input.select', array(
											'dataKey' => 'filter_published',
											'dataValue' => $this->filters['published']->value,
											'list' => $choices,
											'listKey' => 'value',
											'labelKey' => 'text',
											'submitEventName' => 'onchange'
												));

						?>
					</div>


		</div>
	</div>




	<div clear='all'></div>





</fieldset>
