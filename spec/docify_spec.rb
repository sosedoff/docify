require 'spec_helper'

describe 'Docify' do
  it 'should create a document via shorthand' do
    Docify.new(fixture_path('README.markdown')).should be_a Docify::Document
  end
  
  it 'should render markup directly' do
    files = {
      'README.markdown' => :markdown,
      'README.rdoc'     => :rdoc,
      'README.textile'  => :textile
    }
    
    files.each_pair do |k,v|
      Docify.render(fixture(k), v).should == fixture(k + ".html")
      Docify.render(fixture(k), v.to_s).should == fixture(k + ".html")
      Docify.send(v, fixture(k)).should == fixture(k + ".html")
    end
  end
  
  it 'should raise invalid markup error' do
    proc { Docify.render(fixture('README.markdown'), :foobar) }.
      should raise_exception ArgumentError, "Invalid markup: foobar."
  end
  
  it 'should render markup based on format detected from filename' do
    data = Docify.render_auto(fixture('README.markdown'), 'README.markdown')
    data.should == fixture('README.markdown.html')
    
    data = Docify.render_auto(fixture('README.markdown'), 'README.foo')
    data.should == fixture('README.markdown')
  end

  it 'should render flavored markup' do
    data = Docify.render_auto(fixture('flavored.md', 'flavored.md'))
    data.include?('<pre class="code-lang1">').should be_true
    data.include?('<pre class="code-lang2">').should be_true
  end
end

describe 'Hash' do
  it 'should strinfigy keys' do
    {:a => 'a', :b => 'b'}.stringify_keys.should == {'a' => 'a', 'b' => 'b'}
    
    hash = {:a => 'a', :b => 'b'}
    hash.stringify_keys!
    hash.should == {'a' => 'a', 'b' => 'b'}
  end
end
