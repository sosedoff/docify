require 'spec_helper'

describe 'Docify::Document' do
  it 'should raise an exception on invalid input file' do
    proc { Docify::Document.new('qwe123')}.should raise_error ArgumentError, "File [qwe123] does not exist!"
    proc { Docify::Document.new('/tmp') }.should raise_error ArgumentError, "File required!"
  end
  
  it 'should auto-detect format from filename' do
    README_FILES.each_pair do |k,v|
      Docify::Document.new(fixture_path(k)).format.should == v
    end
  end
  
  it 'should raise an exception on invalid format' do
    proc { Docify::Document.new(fixture_path('README.markdown')).render(:format => 'foobar') }.
      should raise_error ArgumentError, "Invalid format: foobar"
  end
  
  it 'should raise an exception on invalid output path' do
    doc = Docify::Document.new(fixture_path('README.markdown'))
    doc.render(:format => :markdown)
    proc { doc.save_to('~/blah') }.should raise_error ArgumentError, "Output path does not exist!"
    proc { doc.save_to('/tmp') }.should raise_error ArgumentError, "Output path should be a file!"
  end
  
  it 'should render content with styles' do
    doc = Docify::Document.new(fixture_path('README.markdown'))
    output = doc.render
    output.should match(/<meta http-equiv="Content-Type" content="text\/html; charset=UTF-8" \/>/)
    output.should match(/<title>README.markdown<\/title>/)
    output.should match(/<style>/)
  end
  
  it 'should render content with no styles' do
    doc = Docify::Document.new(fixture_path('README.markdown'))
    output = doc.render(:html => false, :css => false)
    output == Docify::Markup.markdown(fixture('README.markdown'))
  end
end