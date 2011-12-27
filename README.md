# Print Div JQuery Script


## Print Div JQuery Script

https://github.com/dorajistyle/print_div_script

It's a simple print div Jquery Script


### Installation
* Put this script(coffeescript or javascript) file into your javascript library.

**NOTE:** This script is using Jquery library(http://jquery.com).          

----

### Usage

#### print_div(div_id, stylesheet[](optional), title_of_div(optional))

Examples

    // Print div
	print_div('my_div')

    // Print div with title and stylesheet
	styleSheets = []
	styleSheets.push("http://"+window.location.host+'/assets/print_div.css')
	styleSheets.push("http://"+window.location.host+'/assets/print_div2.css')
	title = $("#print_title").html()
	print_div("my_div",styleSheets, title)


#### print_div_iframe(div_id, stylesheet[](optional),title_of div(optional),print_confirm_text(optional))

**NOTE:** If you want to use this function, You require JqueryUI library(http://jqueryui.com/).

Examples
	
	// Print div using JQueryUI Dialog
	print_div_iframe('my_div')

	// Print div using JQueryUI Dialog with title and stylesheet
	styleSheets = []
	styleSheets.push("http://"+window.location.host+'/assets/print_div.css')
	styleSheets.push("http://"+window.location.host+'/assets/print_div2.css')
	title = $("#print_title").html()
	print_div_iframe("my_div",styleSheets,title,"Print Confirm")

________________________

## Attributions

This Jquery Script was made by [JoongSeob Vito Kim](http://www.dorajistyle.pe.kr/p/about-me.html). 
It's under the MIT license.