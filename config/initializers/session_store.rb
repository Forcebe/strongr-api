if Rails.env === 'production'
  Rails.application.config.session_store :cookie_store, key: '_strongr', domain: 'your-frontend-domain'
else
  Rails.application.config.session_store :cookie_store, key: '_strongr'
end