namespace :sidekiq do
  task polulate: :environment do 
    size = (ENV["SIZE"] || 1_000).to_i

    puts "Preparing to send #{size} jobs"
  
    started_at = Time.now
  
    size.times do |index|
      SidekiqWorker.perform_async(index)
    end
  
    puts "Total time: #{(Time.now - started_at) * 1_000}ms"
  end
end
