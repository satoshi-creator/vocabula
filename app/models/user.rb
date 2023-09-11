class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :relationships
  has_many :decks, through: :relationships

  def relationship(deck_id)
    relationships.create(deck_id: deck_id)
  end
end
