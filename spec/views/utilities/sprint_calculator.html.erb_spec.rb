require 'rails_helper'

describe 'utilities/sprint_calculator.html.erb', :type => :view do
  let(:page) { Capybara::Node::Simple.new(rendered) }
  subject { page }

  before do
    render
  end

  pending 'view content test'
end
