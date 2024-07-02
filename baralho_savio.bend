type Nipe:
  Ouro
  Copas
  Paus
  Espadas

type Card:
  As 
  Dois 
  Tres 
  Quatro 
  Cinco 
  Seis 
  Sete 
  Oito 
  Nove 
  Dez 
  Valete 
  Dama 
  Rei 

object Face { nipe , card}

type Deck:
  Empty
  Cards {face , ~tail} 

def red_deck_count(deck):
  match deck: 
    case Deck/Empty:
      return 0
    case Deck/Cards:
      open Face: deck.face
      match deck.face.nipe:
        case Nipe/Ouro:
          return  (1 + red_deck_count(deck.tail))
        case Nipe/Copas:
          return (1 + red_deck_count(deck.tail))
        case Nipe/Paus:
          return red_deck_count(deck.tail)
        case Nipe/Espadas:
          return red_deck_count(deck.tail)
        case _:
          return 0


def is_nipe(nipe):
  match nipe:
    case Nipe/Copas:
      return 8
    case Nipe/Ouro:
      return 2
    case Nipe/Paus:
      return 3
    case Nipe/Espadas:
      return 1
    case _:
      return 0

def main():
  decks = Deck/Cards(Face{nipe: 68, card:Card/As},
          (Deck/Cards(Face{nipe: Nipe/Copas, card:Card/As},
          (Deck/Cards(Face{nipe: Nipe/Paus, card:Card/As},
          (Deck/Cards(Face{nipe: Nipe/Espadas, card:Card/As},
          Deck/Empty)))))))
  return red_deck_count(decks)
