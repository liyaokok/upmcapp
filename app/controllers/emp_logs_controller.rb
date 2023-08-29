class EmpLogsController < ApplicationController
    before_action :require_company_manager_role!

    def new
    end
end