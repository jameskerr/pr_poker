module PrPoker
  class ReviewReminderMessage
    attr_reader :pull_request

    def initialize(pull_request)
      @pull_request = pull_request
    end

    def to_s
      "Hey can you review this for this #{pull_request.author}?\n" \
      "*#{pull_request.title}*\n" \
      "#{pull_request.url}" \
    end
  end
end
