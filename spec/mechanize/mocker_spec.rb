require 'spec_helper'

describe Mechanize do

  let(:mechanize) { Mechanize.new }
  
  it 'has a version number' do
    expect(mechanize.get('http://www.infobae.com/')).not_to be nil
    expect(mechanize.get('http://ovi.despegar.com/ovi/')).not_to be nil
  end

  it 'has a version number' do
    expect(mechanize.get('http://ovi.despegar.com/ovi/')).not_to be nil
  end

end
