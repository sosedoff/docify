module Docify
  TEMPLATE = <<END_TEMPLATE
<!DOCTYPE html> 
<html>
  <head>
    <title>{{title}}</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" /> 
    {{css}}
  </head>
  <body>
    <div id="content">{{content}}</div>
    <!-- Generated with Docify v{{version}} -->
  </body>
</html>
END_TEMPLATE
  
  CSS = <<END_CSS
<style>
  body {
    background: #f8f8f8;
    font: 13.34px helvetica,arial,freesans,clean,sans-serif;
  }
  
  body * { line-height: 1.4em; }
  
  a { color: #4183C4; text-decoration: none; }
  a:hover { text-decoration: underline; }
  
  #content {
    width: 800px; margin: 0px auto;
  }
  
  p {
    margin: 1em 0!important;
    line-height: 1.5em!important;
  }
  
  h1, h2, h3, h4, h5, h6 { border: 0 !important; }
  
  h1 {
    font-size: 170%!important;
    border-top: 4px solid #AAA!important;
    padding-top: .5em!important;
    margin-top: 1.5em!important;
  }
  
  h1:first-child { border-top: none !important; }
  
  h2 { 
    font-size: 150% !important;
    margin-top: 1.5em !important;
    border-top: 4px solid #E0E0E0 !important;
    padding-top: .5em !important;
  }
  
  h3 { margin-top: 1em !important; }
  
  pre, code {
    font: 12px 'Bitstream Vera Sans Mono','Courier',monospace;
  }
  
  pre {
    margin: 1em 0;
    font-size: 12px;
    background-color: #eee;
    border: 1px solid #ddd;
    padding: 5px;
    line-height: 1.5em;
    color: #444;
    overflow: auto;
    -webkit-box-shadow: rgba(0,0,0,0.07) 0 1px 2px inset;
    -webkit-border-radius: 3px;
    -moz-border-radius: 3px;
    border-radius: 3px;
  }
  
  code {
    font-size: 12px !important;
    background-color: ghostWhite !important;
    color: #444 !important;
    padding: 0 .2em !important;
    border: 1px solid #DEDEDE !important;
  }
  
  pre code {
    padding: 0!important;
    font-size: 12px!important;
    background-color: #EEE!important;
    border: none!important;
  }
</style>
END_CSS
end