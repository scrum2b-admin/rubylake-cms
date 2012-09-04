class Comment < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :comment,:commentable_id, :commentable_type
  belongs_to :commentable, :polymorphic => true
  belongs_to :user
  default_scope :order => 'created_at ASC'
  def self.create_for (user, commentable, params)
    comment = Comment.new(params)
    comment.commentable_id = commentable.id
    comment.commentable_type = commentable.class.name
    comment.user = user
    return comment
  end

  def destroy_comment

  end

  def to_maps
    { :id => self.id,:commentable_id => self.commentable_id, :commentable_type => self.commentable_type ,:comment => self.comment}
  end
end
