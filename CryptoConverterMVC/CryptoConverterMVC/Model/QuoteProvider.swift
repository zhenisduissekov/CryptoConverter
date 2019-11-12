//
//  QuoteProvider.swift
//  CryptoConverterMVC
//
//  Created by Zhenis on 11/3/19.
//  Copyright © 2019 Zhenis. All rights reserved.
//

import Foundation

// парсить в SWIFTе еще не научился :(

// говорили про словарь
// не стал делать потому как данные разные, попробовал словарь в другом месте
// если очень важно конечно переделаю
var id_list = ["bitcoin", "ethereum", "ripple", "bitcoin-cash", "tether", "litecoin", "binance-coin", "eos", "bitcoin-sv", "stellar", "tron", "cardano", "monero", "unus-sed-leo", "huobi-token", "chainlink", "neo", "iota", "dash", "cosmos", "tezos", "ethereum-classic", "maker", "ontology", "usd-coin", "crypto-com-coin", "nem", "ino-coin", "dogecoin", "prizm", "basic-attention-token", "zcash", "insight-chain", "paxos-standard", "vechain", "hedgetrade", "decred", "qtum", "mexc-token", "0x", "trueusd", "thorenext", "thorecoin", "holo", "bitcoin-gold", "ravencoin", "zb", "abbc-coin", "kucoin-shares", "omisego", "luna", "bytom", "v-systems", "centrality", "nano", "cryptonex", "algorand", "educare", "silverway", "augur", "synthetix-network-token", "bittorrent", "lisk", "bitcoin-diamond", "digibyte", "dai", "siacoin", "mixin", "dimension-chain", "icon", "iostoken", "theta", "hypercash", "waves", "bitshares", "bytecoin-bcn", "karatgold-coin", "bitbook-gambling", "monacoin", "swipe", "ftx-token", "quant", "komodo", "crypto-com", "beldex", "aeternity", "verge", "okb", "flexacoin", "gaps", "chiliz", "maidsafecoin", "ardor", "energi", "nexo", "steem", "rlc", "zilliqa", "rif-token", "enjin-coin"]

var name_list = ["Bitcoin", "Ethereum", "XRP", "Bitcoin Cash", "Tether", "Litecoin", "Binance Coin", "EOS", "Bitcoin SV", "Stellar", "TRON", "Cardano", "Monero", "UNUS SED LEO", "Huobi Token", "Chainlink", "NEO", "IOTA", "Dash", "Cosmos", "Tezos", "Ethereum Classic", "Maker", "Ontology", "USD Coin", "Crypto.com Coin", "NEM", "INO COIN", "Dogecoin", "PRIZM", "Basic Attention Token", "Zcash", "Insight Chain", "Paxos Standard", "VeChain", "HedgeTrade", "Decred", "Qtum", "MEXC Token", "0x", "TrueUSD", "ThoreNext", "ThoreCoin", "Holo", "Bitcoin Gold", "Ravencoin", "ZB", "ABBC Coin", "KuCoin Shares", "OmiseGO", "LUNA", "Bytom", "V Systems", "Centrality", "Nano", "Cryptonex", "Algorand", "EDUCare", "Silverway", "Augur", "Synthetix Network Token", "BitTorrent", "Lisk", "Bitcoin Diamond", "DigiByte", "Dai", "Siacoin", "Mixin", "Dimension Chain", "ICON", "IOST", "THETA", "HyperCash", "Waves", "BitShares", "Bytecoin", "Karatgold Coin", "Bitbook Gambling", "MonaCoin", "Swipe", "FTX Token", "Quant", "Komodo", "MCO", "Beldex", "Aeternity", "Verge", "OKB", "Flexacoin", "GAPS", "Chiliz", "MaidSafeCoin", "Ardor", "Energi", "Nexo", "Steem", "iExec RLC", "Zilliqa", "RIF Token", "Enjin Coin"]

