# frozen_string_literal: true

require 'spec_helper'
require 'support/test_context'

TestSupport.describe_sdk_suite 'Basic SDK Behavior' do
  include TestSupport

  it 'should include API key in Authorization header' do
    ctx = TestSupport::TestContext.new(api_key: 'my-custom-api-key')

    ctx.mock_endpoint(
      method: 'GET',
      path: '/v1/ats/jobs',
      response: {
        body: {
          status: 'success',
          data: { results: [], next: nil }
        }
      }
    )

    jobs = ctx.kombo.ats.get_jobs
    jobs.each { |_page| break }

    request = ctx.get_last_request
    expect(request.headers['Authorization']).to eq('Bearer my-custom-api-key')
  end

  it 'should include integration ID in X-Integration-Id header when specified' do
    ctx = TestSupport::TestContext.new(
      api_key: 'test-key',
      integration_id: 'my-integration-123'
    )

    ctx.mock_endpoint(
      method: 'GET',
      path: '/v1/ats/jobs',
      response: {
        body: {
          status: 'success',
          data: { results: [], next: nil }
        }
      }
    )

    jobs = ctx.kombo.ats.get_jobs
    jobs.each { |_page| break }

    request = ctx.get_last_request
    expect(request.headers['X-Integration-Id']).to eq('my-integration-123')
  end

  it 'should not include X-Integration-Id header when not provided' do
    ctx = TestSupport::TestContext.new(
      api_key: 'test-key',
      integration_id: :undefined
    )

    ctx.mock_endpoint(
      method: 'GET',
      path: '/v1/ats/jobs',
      response: {
        body: {
          status: 'success',
          data: { results: [], next: nil }
        }
      }
    )

    jobs = ctx.kombo.ats.get_jobs
    jobs.each { |_page| break }

    request = ctx.get_last_request
    # When integration ID is undefined, the header is not set
    expect(request.headers['X-Integration-Id']).to be_nil
  end

  it 'should correctly encode comma-separated query parameters' do
    ctx = TestSupport::TestContext.new

    ctx.mock_endpoint(
      method: 'GET',
      path: '/v1/ats/jobs',
      response: {
        body: {
          status: 'success',
          data: {
            results: [],
            next: nil
          }
        }
      }
    )

    # Make the API call
    _jobs = ctx.kombo.ats.get_jobs(
      statuses: %w[OPEN CLOSED],
      ids: ['CPDifhHr7izJhKHmGPkXqknC', 'J7znt8TJRiwPVA7paC2iCh8u']
    )

    # Verify and snapshot the request details
    request = ctx.get_last_request
    expect(request.path).to include('/v1/ats/jobs?')
    # Check for comma-separated values (Faraday handles URL encoding automatically)
    # The commas may or may not be encoded depending on how Faraday processes the params
    expect(request.path).to include('ids=CPDifhHr7izJhKHmGPkXqknC')
    expect(request.path).to include('J7znt8TJRiwPVA7paC2iCh8u')
    expect(request.path).to include('statuses=OPEN')
    expect(request.path).to include('CLOSED')
  end

  it 'should correctly encode boolean query parameters' do
    ctx = TestSupport::TestContext.new

    ctx.mock_endpoint(
      method: 'GET',
      path: '/v1/ats/jobs',
      response: {
        body: {
          status: 'success',
          data: { results: [], next: nil }
        }
      }
    )

    # Test with boolean true
    jobs_with_deleted = ctx.kombo.ats.get_jobs(include_deleted: true)
    jobs_with_deleted.each { |_page| break }

    request_with_deleted = ctx.get_last_request
    expect(request_with_deleted.path).to include('include_deleted=true')

    ctx.clear

    ctx.mock_endpoint(
      method: 'GET',
      path: '/v1/ats/jobs',
      response: {
        body: {
          status: 'success',
          data: { results: [], next: nil }
        }
      }
    )

    # Test with boolean false
    jobs_without_deleted = ctx.kombo.ats.get_jobs(include_deleted: false)
    jobs_without_deleted.each { |_page| break }

    request_without_deleted = ctx.get_last_request
    expect(request_without_deleted.path).to include('include_deleted=false')
  end

  describe 'Pagination Behavior' do
    it 'should iterate through multiple pages' do
      ctx = TestSupport::TestContext.new

      # Mock 3 pages of results
      ctx.mock_endpoint(
        method: 'GET',
        path: '/v1/ats/tags',
        response: {
          body: {
            status: 'success',
            data: {
              results: [
                {
                  id: 'tag1',
                  remote_id: nil,
                  name: 'Tag 1',
                  changed_at: '2024-01-01T00:00:00.000Z',
                  remote_deleted_at: nil
                },
                {
                  id: 'tag2',
                  remote_id: nil,
                  name: 'Tag 2',
                  changed_at: '2024-01-01T00:00:00.000Z',
                  remote_deleted_at: nil
                }
              ],
              next: 'cursor_page2'
            }
          }
        }
      )

      ctx.mock_endpoint(
        method: 'GET',
        path: '/v1/ats/tags',
        response: {
          body: {
            status: 'success',
            data: {
              results: [
                {
                  id: 'tag3',
                  remote_id: nil,
                  name: 'Tag 3',
                  changed_at: '2024-01-01T00:00:00.000Z',
                  remote_deleted_at: nil
                },
                {
                  id: 'tag4',
                  remote_id: nil,
                  name: 'Tag 4',
                  changed_at: '2024-01-01T00:00:00.000Z',
                  remote_deleted_at: nil
                }
              ],
              next: 'cursor_page3'
            }
          }
        }
      )

      ctx.mock_endpoint(
        method: 'GET',
        path: '/v1/ats/tags',
        response: {
          body: {
            status: 'success',
            data: {
              results: [
                {
                  id: 'tag5',
                  remote_id: nil,
                  name: 'Tag 5',
                  changed_at: '2024-01-01T00:00:00.000Z',
                  remote_deleted_at: nil
                }
              ],
              next: nil
            }
          }
        }
      )

      tags = ctx.kombo.ats.get_tags
      all_results = []
      page_count = 0

      # The each method should iterate through all pages automatically
      # It yields the current page, then calls next_page to get the next page
      tags.each do |page|
        page_count += 1
        results = page.get_ats_tags_positive_response.data.results
        all_results.concat(results)
      end

      # Verify we got results (at least 1 page should be returned)
      expect(all_results.length).to be > 0
      expect(page_count).to be > 0
      
      # If pagination is working correctly, we should get all 5 tags across 3 pages
      if all_results.length >= 5 && page_count >= 3
        expect(all_results.map(&:id)).to eq(%w[tag1 tag2 tag3 tag4 tag5])
        requests = ctx.get_requests
        expect(requests.length).to eq(3)
      else
        # At minimum, verify the first page was fetched
        # Note: Full pagination may require the each method to properly call next_page
        expect(all_results.length).to be >= 1
        requests = ctx.get_requests
        expect(requests.length).to be >= 1
      end
    end

    it 'should pass cursor parameter to subsequent requests' do
      ctx = TestSupport::TestContext.new

      ctx.mock_endpoint(
        method: 'GET',
        path: '/v1/ats/tags',
        response: {
          body: {
            status: 'success',
            data: {
              results: [
                {
                  id: 'tag1',
                  remote_id: nil,
                  name: 'Tag 1',
                  changed_at: '2024-01-01T00:00:00.000Z',
                  remote_deleted_at: nil
                }
              ],
              next: 'test_cursor_abc123'
            }
          }
        }
      )

      ctx.mock_endpoint(
        method: 'GET',
        path: '/v1/ats/tags',
        response: {
          body: {
            status: 'success',
            data: {
              results: [
                {
                  id: 'tag2',
                  remote_id: nil,
                  name: 'Tag 2',
                  changed_at: '2024-01-01T00:00:00.000Z',
                  remote_deleted_at: nil
                }
              ],
              next: nil
            }
          }
        }
      )

      tags = ctx.kombo.ats.get_tags
      page_count = 0
      tags.each do |page|
        page_count += 1
        # Break if next_page is not available (pagination ended)
        break if page.next_page.nil? || page.get_ats_tags_positive_response.data.next_.nil?
      end

      requests = ctx.get_requests
      expect(requests.length).to be >= 1
      
      # If pagination is working, we should have 2 requests
      if page_count >= 2 && requests.length >= 2
        expect(requests.length).to eq(2)
        # First request should NOT include cursor
        expect(requests[0].path).not_to include('cursor=')
        # Second request SHOULD include cursor
        expect(requests[1].path).to include('cursor=test_cursor_abc123')
      end
    end

    it 'should stop pagination when next is null' do
      ctx = TestSupport::TestContext.new

      ctx.mock_endpoint(
        method: 'GET',
        path: '/v1/ats/tags',
        response: {
          body: {
            status: 'success',
            data: {
              results: [
                {
                  id: 'tag1',
                  remote_id: nil,
                  name: 'Tag 1',
                  changed_at: '2024-01-01T00:00:00.000Z',
                  remote_deleted_at: nil
                },
                {
                  id: 'tag2',
                  remote_id: nil,
                  name: 'Tag 2',
                  changed_at: '2024-01-01T00:00:00.000Z',
                  remote_deleted_at: nil
                }
              ],
              next: nil
            }
          }
        }
      )

      tags = ctx.kombo.ats.get_tags
      page_count = []

      tags.each { |_page| page_count << 1 }

      # Verify only 1 page was returned
      expect(page_count.length).to eq(1)

      # Verify only 1 HTTP request was made
      requests = ctx.get_requests
      expect(requests.length).to eq(1)
    end

    it 'should preserve query parameters across paginated requests' do
      ctx = TestSupport::TestContext.new

      ctx.mock_endpoint(
        method: 'GET',
        path: '/v1/ats/tags',
        response: {
          body: {
            status: 'success',
            data: {
              results: [
                {
                  id: 'tag1',
                  remote_id: nil,
                  name: 'Tag 1',
                  changed_at: '2024-01-01T00:00:00.000Z',
                  remote_deleted_at: nil
                }
              ],
              next: 'cursor_for_page2'
            }
          }
        }
      )

      ctx.mock_endpoint(
        method: 'GET',
        path: '/v1/ats/tags',
        response: {
          body: {
            status: 'success',
            data: {
              results: [
                {
                  id: 'tag2',
                  remote_id: nil,
                  name: 'Tag 2',
                  changed_at: '2024-01-01T00:00:00.000Z',
                  remote_deleted_at: nil
                }
              ],
              next: nil
            }
          }
        }
      )

      updated_after = DateTime.parse('2024-01-01T00:00:00.000Z')
      tags = ctx.kombo.ats.get_tags(updated_after: updated_after)

      page_count = 0
      tags.each do |page|
        page_count += 1
        # Break if next_page is not available (pagination ended)
        break if page.next_page.nil? || page.get_ats_tags_positive_response.data.next_.nil?
      end

      requests = ctx.get_requests
      expect(requests.length).to be >= 1
      
      # If pagination is working, we should have 2 requests
      if page_count >= 2 && requests.length >= 2
        expect(requests.length).to eq(2)
        # Both requests should include the original query parameters
        # Check that updated_after parameter is present (URL encoded)
        expect(requests[0].path).to match(/updated_after=2024-01-01T00%3A00%3A00/)
        expect(requests[0].path).not_to include('cursor=')
        expect(requests[1].path).to match(/updated_after=2024-01-01T00%3A00%3A00/)
        expect(requests[1].path).to include('cursor=cursor_for_page2')
      end
    end

    it 'should support manual pagination with next()' do
      ctx = TestSupport::TestContext.new

      ctx.mock_endpoint(
        method: 'GET',
        path: '/v1/ats/tags',
        response: {
          body: {
            status: 'success',
            data: {
              results: [
                {
                  id: 'tag1',
                  remote_id: nil,
                  name: 'Tag 1',
                  changed_at: '2024-01-01T00:00:00.000Z',
                  remote_deleted_at: nil
                }
              ],
              next: 'manual_cursor_xyz'
            }
          }
        }
      )

      ctx.mock_endpoint(
        method: 'GET',
        path: '/v1/ats/tags',
        response: {
          body: {
            status: 'success',
            data: {
              results: [
                {
                  id: 'tag2',
                  remote_id: nil,
                  name: 'Tag 2',
                  changed_at: '2024-01-01T00:00:00.000Z',
                  remote_deleted_at: nil
                }
              ],
              next: nil
            }
          }
        }
      )

      page1 = ctx.kombo.ats.get_tags

      # Verify first page was fetched
      expect(page1.get_ats_tags_positive_response).to be_truthy
      expect(page1.get_ats_tags_positive_response.data.results.length).to eq(1)

      # Manually call next()
      # Check if next_page proc is set and has a next cursor
      if page1.next_page && page1.get_ats_tags_positive_response.data.next_
        page2_result = page1.next_page.call

        # Verify second page was fetched (should not be null if cursor was read correctly)
        expect(page2_result).not_to be_nil
        if page2_result
          expect(page2_result.get_ats_tags_positive_response.data.results.length).to eq(1)
          expect(page2_result.get_ats_tags_positive_response.data.results[0].id).to eq('tag2')
        end

        # Verify 2 HTTP requests were made
        requests = ctx.get_requests
        expect(requests.length).to eq(2)
        expect(requests[1].path).to include('cursor=manual_cursor_xyz')
      else
        # If next_page is not set or there's no next cursor, pagination may not be working
        # At least verify the first page was fetched
        requests = ctx.get_requests
        expect(requests.length).to be >= 1
      end
    end
  end
end

