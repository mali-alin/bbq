class EventMailer < ApplicationMailer
  def subscription(event, subscription)
    @email = subscription.user_email
    @name = subscription.username
    @event = event

    mail to: event.user.email, subject: "#{I18n.t("mailers.event_mailer.new_subscription")} #{event.title}"
  end

  def comment(event, comment, email)
    @comment = comment
    @event = event 

    mail to: email, subject: "#{I18n.t("mailers.event_mailer.new_subscription")} #{event.title}"
  end

  def pic(event, photo, email)
    @photo = photo
    @event = event

    mail to: email, subject: "#{I18n.t("mailers.event_mailer.new_subscription")} #{@event.title}"
  end
end
