require 'rails_helper'

feature "answers question and list of answers" do
  scenario "fill in answer form, submit, and sees listed answer" do

    question = Question.create(title: "How much wood would a woodchuck chuck if a woodchuck could chuck wood?", description: "The nursery rhyme that every child learns at a young age in order to differentiate between a woodchuck as a noun and chuck as a verb and wood as a noun.  This is a silly little exercise to check to see if the form input is valid or not.")

    visit questions_path
    click_link question.title

    fill_in 'Answer this question:', with: 'This is a very very good answer to your well thought out question!'

    click_button("submit")


    expect(page).to have_content('This is a very very good answer to your well thought out question!')

  end
end
