import requests
from tkinter import Tk, Label, Button


def extrair_cotacoes():
    requisicao = requests.get(
        "https://economia.awesomeapi.com.br/last/USD-BRL,EUR-BRL,BTC-BRL")
    cotacoes = requisicao.json()
    cotacao_dolar = cotacoes['USDBRL']['bid']
    cotacao_euro = cotacoes['EURBRL']['bid']
    cotacao_bitcoin = cotacoes['BTCBRL']['bid']
    resposta = f'''
    Dólar: R$ {cotacao_dolar}
    Euro: R$ {cotacao_euro}
    Bitcoin: R$ {cotacao_bitcoin}
    '''
    texto_cotacoes['text'] = resposta


tela = Tk()
tela.title('Cotação de moedas')
tela.geometry('500x300')

texto_explicacao = Label(
    tela,
    text="Cotação é modificada a cada 30 segundos",
    font="freesans 18 bold"
    )
texto_explicacao.grid(column=0, row=0, padx=10, pady=10)

botao = Button(tela, text='Atualizar Cotações', command=extrair_cotacoes)
botao.grid(column=0, row=1, padx=10, pady=10)

texto_cotacoes = Label(tela, text='')
texto_cotacoes.grid(column=0, row=2, padx=10, pady=10)

tela.mainloop()
