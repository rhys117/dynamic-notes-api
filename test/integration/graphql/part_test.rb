require 'test_helper'

class GraphQLPartTest < ActiveSupport::TestCase
  test 'loads template part by ID' do
    query_string = <<-GRAPHQL
      query($id: ID!) {
        templatePart(id: $id) {
          id,
          name,
          lines {
            id
          }
        }
      }
    GRAPHQL

    template_part = notes_parts.first
    result = DynamicNotesApiSchema.execute(query_string, variables: { id: template_part.id })
    assert result['errors'].nil?
  end

  test 'loads all template parts' do
    query_string = <<-GRAPHQL
      query {
        allTemplateParts {
          id
        }
      }
    GRAPHQL

    result = DynamicNotesApiSchema.execute(query_string)
    assert result['errors'].nil?
  end
end