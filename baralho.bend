# Beggar-My-Neighbour game

type Suit:
  spades
  clubs
  hearts
  diamonds

type Ranks:
  A
  2
  3
  4
  5
  6
  7
  9
  10
  J
  Q
  K

object Card {
  rank,
  suit  
}

object Player {
  points,
  hand
}



def createCard(r, s):
  return Card { rank: r, suit: s } 

def hand():
  return createCard(Ranks/2, Suit/diamonds)


def rank_to_num(card):
  open Card: card
  match card.rank:
    case Ranks/A:
      return 1
    case Ranks/2:
      return 2
    case Ranks/3:
      return 3
    case Ranks/4:
      return 4
    case Ranks/5:
      return 5
    case Ranks/6:
      return 6
    case Ranks/7:
      return 7
    case Ranks/9:
      return 9
    case Ranks/10:
      return 10
    case Ranks/J:
      return 10
    case Ranks/Q:
      return 10
    case Ranks/K:
      return 10


def is_bigger(card1, card2):
  return (rank_to_num(card1)) > (rank_to_num(card2))

def is_equal(card1, card2):
  return (rank_to_num(card1)) == (rank_to_num(card2))


def range(start, end):
  switch (start == end):
    case 0:
      return List/Cons(start, range(start + 1, end))
    case _:
      return List/Nil




def main():
  deck = [createCard(Ranks/2, Suit/diamonds), 
          createCard(Ranks/3, Suit/hearts), 
          createCard(Ranks/4, Suit/spades),
          createCard(Ranks/5, Suit/diamonds)]
  # return is_bigger((take(23, totalDeck())), (take(8, totalDeck())))
  return range(0, 52)

def countCard(card, cond):
  switch cond(card):
    case 0:
      return 0
    case _:
      return 1  

def countDeck(deck, cond):
  match deck:
    case List/Nil:
      return 0
    case List/Cons:
      return (countCard(deck.head, cond)) + (countDeck(deck.tail, cond))

def totalDeck():
  deck = [createCard(Ranks/A, Suit/hearts),
          createCard(Ranks/2, Suit/hearts), 
          createCard(Ranks/3, Suit/hearts), 
          createCard(Ranks/4, Suit/hearts),
          createCard(Ranks/5, Suit/hearts),
          createCard(Ranks/6, Suit/hearts),
          createCard(Ranks/7, Suit/hearts),
          createCard(Ranks/9, Suit/hearts),
          createCard(Ranks/10, Suit/hearts),
          createCard(Ranks/J, Suit/hearts),
          createCard(Ranks/Q, Suit/hearts),
          createCard(Ranks/K, Suit/hearts),
          createCard(Ranks/A, Suit/diamonds),
          createCard(Ranks/2, Suit/diamonds), 
          createCard(Ranks/3, Suit/diamonds), 
          createCard(Ranks/4, Suit/diamonds),
          createCard(Ranks/5, Suit/diamonds),
          createCard(Ranks/6, Suit/diamonds),
          createCard(Ranks/7, Suit/diamonds),
          createCard(Ranks/9, Suit/diamonds),
          createCard(Ranks/10, Suit/diamonds),
          createCard(Ranks/J, Suit/diamonds),
          createCard(Ranks/Q, Suit/diamonds),
          createCard(Ranks/K, Suit/diamonds),
          createCard(Ranks/A, Suit/spades),
          createCard(Ranks/2, Suit/spades), 
          createCard(Ranks/3, Suit/spades), 
          createCard(Ranks/4, Suit/spades),
          createCard(Ranks/5, Suit/spades),
          createCard(Ranks/6, Suit/spades),
          createCard(Ranks/7, Suit/spades),
          createCard(Ranks/9, Suit/spades),
          createCard(Ranks/10, Suit/spades),
          createCard(Ranks/J, Suit/spades),
          createCard(Ranks/Q, Suit/spades),
          createCard(Ranks/K, Suit/spades),
          createCard(Ranks/A, Suit/clubs),
          createCard(Ranks/2, Suit/clubs), 
          createCard(Ranks/3, Suit/clubs), 
          createCard(Ranks/4, Suit/clubs),
          createCard(Ranks/5, Suit/clubs),
          createCard(Ranks/6, Suit/clubs),
          createCard(Ranks/7, Suit/clubs),
          createCard(Ranks/9, Suit/clubs),
          createCard(Ranks/10, Suit/clubs),
          createCard(Ranks/J, Suit/clubs),
          createCard(Ranks/Q, Suit/clubs),
          createCard(Ranks/K, Suit/clubs)]
  return deck

def isRed(card):
  open Card: card
  match card.suit:
    case Suit/hearts:
      return 1
    case Suit/diamonds:
      return 1
    case _:
      return 0

def take(n, xs):
  match xs:
    case List/Nil:
      return List/Nil
    case List/Cons:
      switch n:
        case 0:
          return xs.head
        case _:
          return take(n-1, xs.tail)

def list_head(xs):
  return take(0, xs)
