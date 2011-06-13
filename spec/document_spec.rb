require 'spec_helper'

describe 'Document' do
  it 'should raise exception on invalid input file' do
    proc { Docify::Document.new('qwe123')}.should raise_error ArgumentError, "File [qwe123] does not exist!"
    proc { Docify::Document.new('/tmp') }.should raise_error ArgumentError, "File required!"
  end
  
  it 'should render correct layout' do
    doc = Docify::Document.new('README.rdoc')
    output = doc.render('rdoc')
    output.should match(/<meta http-equiv="Content-Type" content="text\/html; charset=UTF-8" \/>/)
    output.should match(/<title>README.rdoc<\/title>/)
  end
  
  it 'should raise an exception on invalid output path' do
    doc = Docify::Document.new('README.rdoc')
    doc.render('rdoc')
    proc { doc.save_to('~/blah') }.should raise_error ArgumentError, "Output path does not exist!"
    proc { doc.save_to('/tmp') }.should raise_error ArgumentError, "Output path should be a file!"
  end
end