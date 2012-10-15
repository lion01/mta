<?php
/*------------------------------------------------------------------------
# mod_bgmax - Custom parameter for bgMax
# Color selector based on http://jscolor.com
# ------------------------------------------------------------------------
# author    lomart
# copyright : Copyright (C) 2011 lomart.fr All Rights Reserved.
# @license  : http://www.gnu.org/licenses/gpl-2.0.html GNU/GPL
# Website   : http://lomart.fr
# Technical Support:  Forum - http://forum.joomla.fr
-------------------------------------------------------------------------*/
// no direct access
defined('_JEXEC') or die( 'Restricted access' );

class JFormFieldJsColor extends JFormField
{
    protected $type = 'jscolor';

    protected function getInput()
    {
        $path = 'modules/mod_bgmax/elements/jscolor/';
        JHTML::_('script', 'jscolor.js', $path);
      
        $html = '<input class="color {';
        $html.= 'required:false,';  // empty possible
        //$html.= 'adjust:false,';    // every value is possible
        //$html.= 'pickerMode:\'HSV\',';    // every value is possible
        $html.= 'pickerPosition:\'top\',';    // or left / right / top
        $html.= 'pickerBorder:2,pickerInset:3,';    // or right / top
        $html.= 'hash:true';        // # behind value
        $html.= '}" type="text" value="'.$this->value.'" name="'.$this->name.'" />';
        return $html;

    }
}


