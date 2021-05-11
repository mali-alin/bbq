class Subscription < ApplicationRecord
  belongs_to :event
  belongs_to :user, optional: true

  validates :event, presence: true

  # проверки выполняются только если user не задан (незареганные приглашенные)
  validates :username, presence: true, unless: -> { user.present? }
  validates :user_email, presence: true, format: /\A[a-zA-Z0-9\-_.]+@[a-zA-Z0-9\-_.]+\z/, unless: ->  { user.present? }

  # для данного event_id один юзер может подписаться только один раз (если юзер задан)
  validates :user, uniqueness: {scope: :event_id}, if: -> { user.present? }

  # для данного event_id один email может использоваться только один раз (если нет юзера, анонимная подписка)
  validates :user_email, uniqueness: {scope: :event_id}, unless: -> { user.present? }

  validate :check_event_owner, if: -> { user.present? }

  validate :check_email_registered, unless: -> { user.present? }

  # переопределяем метод, если есть юзер, выдаем его имя,
  # если нет -- дергаем исходный переопределенный метод
  def username
    if user.present?
      user.username
    else
      super
    end
  end

  # переопределяем метод, если есть юзер, выдаем его email,
  # если нет -- дергаем исходный переопределенный метод
  def user_email
    if user.present?
      user.email
    else
      super
    end
  end

  def check_event_owner
     if event.user == user
      errors[:base] << I18n.t("controllers.subscriptions.subscribe_error")

     end
  end

  def check_email_registered
    if User.find_by(email: user_email).present?
      errors[:base] << I18n.t("controllers.subscriptions.existing_email")
    end
  end
end
