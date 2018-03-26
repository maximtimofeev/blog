class AddSeobleToSeos < ActiveRecord::Migration[5.1]
  def change
    add_reference :seos, :seoble, polymorphic: true
  end
end
