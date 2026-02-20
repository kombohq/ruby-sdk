# frozen_string_literal: true

require 'spec_helper'
require 'support/test_context'

TestSupport.describe_sdk_suite 'Error Handling' do
  include TestSupport

  describe 'ATS endpoints' do
    it 'returns KomboAtsError for platform rate limit errors' do
      ctx = TestSupport::TestContext.new

      ctx.mock_endpoint(
        method: 'GET',
        path: '/v1/ats/jobs',
        response: {
          status_code: 429,
          body: {
            status: 'error',
            error: {
              code: 'PLATFORM.RATE_LIMIT_EXCEEDED',
              title: 'Rate limit exceeded',
              message: 'You have exceeded the rate limit. Please try again later.',
              log_url: 'https://app.kombo.dev/logs/abc123'
            }
          }
        }
      )

      error = nil
      expect do
        ctx.kombo.ats.get_jobs
      rescue Kombo::Models::Errors::KomboAtsError => e
        error = e
        raise
      end.to raise_error(Kombo::Models::Errors::KomboAtsError)
      expect(error.error.message).to include('You have exceeded the rate limit. Please try again later.')
      expect(error.status).to eq(Kombo::Models::Shared::KomboAtsErrorStatus::ERROR)
      expect(error.error.code).to eq(Kombo::Models::Shared::KomboAtsErrorCode::PLATFORM_RATE_LIMIT_EXCEEDED)
      expect(error.error.title).to eq('Rate limit exceeded')
      expect(error.error.message).to eq('You have exceeded the rate limit. Please try again later.')
      expect(error.error.log_url).to eq('https://app.kombo.dev/logs/abc123')
    end

    it 'returns KomboAtsError for ATS-specific job closed errors' do
      ctx = TestSupport::TestContext.new

      ctx.mock_endpoint(
        method: 'POST',
        path: '/v1/ats/jobs/test-job-id/applications',
        response: {
          status_code: 400,
          body: {
            status: 'error',
            error: {
              code: 'ATS.JOB_CLOSED',
              title: 'Job is closed',
              message: 'Cannot create application for a closed job. The job must be in an open state.',
              log_url: 'https://app.kombo.dev/logs/ghi789'
            }
          }
        }
      )

      candidate = Kombo::Models::Shared::PostAtsJobsJobIdApplicationsRequestBodyCandidate.new(
        first_name: 'John',
        last_name: 'Doe',
        email_address: 'john.doe@example.com'
      )
      body = Kombo::Models::Shared::PostAtsJobsJobIdApplicationsRequestBody.new(
        candidate: candidate
      )

      error = nil
      expect do
        ctx.kombo.ats.create_application(job_id: 'test-job-id', body: body)
      rescue Kombo::Models::Errors::KomboAtsError => e
        error = e
        raise
      end.to raise_error(Kombo::Models::Errors::KomboAtsError)
      expect(error.error.message).to include('Cannot create application for a closed job. The job must be in an open state.')
      expect(error.status).to eq(Kombo::Models::Shared::KomboAtsErrorStatus::ERROR)
      expect(error.error.code).to eq(Kombo::Models::Shared::KomboAtsErrorCode::ATS_JOB_CLOSED)
      expect(error.error.title).to eq('Job is closed')
      expect(error.error.message).to eq('Cannot create application for a closed job. The job must be in an open state.')
      expect(error.error.log_url).to eq('https://app.kombo.dev/logs/ghi789')
    end
  end

  describe 'HRIS endpoints' do
    it 'returns KomboHrisError for integration permission errors' do
      ctx = TestSupport::TestContext.new

      ctx.mock_endpoint(
        method: 'GET',
        path: '/v1/hris/employees',
        response: {
          status_code: 403,
          body: {
            status: 'error',
            error: {
              code: 'INTEGRATION.PERMISSION_MISSING',
              title: 'Permission missing',
              message: 'The integration is missing required permissions to access this resource.',
              log_url: 'https://app.kombo.dev/logs/hris-def456'
            }
          }
        }
      )

      error = nil
      expect do
        ctx.kombo.hris.get_employees
      rescue Kombo::Models::Errors::KomboHrisError => e
        error = e
        raise
      end.to raise_error(Kombo::Models::Errors::KomboHrisError)
      expect(error.error.message).to include('The integration is missing required permissions to access this resource.')
      expect(error.status).to eq(Kombo::Models::Shared::KomboHrisErrorStatus::ERROR)
      expect(error.error.code).to eq(Kombo::Models::Shared::KomboHrisErrorCode::INTEGRATION_PERMISSION_MISSING)
      expect(error.error.title).to eq('Permission missing')
      expect(error.error.message).to eq('The integration is missing required permissions to access this resource.')
      expect(error.error.log_url).to eq('https://app.kombo.dev/logs/hris-def456')
    end
  end

  describe 'Assessment endpoints' do
    it 'returns KomboAtsError for platform input validation errors' do
      ctx = TestSupport::TestContext.new

      ctx.mock_endpoint(
        method: 'GET',
        path: '/v1/assessment/orders/open',
        response: {
          status_code: 400,
          body: {
            status: 'error',
            error: {
              code: 'PLATFORM.INPUT_INVALID',
              title: 'Input invalid',
              message: 'The provided input is invalid or malformed.',
              log_url: 'https://app.kombo.dev/logs/assessment-xyz'
            }
          }
        }
      )

      error = nil
      expect do
        ctx.kombo.assessment.get_open_orders
      rescue Kombo::Models::Errors::KomboAtsError => e
        error = e
        raise
      end.to raise_error(Kombo::Models::Errors::KomboAtsError)
      expect(error.error.message).to include('The provided input is invalid or malformed.')
      expect(error.status).to eq(Kombo::Models::Shared::KomboAtsErrorStatus::ERROR)
      expect(error.error.code).to eq(Kombo::Models::Shared::KomboAtsErrorCode::PLATFORM_INPUT_INVALID)
      expect(error.error.title).to eq('Input invalid')
      expect(error.error.message).to eq('The provided input is invalid or malformed.')
      expect(error.error.log_url).to eq('https://app.kombo.dev/logs/assessment-xyz')
    end
  end

  describe 'General endpoints' do
    it 'returns KomboGeneralError for authentication errors' do
      ctx = TestSupport::TestContext.new

      ctx.mock_endpoint(
        method: 'GET',
        path: '/v1/check-api-key',
        response: {
          status_code: 401,
          body: {
            status: 'error',
            error: {
              code: 'PLATFORM.AUTHENTICATION_INVALID',
              title: 'Authentication invalid',
              message: 'The provided API key is invalid or expired.',
              log_url: 'https://app.kombo.dev/logs/general-auth-123'
            }
          }
        }
      )

      error = nil
      expect do
        ctx.kombo.general.check_api_key
      rescue Kombo::Models::Errors::KomboGeneralError => e
        error = e
        raise
      end.to raise_error(Kombo::Models::Errors::KomboGeneralError)
      expect(error.error.message).to include('The provided API key is invalid or expired.')
      expect(error.status).to eq(Kombo::Models::Shared::KomboGeneralErrorStatus::ERROR)
      expect(error.error.code).to eq(Kombo::Models::Shared::KomboGeneralErrorCode::PLATFORM_AUTHENTICATION_INVALID)
      expect(error.error.title).to eq('Authentication invalid')
      expect(error.error.message).to eq('The provided API key is invalid or expired.')
      expect(error.error.log_url).to eq('https://app.kombo.dev/logs/general-auth-123')
    end
  end

  describe 'Unexpected response formats' do
    describe 'APIError thrown for non-JSON responses' do
      it 'handles plain text 500 error from load balancer' do
        ctx = TestSupport::TestContext.new

        ctx.mock_endpoint(
          method: 'GET',
          path: '/v1/ats/jobs',
          response: {
            status_code: 500,
            body: '500 Internal Server Error',
            headers: { 'Content-Type' => 'text/plain' }
          }
        )

        error = nil
        expect do
          ctx.kombo.ats.get_jobs
        rescue Kombo::Models::Errors::APIError => e
          error = e
          raise
        end.to raise_error(Kombo::Models::Errors::APIError)
        expect(error.status_code).to eq(500)
        expect(error.body).to include('500 Internal Server Error')
      end

      it 'handles plain text 502 bad gateway error' do
        ctx = TestSupport::TestContext.new

        ctx.mock_endpoint(
          method: 'GET',
          path: '/v1/hris/employees',
          response: {
            status_code: 502,
            body: '502 Bad Gateway',
            headers: {
              'Content-Type' => 'text/plain'
            }
          }
        )

        error = nil
        expect do
          ctx.kombo.hris.get_employees
        rescue Kombo::Models::Errors::APIError => e
          error = e
          raise
        end.to raise_error(Kombo::Models::Errors::APIError)
        expect(error.status_code).to eq(502)
        expect(error.body).to include('502 Bad Gateway')
      end

      it 'handles HTML error page from nginx' do
        ctx = TestSupport::TestContext.new

        html_error_page = <<~HTML
          <!DOCTYPE html>
          <html>
          <head><title>503 Service Temporarily Unavailable</title></head>
          <body>
          <center><h1>503 Service Temporarily Unavailable</h1></center>
          <hr><center>nginx/1.18.0</center>
          </body>
          </html>
        HTML

        ctx.mock_endpoint(
          method: 'POST',
          path: '/v1/ats/jobs/test-job-id/applications',
          response: {
            status_code: 503,
            body: html_error_page,
            headers: { 'Content-Type' => 'text/html' }
          }
        )

        candidate = Kombo::Models::Shared::PostAtsJobsJobIdApplicationsRequestBodyCandidate.new(
          first_name: 'John',
          last_name: 'Doe',
          email_address: 'john.doe@example.com'
        )
        body = Kombo::Models::Shared::PostAtsJobsJobIdApplicationsRequestBody.new(
          candidate: candidate
        )

        error = nil
        expect do
          ctx.kombo.ats.create_application(job_id: 'test-job-id', body: body)
        rescue Kombo::Models::Errors::APIError => e
          error = e
          raise
        end.to raise_error(Kombo::Models::Errors::APIError)
        expect(error.status_code).to eq(503)
        expect(error.body).to include('503 Service Temporarily Unavailable')
      end

      it 'handles empty response body with error status code' do
        ctx = TestSupport::TestContext.new

        ctx.mock_endpoint(
          method: 'GET',
          path: '/v1/check-api-key',
          response: {
            status_code: 500,
            body: '',
            headers: { 'Content-Type' => 'text/plain' }
          }
        )

        error = nil
        expect do
          ctx.kombo.general.check_api_key
        rescue Kombo::Models::Errors::APIError => e
          error = e
          raise
        end.to raise_error(Kombo::Models::Errors::APIError)
        expect(error.status_code).to eq(500)
      end

      it 'handles unexpected Content-Type header' do
        ctx = TestSupport::TestContext.new

        # Response with unexpected Content-Type
        ctx.mock_endpoint(
          method: 'GET',
          path: '/v1/ats/applications',
          response: {
            status_code: 500,
            body: 'Server error occurred',
            headers: {
              'Content-Type' => 'text/xml'
            }
          }
        )

        error = nil
        expect do
          ctx.kombo.ats.get_applications
        rescue Kombo::Models::Errors::APIError => e
          error = e
          raise
        end.to raise_error(Kombo::Models::Errors::APIError)
        expect(error.status_code).to eq(500)
        expect(error.body).to include('Server error occurred')
      end
    end
  end
end
