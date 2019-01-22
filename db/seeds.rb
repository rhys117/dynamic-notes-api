# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
text_question = Notes::Question.create(name: 'phone number',
                                       description: 'What was the phone number?',
                                       input: 'text',
                                       placeholder: 'eg 0423xxxx91')

select_question = Notes::Question.create(name: 'confirmed id',
                                         description: 'Did you confirm ID for this entity?',
                                         input: 'select',
                                         selections: ['Confirmed ID', 'Confirmed ID as Technical Advocate',
                                                      'Confirmed ID as Authorised Representative',
                                                      'Could Not Confirm ID',])

line = Notes::Line.create
first_line_order = Notes::LineOrder.create(notes_line_id: line.id, notes_question_id: text_question.id, order: 1)
second_line_order = Notes::LineOrder.create(notes_line_id: line.id, notes_question_id: select_question.id, order: 2)

second_line = Notes::Line.create
first_line_order = Notes::LineOrder.create(notes_line_id: second_line.id, notes_question_id: text_question.id, order: 1)
second_line_order = Notes::LineOrder.create(notes_line_id: second_line.id, notes_question_id: select_question.id, order: 2)
