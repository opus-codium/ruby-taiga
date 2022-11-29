# frozen_string_literal: true

require_relative 'taiga/version'

require 'flexirest'

module Taiga
  class FlexiBase < Flexirest::Base
    def self.base_url
      Taiga.api_url
    end

    before_request :set_bearer
    def set_bearer(_name, request)
      request.headers['Authorization'] = "Bearer #{Taiga.auth_token}"
    end

    before_request :disable_pagination
    def disable_pagination(name, request)
      request.headers['x-disable-pagination'] = 'True' if name == :all
    end
  end

  class Project < FlexiBase
    get :all, '/projects'

    def milestones
      Taiga::Milestone.all(project: id)
    end
  end

  class Milestone < FlexiBase
    get :all, '/milestones'
    get :find, '/milestones/:id'

    def tasks
      Taiga::Task.all(milestone: id, project: project)
    end
  end

  class UserStory < FlexiBase
    get :all, '/userstories'
    get :find, '/userstories/:id'

    post :create, '/userstories', requires: %i[project subject]
  end

  class Task < FlexiBase
    get :all, '/tasks'

    post :create, '/tasks', requires: %i[project subject]

    delete :remove, '/tasks/:id'
    before_request :clear_params
    def clear_params(name, request)
      # NOTE: Flexirest puts all object attributes as parameter but Taiga reject these ones, so we need to clean all parameters before request
      request.get_params = {} if name == :remove
      nil
    end
  end

  class Auth < Flexirest::Base
    def self.base_url
      Taiga.api_url
    end

    post :login, '/auth', requires: %i[username password type]
  end

  class << self
    attr_accessor :api_url, :auth_token

    def authenticate(username:, password:)
      user_auth_detail = Taiga::Auth.login username: username, password: password, type: 'normal'
      self.auth_token = user_auth_detail.auth_token

      user_auth_detail
    end
  end
end
