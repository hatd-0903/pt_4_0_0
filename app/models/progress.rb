class Progress < ActiveRecord::Base
  has_paper_trail
  before_validation :add_custom_field_pt

  def add_custom_field_pt
    @changed_attributes.merge! cp_change_logs: nil
  end

  def cp_change_logs
    {
      division_id: 1
    }
  end
end
