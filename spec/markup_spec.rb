require 'spec_helper'

describe 'Docify::Markup' do
  it 'should render RDoc' do
    Docify::Markup.rdoc(fixture('README.rdoc')).should == fixture('README.rdoc.html')
  end
  
  it 'should render Markdown' do
    Docify::Markup.markdown(fixture('README.markdown')).should == fixture('README.markdown.html')
  end
  
  it 'should render Textile' do
    Docify::Markup.textile(fixture('README.textile')).should == fixture('README.textile.html')
  end

  context 'with flavored content' do
    it 'should render pre with language class' do
      doc = Docify::Markup.markdown(fixture('flavored.md'))
      doc.include?('<pre class="code-lang1">').should be_true
      doc.include?('<pre class="code-lang2">').should be_true
    end
  end
end
