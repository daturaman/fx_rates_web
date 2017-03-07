require 'sinatra'
require 'exchange_rate'

get "/fxrate" do
  begin
    @date = params['date'].nil? ? Date.today : params['date']
    @amount = params['amount']
    @from_cur = params['from_cur']
    @to_cur = params['to_cur']
    unless @from_cur.nil? || @to_cur.nil?
      fx_rate = ExchangeRate.at(@date, @from_cur, @to_cur)
      @conversion_result = "#{@from_cur} to #{@to_cur} at #{fx_rate.round(5)} = #{@from_cur} #{(@amount.to_f * fx_rate).round(3)}"
    end
  rescue ArgumentError => e
    @error_msg = e.message
  end
  erb :fx_rates
end

