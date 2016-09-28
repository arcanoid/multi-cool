require 'rails_helper'

describe 'data_generations/geographical_sample_data.html.erb', :type => :view do
  let(:page) { Capybara::Node::Simple.new(rendered) }
  subject { page }

  before do
    render
  end

  pending 'view content test'
end
