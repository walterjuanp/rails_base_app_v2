class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable#, :registerable

  # 
  ransacker :created_at_casted do |parent|
    Arel::Nodes::SqlLiteral.new("date(admins.created_at)")
  end
  ransacker :updated_at_casted do |parent|
    Arel::Nodes::SqlLiteral.new("date(admins.updated_at)")
  end

end
