module PrPoker
  class PullRequestFinder
    attr_reader :repo, :github

    def initialize(repo:, github: Github.new)
      @repo   = repo
      @github = github
    end

    def find
      fetch_prs.map do |pr|
        PullRequest.new pr.title, pr.html_url, pr.user.login, reviewers_of(pr)
      end
    end

    def fetch_prs
      github.pull_requests(repo: repo)
    end

    def reviewers_of(pr)
      pr_data = github.pull_request repo: repo, number: pr.number

      pr_data.requested_reviewers.map do |reviewer_data|
        login = reviewer_data.login
        email = github.email(login)

        Reviewer.new(login, email)
      end
    end
  end
end
