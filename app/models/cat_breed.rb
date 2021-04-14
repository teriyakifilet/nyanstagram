class CatBreed < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'スコティッシュ・フォールド' },
    { id: 3, name: 'アメリカン・ショートヘア' },
    { id: 4, name: 'マンチカン' },
    { id: 5, name: 'ノルウェージャン・フォレスト・キャット' },
    { id: 6, name: 'ロシアンブルー' },
    { id: 7, name: 'アビシニアン' },
    { id: 8, name: 'ラグドール' },
    { id: 9, name: 'メイン・クーン' },
    { id: 10, name: 'ペルシャ' },
    { id: 11, name: 'ブリティッシュ・ショートヘア' },
    { id: 12, name: 'ソマリ' },
    { id: 13, name: 'ベンガル' },
    { id: 14, name: 'アメリカン・カール' },
    { id: 15, name: 'シンガプーラ' },
    { id: 16, name: 'エキゾチック' },
    { id: 17, name: 'ミックス' },
    { id: 18, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :cats
end