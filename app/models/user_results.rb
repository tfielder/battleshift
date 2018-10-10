class UserResults

  def initialize(filter = {})
    @filter = filter
  end

  def all_users
    api = BattleShiftService.new(@filter)
    @users ||= api.fetch_users_data.map do |user|
      User.new(user)
    end
  end

  def one_user
    api = BattleShiftService.new(@filter)
    data = api.fetch_one_user_data
    User.new(data)
  end
end
