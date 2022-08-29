class UsersIndex < Chewy::Index
  index_scope User.includes(:receipts)
  field :name, type: 'keyword'
  field :age, type: 'integer'
  field :receipts do
    field :title, type: 'keyword'
    field :amount, type: 'integer'
    field :issued_at, type: 'date'
  end

  class << self
    # 年齢が20歳以上25歳以下の月別平均金額を出す
    def sample_aggs
      UsersIndex
        .query(range: { age: { gte: 20, lte: 25 } })
        .aggs(
          by_month: {
            date_histogram: { 
              field:    "receipts.issued_at",
              interval: "month",
              format:   "yyyy-MM"
            },
            aggs: {
              avg_amount: {
                avg: { field: "receipts.amount"}
              }
            }
          }
        ).aggs
      end
  end
end
