class EventMailer < ApplicationMailer
  def subscription(event, subscription)
    @email = subscription.user_email
    @name = subscription.username
    @event = event

    mail to: event.user.email, subject: default_i18n_subject(event: event.title)
  end

  def comment(event, comment, email)
    @comment = comment
    @event = event 

    mail to: event.user.email, subject: default_i18n_subject(event: event.title)

  end

  def pic(event, photo, email)
    @photo = photo
    @event = event

    mail to: event.user.email, subject: default_i18n_subject(event: event.title)
  end
end
