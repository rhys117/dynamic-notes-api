require 'test_helper'

class GraphQLLineTest < ActiveSupport::TestCase
  test 'loads line by ID' do
    query_string = <<-GRAPHQL
      query($id: ID!) {
        line(id: $id) {
          id,
          description,
          templatePart {
           id
          },
          questionsAndOrder {
            id,
            question {
              id
            }
            order
          },
          order
        }
      }
    GRAPHQL

    line = notes_lines.first

    result = DynamicNotesApiSchema.execute(query_string, variables: { id: line.id })
    assert result['errors'].nil?

    result_line_data = result['data']['line']
    assert result_line_data['id'] == line.id.to_s
    assert result_line_data['questionsAndOrder'].map { |qao| qao['id'] }.map(&:to_s) == result_line_data['questionsAndOrder'].map { |qao| qao['id'] }
    assert result_line_data['questionsAndOrder'].map { |qao| qao['question'] }.count == line.questions.count
    assert result_line_data['templatePart']['id'] == line.template_part.id.to_s
    assert result_line_data['order'] == line.order
  end
end