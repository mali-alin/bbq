class EventMailer < ApplicationMailer
  def subscription(event, subscription)
    @email = subscription.user_email
    @name = subscription.username
    @event = event

    mail to: event.user.email, subject: "Новая подписка на #{event.title}"
  end

  def comment(event, comment, email)
    @comment = comment
    @event = event 

    mail to: email, subject: "Новый комментарий @ #{event.title}"
  end

  def pic(event, photo, email)
    @photo = photo
    @event = event

    mail to: email, subject: "Добавлена фотография к событию #{@event.title}"
  end
end
