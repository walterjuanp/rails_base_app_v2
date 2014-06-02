Ransack.configure do |config|
  # date equals
  config.add_predicate 'eq_date',
    arel_predicate: 'eq',
    formatter: proc { |v| v.to_date },
    validator: proc { |v| v.present? },
    type: :string

  # date less than or equal 
  config.add_predicate 'lteq_date',
    arel_predicate: 'lteq',
    formatter: proc { |v| v.to_date },
    validator: proc { |v| v.present? },
    type: :string

  # date greater than or equal 
  config.add_predicate 'gteq_date',
    arel_predicate: 'gteq',
    formatter: proc { |v| v.to_date },
    validator: proc { |v| v.present? },
    type: :string
end
