require 'slack'
require 'octokit'

require_relative 'pr_poker/bot'
require_relative 'pr_poker/github'
require_relative 'pr_poker/slack'
require_relative 'pr_poker/pull_request_finder'
require_relative 'pr_poker/review_reminder_message'

SLACK_TOKEN  = 'xxx'
GITHUB_TOKEN = 'xxx'

module PrPoker
  PullRequest = Struct.new :title, :url, :author, :reviewers
  Reviewer    = Struct.new :login, :email
  SlackUser   = Struct.new :id,    :email
end
