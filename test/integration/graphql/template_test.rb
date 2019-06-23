require 'test_helper'

class GraphQLTemplateTest < ActiveSupport::TestCase
  test 'loads template by ID' do
    query_string = <<-GRAPHQL
      query($id: ID!) {
        template(id: $id) {
          id,
          name,
          description,
          triggers {
            name,
            value,
            type
          }, 
          partsAndOrder {
            order,
            static,
            part {
              linesAndOrder {
                order
                line {
                  questionsAndOrder {
                    order,
                    question {
                      name,
                      input,
                      selectable,
                      selections,
                      placeholder
                    }
                  }
                }
              }
            }
          }
        }
      }
    GRAPHQL

    template = notes_templates.first

    result = DynamicNotesApiSchema.execute(query_string, variables: { id: template.id })

    assert result['errors'].nil?
  end
end