require 'rails_helper'
require 'spec_helper'

RSpec.describe Person, type: :model do

  describe "Person validations" do

    it "must have height entry" do
      person = Person.create(height:"")
      expect(person.errors.messages[:height]).to include("Please try again")
    end

    it "must have weight entry" do
      person = Person.create(weight:"")
      expect(person.errors.messages[:weight]).to include("Please try again")
    end

    it "must have gender entry" do
      person = Person.create(gender:"")
      expect(person.errors.messages[:gender]).to include("can't be blank")
    end

    it "must have height entry greater than zero" do
      person = Person.create(height: 0)
      expect(person.errors.messages[:height]).to include("must be greater than 0")
    end

    it "must have weight entry greater than zero" do
      person = Person.create(weight: 0)
      expect(person.errors.messages[:weight]).to include("must be greater than 0")
    end

  end

end
