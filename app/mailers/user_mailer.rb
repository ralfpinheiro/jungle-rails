class UserMailer < ApplicationMailer
    default from: 'no-reply@jungle.com'

    def order_email(user, order)
        @user = user
        @order = order
        mail(to: @user.email, subject: "Order ##{order.id} confirmation" )
    end
end

