require 'test_helper'

class GraphQLTemplateTest < ActiveSupport::TestCase
  test 'loads template by ID' do
    query_string = <<-GRAPHQL
      query($id: ID!) {
        template(id: $id) {
          id,
          name,
          lines {
            id
          }
        }
      }
    GRAPHQL

    template = notes_templates.first
    result = DynamicNotesApiSchema.execute(query_string, variables: { id: template.id })
    result_template_data = result['data']['template']

    assert result_template_data['id'] == template.id.to_s
    assert result_template_data['name'] == template.name
    assert result_template_data['lines'].count == template.lines.count
  end

  test 'loads all templates' do
    query_string = <<-GRAPHQL
      query {
        allTemplates {
          id
        }
      }
    GRAPHQL

    result = DynamicNotesApiSchema.execute(query_string)
    assert result['errors'].nil?

    result_templates_data = result['data']['allTemplates']
    assert result_templates_data.count == notes_templates.count
  end
end