Include the milia gem:

```
gem 'milia'
```


Add to the application_controller.rb:

```
before_action :authenticate_tenant! 
```

Change before_filter to before_action in config/initializers/devise_permitted_parameters

Add Rails version to the add_sessions_table.rb migration:

class AddSessionsTable < ActiveRecord::Migration[5.1]

