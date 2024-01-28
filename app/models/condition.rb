class Condition < ActiveHash::Base
  self.data = [
    { id: 1, condition: '---' },
    { id: 2, condition: '新品・未使用' },
    { id: 3, condition: '未使用に近い' },
    { id: 4, condition: '目立った傷や汚れなし' },
    { id: 5, condition: 'やや傷や汚れあり' },
    { id: 6, condition: '傷や汚れあり' },
    { id: 7, condition: '全体的に状態が悪い' }
  ]

  include ActiveHash::Associations
  has_many :products


  end