var symbol_list = ["BTC", "ETH", "XRP", "BCH", "USDT", "LTC", "BNB", "EOS", "BSV", "XLM", "TRX", "ADA", "XMR", "LEO", "HT", "LINK", "NEO", "MIOTA", "DASH", "ATOM", "XTZ", "ETC", "MKR", "ONT", "USDC", "CRO", "XEM", "INO", "DOGE", "PZM", "BAT", "ZEC", "INB", "PAX", "VET", "HEDG", "DCR", "QTUM", "MEXC", "ZRX", "TUSD", "THX", "THR", "HOT", "BTG", "RVN", "ZB", "ABBC", "KCS", "OMG", "LUNA", "BTM", "VSYS", "CENNZ", "NANO", "CNX", "ALGO", "EKT", "SLV", "REP", "SNX", "BTT", "LSK", "BCD", "DGB", "DAI", "SC", "XIN", "EON", "ICX", "THETA", "IOST", "HC", "WAVES", "BTS", "BCN", "KBC", "BXK", "MONA", "SXP", "FTT", "QNT", "KMD", "MCO", "BDX", "AE", "XVG", "OKB", "FXC", "GAP", "CHZ", "MAID", "ARDR", "NRG", "STEEM", "NEXO", "RLC", "ZIL", "RIF", "ENJ"]

