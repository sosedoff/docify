require 'spec_helper'

describe 'Docify' do
  it 'should validate format' do
    Docify::FORMATS.each { |f| Docify.valid_format?(f).should == true }
    Docify.valid_format?('txt').should == false
  end
  
  it 'should detect valid format' do
    README_FILES.each do |k,v|
      Docify.detect_format(k).should == v
    end
  end
  
  it 'should render markup directly' do
    {
      'README.markdown' => 'markdown',
      'README.rdoc'     => 'rdoc',
      'README.textile'  => 'textile'
    }.each_pair do |k,v|
      Docify.render(fixture(k), v).should == fixture(k + ".html")
    end
  end
end