class UserMailer < ActionMailer::Base
  default from: "orders@bviolin.com"

  def send_order(session, order)
    @item_hash = session[:items]
    @total = session[:total]
    @order = order
    mail(:to => "boss@gmail.com", :subject => "order")
  end
end
