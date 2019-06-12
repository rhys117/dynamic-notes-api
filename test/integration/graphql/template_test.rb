require 'test_helper'

class GraphQLTemplateTest < ActiveSupport::TestCase
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

    template_part = notes_template_parts.first
    result = DynamicNotesApiSchema.execute(query_string, variables: { id: template_part.id })
    assert result['errors'].nil?

    result_template_part_data = result['data']['templatePart']
    assert result_template_part_data['id'] == template_part.id.to_s
    assert result_template_part_data['name'] == template_part.name
    assert result_template_part_data['lines'].count == template_part.lines.count
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

    result_template_parts_data = result['data']['allTemplateParts']
    assert result_template_parts_data.count == notes_template_parts.count
  end
end