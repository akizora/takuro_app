ActiveAdmin.register Employee do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :department, :gender, :birth, :joined_date, :payment, :note, :lock_version
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :department, :gender, :birth, :joined_date, :payment, :note, :lock_version]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  permit_params :name, :department, :gender, :birth, :joined_date, :payment, :note
end