// логотипы совсем разные, надо подбирать но важно ли это? лучше сосредоточиться на обучении
var image_list = ["0chain.png", "0x.png", "0xbtc.png", "0xcert.png", "1337coin.png", "1world.png", "2give.png", "300-token.png", "42-coin.png", "4new.png", "808coin.png", "8bit.png", "ab-chain-rtb.png", "abbc-coin.png", "abcc-token.png", "able.png", "absolute.png", "abulaba.png", "ac3.png", "accelerator-network.png", "acchain.png", "ace.png", "aced.png", "aces.png", "achain.png", "acoin.png", "acre.png", "actinium.png", "acute-angle-cloud.png", "adbank.png", "adcoin.png", "adelphoi.png", "adenz.png", "adhive.png", "aditus.png", "adrenaline.png", "adshares.png", "adtoken.png", "adultchain.png", "advanced-internet-blocks.png", "adx-net.png", "adzcoin.png", "aegeus.png", "aelf.png", "aeon.png", "aergo.png", "aeron.png", "aeternity.png", "agrello-delta.png", "agrolot.png", "aichain.png", "aidcoin.png", "aidoc.png", "aidos-kuneen.png", "aigang.png", "ailink-token.png", "aion.png", "airbloc.png", "airswap.png", "airtoken.png", "airwire.png", "akroma.png", "akuya-coin.png", "alax.png", "alchemint-standards.png", "alibabacoin.png", "alis.png", "all-sports.png", "allcoin.png", "allion.png", "allsafe.png", "alpha-coin.png", "alphabitcoinfund.png", "alphacat.png", "alqo.png", "alt-estate-token.png", "altcoin-alt.png", "altcommunity-coin.png", "alttex.png", "amber.png", "amlt.png", "ammo-reloaded.png", "amo-coin.png", "amon.png", "amsterdamcoin.png", "anarchistsprime.png", "animation-vision-cash.png", "animecoin.png", "anon.png", "anoncoin.png", "antimatter.png", "apex.png", "aphelion.png", "apis.png", "apollo-currency.png", "apollon.png", "apot.png", "appcoins.png", "apr-coin.png", "apx.png", "aquariuscoin.png", "aragon.png", "arbidex.png", "arbit.png", "arbitracoin.png", "arbitrage.png", "arbitragect.png", "arcblock.png", "archetypal-network.png", "arcticcoin.png", "ardor.png", "arepacoin.png", "argentum.png", "argus.png", "aricoin.png", "arion.png", "arionum.png", "ark.png", "arlize.png", "artbyte.png", "artex-coin.png", "asch.png", "aseancoin.png", "asiacoin.png", "asiadigicoin.png", "aston.png", "astro.png", "asura-coin.png", "atbcoin.png", "atc-coin.png", "atheios.png", "atidium.png", "atlant.png", "atlantis-blue-digital-token.png", "atlas-protocol.png", "atmcoin.png", "atmos.png", "atn.png", "atomic-coin.png", "atonomi.png", "attention-token-of-media.png", "auctus.png", "audiocoin.png", "augur.png", "aurora-dao.png", "aurora.png", "auroracoin.png", "aurumcoin.png", "authorship.png", "autonio.png", "auxilium.png", "avatarcoin.png", "aventus.png", "avinoc.png", "avoncoin.png", "aware.png", "axiom.png", "axpire.png", "azart.png", "b2bcoin.png", "b2bx.png", "b3coin.png", "baasid.png", "babb.png", "banca.png", "bancor.png", "bank-coin.png", "bankcoin.png", "bankera.png", "bankex.png", "banyan-network.png", "basic-attention-token.png", "bastonet.png", "bata.png", "bbscoin.png", "bdt-token.png", "bean-cash.png", "beat.png", "beatcoin.png", "bee-token.png", "beekan.png", "beetle-coin.png", "belacoin.png", "belugapay.png", "benjirolls.png", "benz.png", "berncash.png", "betacoin.png", "bethereum.png", "betterbetting.png", "bettex-coin.png", "bezant.png", "bezop.png", "bffdoom.png", "bgogo-token.png", "bhpcash.png", "biblepay.png", "bibox-token.png", "bigbom.png", "bigone-token.png", "bigup.png", "billionaire-token.png", "binance-coin.png", "bingocoin.png", "biobar.png", "biocoin.png", "bionic.png", "biotron.png", "bipcoin.png", "birake.png", "birds.png", "bismuth.png", "bit-tube.png", "bit-z-token.png", "bit20.png", "bitair.png", "bitasean.png", "bitbar.png", "bitbase.png", "bitbay.png", "bitblocks.png", "bitbtc.png", "bitcapitalvendor.png", "bitclave.png", "bitcloud.png", "bitcny.png", "bitcoal.png", "bitcoen.png", "bitcoin-21.png", "bitcoin-adult.png", "bitcoin-atom.png", "bitcoin-cash.png", "bitcoin-diamond.png", "bitcoin-file.png", "bitcoin-god.png", "bitcoin-gold.png", "bitcoin-green.png", "bitcoin-incognito.png", "bitcoin-instant.png", "bitcoin-interest.png", "bitcoin-one.png", "bitcoin-planet.png", "bitcoin-plus.png", "bitcoin-private.png", "bitcoin-red.png", "bitcoin-scrypt.png", "bitcoin-sv.png", "bitcoin-token.png", "bitcoin-w-spectrum.png", "bitcoin-x.png", "bitcoin-zero.png", "bitcoin.png", "bitcoindark.png", "bitcoinfast.png", "bitcoinote.png", "bitcoinus.png", "bitcoinx.png", "bitcoinz.png", "bitconnect.png", "bitcore.png", "bitcrystals.png", "bitcurrency.png", "bitdeal.png", "bitdegree.png", "bitdice.png", "bitether.png", "biteur.png", "bitf.png", "bitgem.png", "bitgold.png", "bitguild-plat.png", "bitibu-coin.png", "bitkan.png", "bitmark.png", "bitmart-token.png", "bitmoney.png", "bitnation.png", "bitnautic-token.png", "bitnewchain.png", "bitok.png", "bitquark.png", "bitqy.png", "bitradio.png", "bitrent.png", "bitrewards.png", "bitscreener-token.png", "bitsend.png", "bitserial.png", "bitshares-music.png", "bitshares.png", "bitsilver.png", "bitsoar.png", "bitspace.png", "bitstar.png", "bitstation.png", "bitsum.png", "bitswift.png", "bittwatt.png", "bitup-token.png", "bitusd.png", "bitvolt.png", "bitwhite.png", "bitzeny.png", "blackcoin.png", "blackmoon.png", "blakecoin.png", "blakestar.png", "blast.png", "blazecoin.png", "blazercoin.png", "blitzpredict.png", "bloc-money.png", "block-array.png", "block-chain-com.png", "block-logic.png", "blockcat.png", "blockcdn.png", "blockchain-certified-data-token.png", "blockchain-quotations-index-token.png", "blocklancer.png", "blockmason.png", "blockmesh.png", "blocknet.png", "blocknode.png", "blockpass.png", "blockpool.png", "blockport.png", "blocktix.png", "blocktrade-token.png", "blocktrade.png", "blockv.png", "bloomtoken.png", "blox.png", "blue-whale-token.png", "bluecoin.png", "bluzelle.png", "bnktothefuture.png", "bnrtxcoin.png", "bobs-repair.png", "bodhi-eth.png", "bodhi.png", "bolenum.png", "bolivarcoin.png", "bonpay.png", "boolberry.png", "boostcoin.png", "boscoin.png", "bottos.png", "bounty0x.png", "boutspro.png", "bowhead.png", "bowscoin.png", "box-token.png", "boxx-token-blockparty.png", "brahmaos.png", "brat.png", "bread.png", "breakout-stake.png", "breakout.png", "breezecoin.png", "briacoin.png", "brickblock.png", "bridge-protocol.png", "bridgecoin.png", "britcoin.png", "brokernekonetwork.png", "bt2-cst.png", "btcmoon.png", "btctalkcoin.png", "bubble.png", "budbo.png", "buggyra-coin-zero.png", "bullion.png", "bulwark.png", "bumbacoin.png", "bumo.png", "bunnycoin.png", "bunnytoken.png", "burst.png", "business-credit-alliance-chain.png", "buzzcoin.png", "byteball.png", "bytecent.png", "bytecoin-bcn.png", "bytom.png", "bzlcoin.png", "c-bit.png", "c20.png", "c2c-system.png", "cabbage.png", "cachecoin.png", "californium.png", "callisto-network.png", "campuscoin.png", "canada-ecoin.png", "candy.png", "cannabiscoin.png", "cannacoin.png", "cannation.png", "canyacoin.png", "capdaxtoken.png", "cappasity.png", "capricoin.png", "carat.png", "carblock.png", "carboncoin.png", "carboneum-c8-token.png", "cardano.png", "cardbuyers.png", "cardstack.png", "carebit.png", "cargox.png", "carinet.png", "carlive-chain.png", "cartaxi-token.png", "carvertical.png", "cashaa.png", "cashbery-coin.png", "cashbet-coin.png", "cashcoin.png", "casinocoin.png", "castle.png", "catcoin.png", "catocoin.png", "cazcoin.png", "ccore.png", "cedex-coin.png", "ceek-vr.png", "celsius.png", "centaure.png", "centrality.png", "centurion.png", "cfun.png", "chaincoin.png", "chainium.png", "chainlink.png", "chancoin.png", "change.png", "chatcoin.png", "cheapcoin.png", "cheesecoin.png", "chesscoin.png", "chex.png", "chips.png", "chronobank.png", "chronologic.png", "cindicator.png", "circuits-of-value.png", "citadel.png", "civic.png", "civitas.png", "cjs.png", "ckusd.png", "clams.png", "clearcoin.png", "clearpoll.png", "clipper-coin.png", "cloakcoin.png", "cloud.png", "clubcoin.png", "cmitcoin.png"]

