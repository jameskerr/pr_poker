module PrPoker
  class Github
    def pull_requests(repo:)
      client.search_issues("repo:#{repo} state:open type:pr").items
    end

    def pull_request(repo: , number:)
      client.pull_request repo, number
    end

    def email(login)
      client.user(login).email
    end

    private

    def client
      @_github ||= Octokit::Client.new access_token: GITHUB_TOKEN
    end
  end
end
