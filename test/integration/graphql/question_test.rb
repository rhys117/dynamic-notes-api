require 'test_helper'

class GraphQLQuestionTest < ActiveSupport::TestCase
  test 'loads question by ID' do
    query_string = <<-GRAPHQL
      query($id: ID!) {
        question(id: $id) {
          id,
          name,
          input,
          description,
          selectable,
          selections
        }
      }
    GRAPHQL

    question = notes_questions.first

    result = DynamicNotesApiSchema.execute(query_string, variables: { id: question.id })
    assert result['errors'].nil?

    result_question_data = result['data']['question']
    assert result_question_data['id'] == question.id.to_s
    assert result_question_data['selections'] == question.selections
  end
end