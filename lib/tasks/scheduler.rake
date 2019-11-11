desc "This task is called by the Heroku scheduler add-on"
task :add_recurrent_entries => :environment do
  puts "Adding entries automatically..."
  active_recurrent_entries = RecurrentEntry.where("frequency = :frequency and active = :active and start_date <= :start_date and end_date >= :end_date", {frequency: 'Monthly', active: true, start_date: Date.today, end_date: Date.today})
  for recurrent_entry in active_recurrent_entries
    #RecurrentEntry.find(:all, :conditions => ["frequency = ? and active = ? and start_date <= ? and end_date >= ?",'Monthly', true, Date.today, Date.today])
    if !recurrent_entry.has_entry_within_month?
      recurrent_entry.create_entry
    end
  end
  puts "done."
end
