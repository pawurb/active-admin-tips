class Admin::Users::BulkSetEmailForm
  include ActiveModel::Conversion
  include ActiveModel::Validations
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  attr_reader :users

  def initialize(users_ids = [])
    @users = User.where(id: users_ids)
  end

  def submit(params)
    @params = params
    return false unless valid?

    @params.fetch(:users_ids).zip(@params.fetch(:users_emails)).each do |pair|
      User.find(pair.fetch(0)).update!(email: pair.fetch(1))
    end

    true
  rescue => e
    Rails.logger.error e
    false
  end

  def valid?
    emails_valid = @params.fetch(:users_emails).all? do |email|
      email.match(VALID_EMAIL_REGEX)
    end

    errors.add :base, "All emails must be valid" unless emails_valid

    emails_valid
  end

  def self.model_name
    ActiveModel::Name.new(self, nil, "Tree")
  end
end