// метод для генерирования данных
// генерирую цену заранее чтобы потом ее можно было связать с ценой от биткоин
// также сделал так чтобы у биткоина был шанс быть больше чем другие котировки
class QuoteProvider {
  var timer: Timer?
  enum Constants {
    static var decimalRange = 1000.0
    static var minValue = 1e10
    static var maxValue = 1e11
    static var minPercent1h = -10.0
    static var maxPercent1h = 10.0
    static var minPercent24h = -50.0
    static var maxPercent24h = 50.0
    static var minPercent7d = -100.0
    static var maxPercent7d = 100.0
    
  }
  
  func generateRandom (from min: Double, to max: Double) -> Double {
    return round(Double.random(in: min...max)*Constants.decimalRange)/Constants.decimalRange
  }
  
  func generateQuotes(count: Int) -> [Quote] {
    var result: [Quote] = []
    for i in 0..<count {
      let temp_price = i == 0 ? generateRandom(from: 1000, to: 10000) : generateRandom(from: 0, to: 1000)
      let quote = Quote(id: id_list[i % id_list.count],
                        name: name_list[i % id_list.count],
                        symbol: symbol_list[i % symbol_list.count],
                        rank: i + 1,
                        price_usd: temp_price,
                        price_btc: i == 0 ? 1 : round(temp_price/result[0].price_usd*Constants.decimalRange)/Constants.decimalRange,
                        _24h_volume_usd: generateRandom(from: Constants.minValue, to: Constants.maxValue),
                         market_cap_usd: generateRandom(from: Constants.minValue, to: Constants.maxValue),
                        available_supply: generateRandom(from: Constants.minValue, to: Constants.maxValue),
                        total_supply: generateRandom(from: Constants.minValue, to: Constants.maxValue),
                        max_supply: generateRandom(from: Constants.minValue, to: Constants.maxValue),
                        // для реалистичности сделал процент за час меньше чем за 24ч и соответственно мнеьше 7дней
        percent_change_1h: generateRandom(from: Constants.minPercent1h, to: Constants.maxPercent1h),
        percent_change_24h: generateRandom(from: Constants.minPercent24h, to: Constants.maxPercent24h),
        percent_change_7d: generateRandom(from: Constants.minPercent7d, to: Constants.maxPercent7d),
                        last_updated: Date())
      result.append(quote)

    }

    return result
  }
  
  
}


