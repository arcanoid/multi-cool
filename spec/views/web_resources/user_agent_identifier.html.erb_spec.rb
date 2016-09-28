require 'rails_helper'

describe 'web_resources/user_agent_identifier.html.erb', :type => :view do
  let(:page) { Capybara::Node::Simple.new(rendered) }
  subject { page }

  before do
    render
  end

  pending 'view content test'
end
