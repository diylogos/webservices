class TradeArticle
  include Indexable

  self.settings = {}
  self.mappings = {
    name.typeize => {
      dynamic:    'false',
      properties: {
        content:     { type: 'string', analyzer: 'snowball' },
        title:       { type: 'string', analyzer: 'snowball' },
        evergreen:   { type: 'boolean' },
        pub_date:    { type: 'date', format: 'YYYY-MM-dd' },
        update_date: { type: 'date', format: 'YYYY-MM-dd' },
      },
    },
  }.freeze
end
