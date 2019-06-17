require 'test_helper'

class GraphQLLineTest < ActiveSupport::TestCase
  test 'loads line by ID' do
    query_string = <<-GRAPHQL
      query($id: ID!) {
        line(id: $id) {
          id,
          description,
          questionsAndOrder {
            id,
            question {
              id
            }
            order
          }
        }
      }
    GRAPHQL

    line = notes_lines.first

    result = DynamicNotesApiSchema.execute(query_string, variables: { id: line.id })
    assert result['errors'].nil?
  end
end