require_relative 'lib/pr_poker'

task default: :poke_reviewers

task :poke_reviewers do
  puts "Poking reviewers..."
  PrPoker::Bot.new(repo: 'PulseSoftwareInc/pulse360').poke_reviewers
end

task :slack_users do
  p PrPoker::Slack.new.all_users
end
