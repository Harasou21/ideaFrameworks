class Mandalart < ApplicationRecord
  $mandalart_blocks_num = 9

  validates :text, length: { maximum: 300 }
end
