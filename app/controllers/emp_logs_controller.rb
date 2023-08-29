class EmpLogsController < ApplicationController
    before_action :require_company_manager_role!

    def new
        @entries = recent_entries
    end

    private

    def recent_entries
        EmpLog.order("created_at DESC").limit(20)
    end
end