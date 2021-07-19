import requests


def extrair_cotacoes():
    requisicao = requests.get(
        "https://economia.awesomeapi.com.br/last/USD-BRL,EUR-BRL,BTC-BRL")

    cotacoes = requisicao.json()

    cotacao_dolar = cotacoes['USDBRL']['bid']
    cotacao_euro = cotacoes['EURBRL']['bid']
    cotacao_bitcoin = cotacoes['BTCBRL']['bid']

    texto = f'''
    Dólar: R$ {cotacao_dolar}
    Euro: R$ {cotacao_euro}
    Bitcoin: R$ {cotacao_bitcoin}
    '''

    print(texto)


extrair_cotacoes()
