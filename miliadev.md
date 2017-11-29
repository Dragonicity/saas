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



rails generate migration add_plan_to_tenants plan:string

Add plan model:

class Plan
  PLANS = [:free, :premium]

  def self.options
    PLANS.map { |plan| [plan.capitalize, plan] }
  end
end

Whitelist the plan attribute in the Milia initializer:

config.whitelist_tenant_params = [:plan]

Amend the Tenant model:

validates_uniqueness_of :name
validates_presence_of :name

tenant = Tenant.new(tenant_params)

