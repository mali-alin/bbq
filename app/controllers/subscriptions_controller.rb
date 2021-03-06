class SubscriptionsController < ApplicationController
  before_action :set_event, only: [:create, :destroy]
  before_action :set_subscription, only: [:destroy]

  # POST /subscriptions
  def create
    @new_subscription = @event.subscriptions.build(subscription_params)
    @new_subscription.user = current_user

    if @new_subscription.save
      EventMailer.subscription(@event, @new_subscription).deliver_now
      # Если сохранилась успешно, редирект на страницу самого события
      redirect_to @event, notice: I18n.t("controllers.subscriptions.created")
    else
      # если ошибки — рендерим здесь же шаблон события
      render "events/show", alert: I18n.t("controllers.subscriptions.error")
    end
  end

  def destroy
    message = {notice: I18n.t("controllers.subscriptions.destroyed")}

    if current_user_can_edit?(@subscription)
      @subscription.destroy
    else
      message = {alert: I18n.t("controllers.subscriptions.error")}
    end

    redirect_to @event, message
  end

  private
  def set_subscription
    @subscription = @event.subscriptions.find(params[:id])
  end

  def set_event
    @event = Event.find(params[:event_id])
  end

  # Only allow a trusted parameter "white list" through.
  def subscription_params
    params.fetch(:subscription, {}).permit(:user_email, :username)
  end
end
