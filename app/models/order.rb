class Order < ApplicationRecord
  has_many :order_items
  before_save :update_total
  before_create :update_status

  def calculate_total
    self.order_items.collect { |item| item.amount }.sum
  end

  def calculate_total_cent
  self.order_items.collect { |item| item.amount }.sum * 100
end


  private

  def update_status
    if self.status == nil?
      self.status = "In progress"
    end
  end

  def update_total
    self.total = calculate_total
  end

end
