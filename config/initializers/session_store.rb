if Rails.env === 'production'
  Rails.application.config.session_store :cookie_store, key: '_strongr', domain: 'taboo-join.surge.sh'
else
  Rails.application.config.session_store :cookie_store, key: '_strongr'
end
