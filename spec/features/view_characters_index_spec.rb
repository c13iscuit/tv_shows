require 'rails_helper'


feature 'View characters', %Q{
  As a site visitor
  I want to view a list of people's favorite TV characters
  So I can find wonky characters to watch
  The character's name and the TV show it is associated with are listed
  } do


  scenario "I can see a list of all the characters" do

    attrs = {
      title: 'Game of Thrones',
      network: 'HBO',
      years: '2011-',
      synopsis: 'Seven noble families fight for control of the mythical land of Westeros.'
    }

    show = TelevisionShow.create!(attrs)

    attrs = {
      name: 'Jon Snow',
      actor_name: 'Kit Harington',
      description: 'The pouty one',
      show_id: show.id
    }

    character = Character.create!(attrs)

    binding.pry

    visit "/characters"

    expect(page).to have_content "Jon Snow"
    expect(page).to have_content "Game of Thrones"
    expect(page).to have_content "Kit Harington"
  end

end
