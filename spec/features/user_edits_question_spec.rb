require 'rails_helper'

feature "user edits an existing question" do
  scenario "fill in edit question form, submit, and sees changes to question" do

    question = Question.create(title: "How much wood would a woodchuck chuck if a woodchuck could chuck wood?", description: "The nursery rhyme that every child learns at a young age in order to differentiate between a woodchuck as a noun and chuck as a verb and wood as a noun.  This is a silly little exercise to check to see if the form input is valid or not.")

    visit questions_path
    click_link question.title
    click_link 'Edit'

    fill_in 'Title', with: 'We are changing this question to edit it in order to see changes. Where are we at?'
    fill_in 'Description', with: 'The jabba jabbajabba jabbajabbajabba  jabbajabba jabbajabbajabba. This is a silly little exercise to check to see if the form input is valid or not.9'

    click_button("submit")

    expect(page).to_not have_content('This is a very very good answer to your well thought out question!')
    expect(page).to have_content('The jabba')
    expect(page).to have_content('We are changing')
  end
end
