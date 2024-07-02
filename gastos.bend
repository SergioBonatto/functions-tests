# def main():
#   apto    = 3000
#   pensao  = 1000
#   cc      = 1000
#   emer    = 500
#   totalSP = (apto + pensao + cc + emer)
#   totalRS = (1000 + pensao + cc + emer)
#   caixa   = (30000 / 7000)
#   return (("meses: ", caixa),("SP: ", totalSP), ("RS: ", totalRS))



def main():
  aluguel   = 1000
  multa     = 3200
  pensao    = 1000
  cc        = 1300
  contadora = 1200
  passagem  = 800
  contas    = 500
  rs        = 1000
  totalSP   = (aluguel + pensao + cc + contadora + passagem + contas + multa)
  sobra     = (10000 - totalSP)
  return sobra


