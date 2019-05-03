class BestDaySerializer
  include FastJsonapi::ObjectSerializer
  attributes :best_day do |object|
    object.date
  end
end
