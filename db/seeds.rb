# encoding: utf-8
Programador.destroy_all
Projeto.destroy_all

@jonatas = Programador.create :nome => "Jônatas"
@marlon  = Programador.create :nome => "Marlon"
@lucas   = Programador.create :nome => "Lucão"
@edson   = Programador.create :nome => "Edson"

@long_short = Projeto.create :nome => "L&S", :valor_hora => 50
@dod        = Projeto.create :nome => "DOD", :valor_hora => 50
@pad        = Projeto.create :nome => "Pad", :valor_hora => 65

