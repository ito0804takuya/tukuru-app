module ControllerMacros
  def login(company)
    @request.env["devise.mapping"] = Devise.mappings[:company]
    sign_in company
  end
end