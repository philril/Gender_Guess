require 'rails_helper'

RSpec.describe "guess/index.html.erb", :type => :view do

  it "Renders title" do
    render
    expect(rendered).to include("Gender Guess")
  end

  it "Renders guess input" do
    render
    expect(rendered).to include('<form class="simple_form input-group center"')
  end

end

RSpec.describe "guess/_new_guess.html.erb", :type => :view do

  it "Renders guess" do
    render
    expect(rendered).to include("My guess is")
  end

  it "Renders yes/no buttons" do
    render
    expect(rendered).to include('<form class="button_to"')
  end

end

RSpec.describe "guess/results.html.erb", :type => :view do

  it "Renders 'Retry' button" do
    render
    expect(rendered).to include('<a class="btn btn-default btn-primary" href="/">Retry</a>')
  end

end
