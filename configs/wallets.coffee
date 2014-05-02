MarketHelper = require "../lib/market_helper"

wallets = {}

for currency of MarketHelper.getCurrencies()
  Wallet = if process.env.NODE_ENV is "test" then require("../tests/helpers/#{currency.toLowerCase()}_wallet_mock") else require("../lib/crypto_wallets/#{currency.toLowerCase()}_wallet")
  wallets[currency] = new Wallet()

exports = module.exports = wallets