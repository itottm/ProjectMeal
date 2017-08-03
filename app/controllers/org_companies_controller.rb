class OrgCompaniesController < ApplicationController
  before_action :signed_in_user, only: [:new]

  def new
    signed_in_user
    @company = OrgCompany.new
    @contactInfo = OrgContact.new.attributes
    @company.org_contacts.build(@contactInfo)
  end

  private
    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, flash: {warning: "Please sign in."}
      end
    end
end
