namespace :delete do
  desc 'Delete records older than 60 days'
  task :old_records => :environment do
    Job.where('created_at > ?', 60.days.ago).each do |model|
      model.destroy
    end

  end

end