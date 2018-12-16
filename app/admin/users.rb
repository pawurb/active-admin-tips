ActiveAdmin.register User do
  preserve_default_filters!

  filter :posts, as: :select, collection: -> { Post.pluck(:title, :id) }

  permit_params :first_name, :last_name, :email

  form do |f|
    f.inputs "Details" do
      f.input :first_name
      f.input :last_name
      f.input :email
    end
    f.actions
  end

  batch_action :bulk_set_email do |ids|
    render "admin/users/bulk_set_email", locals: {
      form: Admin::Users::BulkSetEmailForm.new(ids)
    }
  end

  collection_action :bulk_set_email, method: :put do
    form = Admin::Users::BulkSetEmailForm.new(
      params.fetch(:users).fetch(:users_ids)
    )

    if form.submit(params.fetch(:users))
      redirect_to admin_users_path, notice: "Users emails updated"
    else
      flash[:notice] = "There was a problem updating users emails"
      render "admin/users/bulk_set_email", locals: {
        form: form
      }
    end
  end
end
