module Docify
REGEX = /(\{\{([a-z\-\_]{1,})\}\})/i
  
  TEMPLATE = <<END_TEMPLATE
<html>
  <head>
    <title>{{title}}</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" /> 
    {{css}}
  </head>
  <body>
    <div id="content">{{content}}</div>
    <!-- Generated with Docify -->
  </body>
</html>
END_TEMPLATE
  
  CSS = <<END_CSS
<style>
  body {
    background: #fff;
    font: 13.34px helvetica,arial,freesans,clean,sans-serif;
  }
  #content { width: 80%; margin: 0px auto; }
  pre {
    margin: 1em 0;
    font-size: 12px;
    background-color: #eee;
    border: 1px solid #ddd;
    padding: 5px;
    line-height: 1.5em;
    color: #444;
    overflow: auto;
    -webkit-box-shadow:rgba(0,0,0,0.07) 0 1px 2px inset;
    -webkit-border-radius:3px;
    -moz-border-radius:3px;
    border-radius:3px;
  }
</style>
END_CSS
end