require 'rails_helper'

  feature 'Delete a character', %Q{
As a site visitor
I want to delete a character I don't like
So no one else will want to watch that character} do

  scenario "I can delete a character from the database
    If the record is successfully deleted, I receive an notice that it was deleted" do

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
      description: 'The pouty one'
    }

    character = Character.create!(attrs)

    visit "/television_shows/#{show.id}/characters/#{character.id}"

    click_on 'Delete'

    expect(page).to_not have_content "Jon Snow"
    expect(page).to have_content "deleted"
  end

end
