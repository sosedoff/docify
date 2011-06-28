require 'spec_helper'

describe 'Template' do
  it 'should raise ArgumentError if no template were provided' do
    proc { Docify::Template.new }.should raise_error ArgumentError
    proc { Docify::Template.new(" ") }.should raise_error ArgumentError
  end
  
  it 'should render a valid content' do
    Docify::Template.new("{{a}}{{b}}").render(:a => 'a', :b => 'b').should == 'ab'
    Docify::Template.new("{{a}}{{b}}").render('a' => 'a', 'b' => 'b').should == 'ab'
  end
end
