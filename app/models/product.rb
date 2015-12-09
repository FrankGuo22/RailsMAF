class Product < ActiveRecord::Base
  has_many :line_items

  before_destroy :ensure_not_referenced_by_any_line_item
  validates :title, :description, :image_url, :price, :bottle_size, :company, :country, :country, :grape_type, :suit_vegetarian, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :title, uniqueness: true
  validates :image_url, allow_blank: true, format: {
      with:    %r{\.(gif|jpg|png)\Z}i,
      message: 'must be a URL for GIF, JPG or PNG image.'
    }
    def as_json(options={})
      super(:only => [:title, :description,:image_url,:price,:bottle_size,:company,:country,:grape_type,:suit_vegetarian,:supplier_id])
    end
    private

        # ensure that there are no line items referencing this product
        def ensure_not_referenced_by_any_line_item
          if line_items.empty?
            return true
          else
            errors.add(:base, 'Line Items present')
            return false
          end
        end
        
        def self.like(query)
            if query.nil?
              []
            else
              where('title LIKE :query ' +
                    'OR description LIKE :query ' +
                    'OR bottle_size LIKE :query ' +
                    'OR company LIKE :query ' +
                    'OR country LIKE :query ' +
                    'OR grape_type LIKE :query' ,
                    query: "%#{query}%")
              end
          end
          
end
