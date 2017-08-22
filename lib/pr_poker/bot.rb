module PrPoker
  class Bot
    attr_reader :repo, :chat

    def initialize(repo:, chat: Slack.new)
      @repo = repo
      @chat = chat
    end

    def poke_reviewers
      PullRequestFinder.new(repo: repo).find.each do |pull_request|
        poke_reviewers_of pull_request
      end
    end

    private

    def poke_reviewers_of(pull_request)
      pull_request.reviewers.each do |reviewer|
        send_message reviewer, pull_request
      end
    end

    def send_message(reviewer, pull_request)
      if chat_user = chat.find_user_by_email(reviewer.email)
        chat.message \
          channel: chat_user.id,
          message: ReviewReminderMessage.new(pull_request).to_s
      end
    end
  end
end
