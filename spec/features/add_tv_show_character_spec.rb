require 'rails_helper'

feature 'Add a character', %Q{
  As a site visitor
  I want to view the details for a TV show
    So I can learn more about it
  I want to add my favorite TV show characters
    So that other people can enjoy their crazy antics
  } do

  scenario "I can see a the show's title, network, the years it ran, and a synopsis
  For each character, I can see the character's name, actor's name, and the character's description" do

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

    visit "/television_shows/#{show.id}"

    expect(page).to have_content "Game of Thrones"
    expect(page).to have_content "HBO"
    expect(page).to have_content "Westeros"
    expect(page).to have_content "2011"
    expect(page).to have_content "Jon Snow"
    expect(page).to have_content "Kit Harington"
    expect(page).to have_content "pouty"
  end


  scenario "I can access a form to add a character on a TV show's page" do
    attrs = {
      title: 'Game of Thrones',
      network: 'HBO',
      years: '2011-',
      synopsis: 'Seven noble families fight for control of the mythical land of Westeros.'
    }

    show = TelevisionShow.create!(attrs)

    visit "/television_shows/#{show.id}"

    expect(page).to have_content "Add a character"
  end

  scenario "I must specify the character's name and the actor's name.
    I can optionally provide a description.
    If I do not provide the required information, I receive an error message" do
    attrs = {
      title: 'Game of Thrones',
      network: 'HBO',
      years: '2011-',
      synopsis: 'Seven noble families fight for control of the mythical land of Westeros.'
    }

    show = TelevisionShow.create!(attrs)

    visit "/television_shows/#{show.id}"
    fill_in 'Character', with: nil
    fill_in 'Actor Name', with: nil
    click_on 'Submit'

    expect(page).to_not have_content 'Success'
    expect(page).to have_content "can't be blank"
  end

  scenario "If the character already exists in the database, I receive an error message" do
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

    visit "/television_shows/#{show.id}"
    fill_in 'Character', with: character.name
    fill_in 'Actor Name', with: character.actor_name
    fill_in 'Description', with: character.description
    click_on 'Submit'

    expect(page).to_not have_content 'Success'
    expect(page).to have_content "already"
  end
end
