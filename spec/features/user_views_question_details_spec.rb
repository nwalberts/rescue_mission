require 'rails_helper'

feature "sees question details" do
  scenario "see all the question details" do

    question = Question.create(title: "How much wood would a woodchuck chuck if a woodchuck could chuck wood?", description: "The nursery rhyme that every child learns at a young age in order to differentiate between a woodchuck as a noun and chuck as a verb and wood as a noun.  This is a silly little exercise to check to see if the form input is valid or not.")

    visit questions_path

    click_link question.title


    expect(page).to have_content("Details")
    expect(page).to have_content(question.title)
    expect(page).to have_content(question.description)
  end
end
