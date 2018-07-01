module TargetPoints
  NOTHING = 5
  BOMB = -50
  FLAG = 100

  def self.point_of(target_type)
    case target_type.to_s
    when 'flag'
      FLAG
    when 'bomb'
      BOMB
    else
      NOTHING
    end
  end
end
