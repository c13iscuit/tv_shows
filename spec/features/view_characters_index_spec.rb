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

    show = TelevisionShow.new(attrs)
    show.save

    attrs = {
      name: 'Jon Snow',
      actor_name: 'Kit Harington',
      description: 'The pouty one',
      show_id: show.id
    }

    character = Character.new(attrs)
    character.save

    visit "/characters"

    expect(page).to have_content character.name
    expect(page).to have_content show.title
    expect(page).to have_content character.actor_name
  end

end
