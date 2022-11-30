# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'rubocop/rake_task'

require 'taiga/version'

RuboCop::RakeTask.new

require 'github_changelog_generator/task'

GitHubChangelogGenerator::RakeTask.new :changelog do |config|
  config.user = 'opus-codium'
  config.project = 'ruby-taiga'
  config.since_tag = 'v0.1.0'
  config.future_release = "v#{Taiga::VERSION}"
end

task default: :rubocop
