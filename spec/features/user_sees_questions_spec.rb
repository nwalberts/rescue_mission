require 'rails_helper'

feature "sees questions" do
  scenario "see all the questions" do
    question = Question.create(title: "How much wood would a woodchuck chuck if a woodchuck could chuck wood?", description: "The nursery rhyme that every child learns at a young age in order to differentiate between a woodchuck as a noun and chuck as a verb and wood as a noun.  This is a silly little exercise to check to see if the form input is valid or not.")
    another_question = Question.create(title: "How do I get into Launch Academy if I hate programming? Also what is the meaning of life?")

    visit questions_path


    expect(page).to have_content(question.title)
    expect(page).to have_content(question.description)
    expect(page).to_not have_content(another_question.title)
  end
end
