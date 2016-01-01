class FactsController < ApplicationController
  def random_facts
    @facts = RandomFacts::Generator.process( {:size => 20} )
  end

  def this_day_in_history
    @facts = FactsByDate::Generator.facts_for_today
  end
end