# Docify

Docify allows you to render your markup files (Rdoc/Markup/Textile) into nice-looking html files.

Produced result looks similar to GitHub's README and other doc files.

## Dependencies

- rdoc
- rdiscount
- RedCloth

## Installation

    gem install docify

## Usage

    require 'docify'

    doc = Docify::Document.new('path/to/file.md')

    # Renders text with markdown
    doc.render('markdown')

    # Renders text with markdown without css styling
    doc.render('markdown', false)

    # Save rendered content into the file
    doc.save_to('/path/to/output.html')

    # Inline usage (no styles)
    Docify.render('content', 'markdown')
  
## Terminal usage
  
  Usage: docify [options] FILE
      -l, --list                       List of all formats
      -f, --format FORMAT              Render as format
          --no-css                     Disable css styling
      -o, --output=PATH                Output file path
      -h, --help                       Show this information
  
By default docify will output result to terminal:

    docify YOUR_FILE.rdoc  
    >> ...... rendered content
  
To save results just pass --output with filename

    docify YOUR_FILE.rdoc --output ~/Desktop/file.html
  
Or use regular piping:

    docify YOUR_FILE.rdoc > ~/Desktop/file.html
  
Format will be automatically detected from filename. But if you need to force your format just type:

    docify YOUR_FILE.rdoc --format textile
  
## License

Copyright © 2011 Dan Sosedoff.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.