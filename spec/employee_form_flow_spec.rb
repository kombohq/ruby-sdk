# frozen_string_literal: true

require 'spec_helper'
require 'support/test_context'

TestSupport.describe_sdk_suite 'Employee Form Flow' do
  include TestSupport

  it 'should get employee form and return form response' do
    ctx = TestSupport::TestContext.new

    ctx.mock_endpoint(
      method: 'GET',
      path: '/v1/hris/employees/form',
      response: {
        body: {
          status: 'success',
          data: {
            properties: {
              firstName: {
                type: 'text',
                label: 'First Name',
                required: true,
                description: "Employee's first name",
                unified_key: 'first_name',
                min_length: 1,
                max_length: 100
              },
              lastName: {
                type: 'text',
                label: 'Last Name',
                required: true,
                description: "Employee's last name",
                unified_key: 'last_name',
                min_length: 1,
                max_length: 100
              },
              startDate: {
                type: 'date',
                label: 'Start Date',
                required: true,
                description: "Employee's start date",
                unified_key: 'start_date'
              },
              keyNumbers: {
                type: 'array',
                label: 'Key Numbers',
                required: false,
                description: "Employee's key numbers",
                unified_key: nil,
                min_items: 2,
                max_items: 5,
                item_type: {
                  type: 'number',
                  label: 'Key Number',
                  required: false,
                  description: 'The number of the keys which belong to the employee',
                  unified_key: nil,
                  min: 0,
                  max: 99
                }
              },
              workLocation: {
                type: 'object',
                label: 'Work Location',
                required: false,
                description: "Employee's work location",
                unified_key: nil,
                properties: {
                  site: {
                    type: 'single_select',
                    label: 'Site',
                    required: true,
                    description: "Employee's site",
                    unified_key: nil,
                    options: {
                      type: 'inline',
                      entries: [
                        {
                          label: 'Site 1',
                          id: 'FXrER44xubBqA9DLgZ3PFNNx',
                          unified_value: '1',
                          remote_id: 'site_1'
                        },
                        {
                          label: 'Site 2',
                          id: '2rv75UKT2XBoQXsUb9agiTUm',
                          unified_value: '2',
                          remote_id: 'site_2'
                        }
                      ]
                    }
                  }
                }
              }
            }
          },
          warnings: []
        }
      }
    )

    # Make the API call
    form = ctx.kombo.hris.get_employee_form

    # Verify the response structure
    expect(form).to be_truthy
    expect(form.get_hris_employees_form_positive_response.status).to eq('success')
    expect(form.get_hris_employees_form_positive_response.data).to be_truthy
    # Properties are accessed with symbol keys matching the JSON field names (camelCase)
    expect(form.get_hris_employees_form_positive_response.data.properties).to be_a(Hash)
    expect(form.get_hris_employees_form_positive_response.data.properties.keys.length).to be > 0
    # The properties hash should contain the form fields
    # Check if any of the expected keys exist (could be :firstName or :first_name depending on conversion)
    property_keys = form.get_hris_employees_form_positive_response.data.properties.keys.map(&:to_s)
    expect(property_keys.any? { |k| k.downcase.include?('first') || k.downcase.include?('name') }).to be_truthy
    expect(form.get_hris_employees_form_positive_response.warnings).to eq([])
  end

  it 'should create employee with form using realistic employee data' do
    ctx = TestSupport::TestContext.new

    ctx.mock_endpoint(
      method: 'POST',
      path: '/v1/hris/employees/form',
      response: {
        body: {
          status: 'success',
          data: {
            id: 'emp-123',
            remote_id: 'remote-emp-123',
            prehire: {
              remote_id: nil
            }
          },
          warnings: []
        }
      }
    )

    # Make the API call with realistic employee properties
    body = Kombo::Models::Shared::PostHrisEmployeesFormRequestBody.new(
      properties: {
        firstName: 'John',
        lastName: 'Doe',
        startDate: '2025-01-15',
        keyNumbers: [142, 525, 63],
        workLocation: {
          site: 'FXrER44xubBqA9DLgZ3PFNNx'
        }
      }
    )

    result = ctx.kombo.hris.create_employee_with_form(body: body)

    # Verify the response structure
    expect(result).to be_truthy
    expect(result.post_hris_employees_form_positive_response.status).to eq('success')
    expect(result.post_hris_employees_form_positive_response.data).to be_truthy
    expect(result.post_hris_employees_form_positive_response.data.id).to eq('emp-123')
    expect(result.post_hris_employees_form_positive_response.data.remote_id).to eq('remote-emp-123')
    expect(result.post_hris_employees_form_positive_response.warnings).to eq([])

    # Verify request body is correctly serialized
    request = ctx.get_last_request
    expect(request.http_method).to eq('POST')
    expect(request.body).to be_a(Hash)
    expect(request.body['properties']).to be_truthy
    expect(request.body['properties']['firstName']).to eq('John')
    expect(request.body['properties']['keyNumbers']).to eq([142, 525, 63])
    expect(request.body['properties']['lastName']).to eq('Doe')
    expect(request.body['properties']['startDate']).to eq('2025-01-15')
    expect(request.body['properties']['workLocation']).to be_truthy
    expect(request.body['properties']['workLocation']['site']).to eq('FXrER44xubBqA9DLgZ3PFNNx')
  end
end
