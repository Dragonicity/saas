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

rails db:migrate


In config/initializers/milia.rb make sure the following are false:

```
config.use_coupon = false
config.use_recaptcha = false
```

Update Home controller:

class HomeController < ApplicationController
  skip_before_action :authenticate_tenant!, :only => [ :index ]

  def index
    if current_user
      if session[:tenant_id]
        Tenant.set_current_tenant session[:tenant_id]
      else
        Tenant.set_current_tenant current_user.tenants.first
      end
    @tenant = Tenant.current_tenant 
    params[:tenant_id] = @tenant.id
    end
  end
end