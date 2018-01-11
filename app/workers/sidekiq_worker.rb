class SidekiqWorker
  include Sidekiq::Worker

  def perform(index)
      uri = URI("#{ENV['BUCKET_URL']}?index=#{index}")
      Net::HTTP.get(uri)
  end
end