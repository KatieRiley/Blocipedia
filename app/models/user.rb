class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  has_many :wikis
  has_many :collaborators, through: :wikis, dependent: :destroy

  after_initialize {self.role ||= :standard}

  enum role: [:standard, :premium, :admin]

  def collaborator_for(wiki)
    collaborators.where(wiki_id: wiki.id).first
  end
end
