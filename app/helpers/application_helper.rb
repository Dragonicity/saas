module ApplicationHelper

  def tenant_name(tenant_id)
    Tenant.find(tenant_id).name
  end

  def class_name_for_tenant_form(tenant)
    return "cc_form" if tenant.payment.blank?
    ""
  end

end