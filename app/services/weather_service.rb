
require 'net/http'
require 'json'

class WeatherService
  def self.fetch(city = "Tokyo")
    api_key = ENV['OPENWEATHER_API_KEY']
    url = URI("https://api.openweathermap.org/data/2.5/weather?q=#{city}&appid=#{api_key}&units=metric&lang=ja")

    res = Net::HTTP.get_response(url)
    return nil unless res.is_a?(Net::HTTPSuccess)

    json = JSON.parse(res.body)

    {
      weather: json['weather'][0]['description'],
      temp: json['main']['temp']
    }
  rescue => e
    Rails.logger.error("天気情報の取得に失敗: #{e.message}")
    nil
  end
end