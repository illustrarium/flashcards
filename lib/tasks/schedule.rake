desc "This task is called by the Heroku scheduler add-on"

task :notify_pending_cards => :environment do
  User.notify_pending_cards
end