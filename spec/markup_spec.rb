require 'spec_helper'

describe Docify::Markup do
  it 'should render RDoc' do
    Docify::Markup.render('README.rdoc', fixture('README.rdoc')).should == fixture('README.rdoc.html')
  end
  
  it 'should render Markdown' do
    Docify::Markup.render('README.markdown', fixture('README.markdown')).should == fixture('README.markdown.html')
  end
  
  it 'should render Textile' do
    Docify::Markup.render('README.textile', fixture('README.textile')).should == fixture('README.textile.html')
  end
end