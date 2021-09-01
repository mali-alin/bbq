# BBQ
**Данное приложение предоставляет возможность создавать события, подписываться на них, оставлять комментарии и фотографии.**

### Регистрация и вход:
Приложение поддерживает пока только стандартную регистрацию.
### Создание события:
![Запись экрана 2021-09-01 в 13 51 03](https://user-images.githubusercontent.com/79279989/131667838-5fbfd122-d9ef-42fb-986e-1628843fec11.gif)

Пользователь может создавать, редактировать и удалять события. Также пользователь может поставить пин-код на событие (опционально). При подписке пользователь получает уведомление на почту. Все пользователи, подписанные на событие, получает уведомление на почту, если под событием кто-то оставляет комментарий.

### О приложении:
- Развернуто на VPS **DigitalOcean** (Ubuntu 20.04 + nginx + Phusion Passenger);
- База данных **PostgreSQL** для локального хранения данных;
- Хранилище пользовательских данных и фотографий, организованное на **Amazon S3 AWS** c помощью **carrierwave** и **rmagic** gems;
- Служба **Mailjet** для отправки электронной почты;
- Локализовано с помощью **I18n**;
- Фотогалерея, организованна через **lightbox**.

### Как пользоваться приложением:
1) Склонировать приложение на комьютер. (git clone git@github.com:mali-alin/bbq.git)
2) Сделать `bundle` всех гемов
3) Прогнать все миграции командой: `rails db:migrate`
4) Чтобы приложение работало, вам нужно создать файлы database.yml.

database.yml

```
  default: &default
  adapter: sqlite3
  pool: 5
  timeout: 5000

  development:
    <<: *default
    database: `name`

  production:
    adapter: postgresql
    user: `user vps`
    password: `password database`
    database: `name`
```
5) В корневой папке bbq создать файл .env
```
MAILJET_API_KEY = ''

MAILJET_SECRET_KEY = ''

MAILJET_SENDER = ''
```

6) Запустить команду: `rails s`

### Версии:
`Rails` - 6.0.3.6
`Ruby` - 2.7.2




