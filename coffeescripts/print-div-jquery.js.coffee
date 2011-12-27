# Print Div JQuery Script
# https://github.com/dorajistyle/print_div_script
# It's a simple print div Jquery Script
# by dorajistyle (http://dorajistyle.pe.kr)

# print_div(div_id, stylesheet[](optional), title of div(optional))
# It's a simple print div JQuery script.
# Examples
# print_div('my_div')
# styleSheets = []
# styleSheets.push("http://"+window.location.host+'/assets/print_div.css')
# styleSheets.push("http://"+window.location.host+'/assets/print_div2.css')
# title = $("#print_title").html()
# print_div("my_div",styleSheets, title)
@print_div = print_div = (id,styleSheets,title) ->
  if(!title?)
    title = ''
  css=""
  if(styleSheets?)
    for style in styleSheets
      css+= "<link rel='stylesheet' type='text/css' media='all' href='#{style}' />"
  div = $( "#"+id ).html()
  title_tag=("<TITLE>#{title}</TITLE>")
  head = title_tag+css
  contents=''
  contents+= div
  contents+='</body></HTML>'
  pwin=window.open('','print_div','left=10%,top=15%,width=640,height=480')
  $(pwin.document.head).replaceWith(head)
  $pbody = $(pwin.document.body);
  $pbody.replaceWith(contents)
  $(pwin.window).load '', () ->
    $.when(pwin.window.focus(),
    pwin.window.print()).done '', () ->
      pwin.window.close()
      return true

# print_div_iframe(div_id, stylesheet[](optional),title of div(optional),print_confirm_text(optional))
# It's a simple print div JQuery script.
#
# Examples
# print_div_iframe('my_div')
#
# styleSheets = []
# styleSheets.push("http://"+window.location.host+'/assets/print_div.css')
# styleSheets.push("http://"+window.location.host+'/assets/print_div2.css')
# title = $("#print_title").html()
# print_div_iframe("my_div",styleSheets,title,"Print Confirm")
@print_div_iframe = print_div_iframe = (id,styleSheets,title,confirm_text) ->
  if(!confirm_text?)
    confirm_text = 'Print This'
  if $("#pframe").length is 0
    $('<div />', {
      id: 'pbox',
      name: 'pbox'
      style: 'overflow:hidden;'
    }).appendTo('body')
    $pbox = $( "#pbox" )
    $('<input />', {
      type: 'button',
      id:   'print_confirm',
      value: confirm_text
    }).appendTo($pbox)
    $('<iframe />', {
      name: 'pframe',
      id:   'pframe',
      width: '100%',
      height: '100%',
      minHeight: '480',
      marginWidth: '0',
      marginHeight: '0',
      frameBorder: '0',
      scrolling: 'auto',
      title: title
    }).appendTo($pbox)
  if(!title?)
    title = ''
  css=""
  if(styleSheets?)
    for style in styleSheets
      css+= "<link rel='stylesheet' type='text/css' media='all' href='#{style}' />"
  div = $( "#"+id ).html()
  $pConfirm = $("#print_confirm")
  title_tag=("<html><head><TITLE>#{title}</TITLE>")
  head = title_tag+css+"<script type='text/javascript'>function printPage() { print(); }
</script></head>"
  contents="<body>"
  if($.browser.msie or $.browser.opera)
    contents+="<input id='print_final' type='button' onclick='b=document.getElementById(\"print_final\");b.style.display=\"none\";b.style.visibility=\"hidden\";focus();print();' value='Print #{title}'><br/>"
    $pConfirm.addClass('hidden')
  contents+= div
  contents+="</body></HTML>"
  $pbox = $( "#pbox" )
  $pFrame = $("#pframe")
  $pbox.dialog({title:title,autoOpen: false,modal:true,width:800,minHeight:600,height:600,resizable: false,draggable:false})
  open = () ->
    $.when(frame_contents = $pFrame.contents()).done '', () ->
      $phead = frame_contents.find('head')
      $pbody = frame_contents.find('body')
      $phead.replaceWith(head)
      $pbody.replaceWith(contents)
      $pbox.dialog('open')
      $pConfirm.unbind()
      $pConfirm.bind 'click', () ->
        $.when(pwin = $pFrame[0].contentWindow).done '', () ->
          pwin.focus()
          pwin.print()
  setTimeout(open,'100')