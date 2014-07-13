require 'rails_helper'


RSpec.describe Link, :type => :model do
  it "will test the standardize_target_url" do

    link = Link.new(:slug => 'test', :target_url => 'http://example.com')
    link.standardize_target_url!

    expect(link.target_url).to eq('example.com')
  end

it 'should standardize target_url by removing https://' do
    link = Link.new(:slug => 'test', :target_url => 'https://example.com')
    link.standardize_target_url!

    expect(link.target_url).to eq('example.com')
  end

  it "should count the number of visits to a link" do

    link = Link.create(:slug => 'test', :target_url => 'https://example.com')
    10.times do
      link.visits.create
    end

    expect(link.visit_count).to eq(10)
  end

end
