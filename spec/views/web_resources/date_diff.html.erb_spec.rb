require 'rails_helper'

describe 'web_resources/date_diff.html.erb', :type => :view do
  let(:page) { Capybara::Node::Simple.new(rendered) }
  subject { page }

  before do
    render
  end

  pending 'view content test'
end
