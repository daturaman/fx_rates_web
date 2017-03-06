require 'sinatra'

get "/fxrate" do
  @date = params['date'].nil? ? Date.today : params['date']
  @amount = params['amount']
  @from_cur = params['from_cur']
  @to_cur = params['to_cur']
  #fx_rate = ExchangeRate.at(@date, @from_cur, @to_cur)
  #@conversion_result = (@amount.to_f * fx_rate).round(3)
  erb :fx_rates
end

