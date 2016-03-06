class CurrencySerializer < ActiveModel::Serializer
  attributes :name, :currency, :currency_code
end
