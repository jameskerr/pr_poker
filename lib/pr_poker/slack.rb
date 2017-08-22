module PrPoker
  class Slack
    def all_users
      @_all_users ||= client.users_list.members.map do |member|
        next unless email = member.profile.email
        SlackUser.new member.id, email
      end.compact
    end

    def find_user_by_email(email)
      all_users.find { |user| user.email == email }
    end

    def message(channel:, message:)
      client.chat_postMessage(channel: channel, text: message, as_user: true)
    end

    private

    def client
      @_client ||= ::Slack::Web::Client.new token: SLACK_TOKEN
    end
  end
end
