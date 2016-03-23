require 'rails_helper'

feature "user deletes an existing question, and associated answers" do
  scenario "clicks on delete button, submits, and question and answers are deleted" do

    question = Question.create(title: "How much wood would a woodchuck chuck if a woodchuck could chuck wood?", description: "The nursery rhyme that every child learns at a young age in order to differentiate between a woodchuck as a noun and chuck as a verb and wood as a noun.  This is a silly little exercise to check to see if the form input is valid or not.")

    visit questions_path
    click_link question.title
    click_link 'Delete'

    expect(page).to_not have_content('How much wood would a woodchuck chuck if a woodchuck could')
    expect(page).to_not have_content('nursery rhyme')
  end

  scenario "clicks on delete button on edit page" do

    question = Question.create(title: "How much wood would a woodchuck chuck if a woodchuck could chuck wood?", description: "The nursery rhyme that every child learns at a young age in order to differentiate between a woodchuck as a noun and chuck as a verb and wood as a noun.  This is a silly little exercise to check to see if the form input is valid or not.")

    visit questions_path
    click_link question.title
    click_link 'Edit'
    click_link 'Delete'

    expect(page).to_not have_content('How much wood would a woodchuck chuck if a woodchuck could')
    expect(page).to_not have_content('nursery rhyme')
  end
end
