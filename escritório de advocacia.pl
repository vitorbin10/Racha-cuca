/* A resposta será do tipo
S = advocacia(advogado(_,_,_,_,_,_),
              advogado(_,_,_,_,_,_),
              advogado(_,_,_,_,_,_),
              advogado(_,_,_,_,_,_),
              advogado(_,_,_,_,_,_)),
*/


resolve(S) :-
    S = advocacia(advogado(_,_,_,_,_,_),
                  advogado(_,_,_,_,_,_),
                  advogado(_,_,_,_,_,_),
                  advogado(_,_,_,_,_,_),
                  advogado(_,_,_,_,_,_)),


    %O dono do SUV está em algum lugar entre o dono do Crossover e o dono do Sedan, nessa ordem.
    algum_lugar_entre(B,D,E,S),
    carro(B,suv),
    carro(D,crossover),
    carro(E,sedan),
     
    %Dr. Luiz dirige um SUV.
    advogado(C,S),
    nome(C,drluiz),
    carro(C,suv),
    
    %O advogado de gravata Amarela está em algum lugar à esquerda do motorista do Hatch. 
    algum_lugar_a_esquerda(F,G,S),
    gravata(F,amarela),
    carro(G,hatch),
    
    %Na primeira posição está o advogado que tem um Crossover.
    primeiro(H,S),
    carro(H,crossover),
    
    %O advogado de 37 anos está na quarta posição.
    quarta(I,S),
    idade(I,37),
    
    %O advogado de 34 anos está em algum lugar entre o Dr. Otávio e o advogado da área Civil.
    algum_lugar_entre(J,K,L,S),
    idade(J,34),
    nome(K,drotavio),
    area(L,civil),
    
    %O advogado mais novo está na segunda posição.
    segunda(M,S),
    idade(M,30),
    
    %Quem gosta de Mojito está exatamente à direita do advogado de 40 anos.
    exatamente_a_direita(N,O,S),
    idade(O,40),
    bebida(N,mojito),
    
    %O advogado de 34 anos está exatamente à esquerda do que bebe Cosmopolitan.
    exatamente_a_esquerda(P,Q,S),
    idade(P,34),
    bebida(Q,cosmopolitan),
    
    %Na quinta posição está o advogado que gosta de Caipirinha.
    quinta(R,S),
    bebida(R,caipirinha),
    
    %Quem gosta de Martini está na terceira posição.
    terceira(T,S),
    bebida(T,martini),
    
    %O dono do SUV está na quarta posição.
    quarta(U,S),
    carro(U,suv),
    
    %Dr. Carlos está em uma das pontas.
    uma_das_pontas(V,S),
    nome(V,drcarlos),
    
    %Dr. Ulysses está em algum lugar à direita de quem está com a gravata Amarela.
    algum_lugar_a_direita(W,X,S),
    nome(W,drulysses),
    gravata(X,amarela),
    
    %O advogado da gravata Amarela está em algum lugar entre o Dr. Otávio e o advogado de 34 anos, nessa ordem.
    algum_lugar_entre(Y,Z,A1,S),
    gravata(Y,amarela),
    nome(Z,drotavio),
    idade(A1,34),
    
    %O advogado da área Civil está na quarta posição.
    quarta(B1,S),
    area(B1,civil),
    
    %Os advogados das áreas Trabalhista e Comercial estão lado a lado.
    lado_a_lado(C1,D1,S),
    area(C1,trabalhista),
    area(D1,comercial),
    
    %O advogado da área Trabalhista está em algum lugar entre o dono do Crossover e o advogado da área Comercial, nessa ordem.
    algum_lugar_entre(E1,F1,G1,S),
    area(E1,trabalhista),
    carro(F1,crossover),
    area(G1,comercial),
    
    %O advogado da área Imobiliária está exatamente à esquerda do advogado da área Trabalhista.
    exatamente_a_esquerda(H1,I1,S),
    area(H1,imobiliaria),
    area(I1,trabalhista),
    
    %Quem está usando a gravata Branca está exatamente à direita do Dr. Luiz.
    exatamente_a_direita(J1,K1,S),
    gravata(J1,branca),
    nome(K1,drluiz),
    
    %Na quarta posição está o advogado da gravata Vermelha.
    quarta(L1,S),
    gravata(L1,vermelha),
    
    %Na terceira posição está o advogado da gravata Azul.
    terceira(M1,S),
    gravata(M1,azul),

    %fechamento
    advogado(N1,S),
    carro(N1,pickup),
    
    advogado(O1,S),
    idade(O1,44),

    advogado(P1,S),
    bebida(P1,margarita),

    advogado(Q1,S),
    nome(Q1,dralberto),

    advogado(R1,S),
    area(R1,consumidor),

    advogado(S1,S),
    gravata(S1,vermelha),
    
    advogado(P1,S),
    gravata(P1,verde).
    


advogado(X,advocacia(X,_,_,_,_)).
advogado(X,advocacia(_,X,_,_,_)).
advogado(X,advocacia(_,_,X,_,_)).
advogado(X,advocacia(_,_,_,X,_)).
advogado(X,advocacia(_,_,_,_,X)).

gravata(advogado(X,_,_,_,_,_),X).
area(advogado(_,X,_,_,_,_),X).
nome(advogado(_,_,X,_,_,_),X).
bebida(advogado(_,_,_,X,_,_),X).
idade(advogado(_,_,_,_,X,_),X).
carro(advogado(_,_,_,_,_,X),X).

uma_das_pontas(X,advocacia(X,_,_,_,_)).
uma_das_pontas(X,advocacia(_,_,_,_,X)).


exatamente_a_esquerda(X,Y,advocacia(X,Y,_,_,_)).
exatamente_a_esquerda(X,Y,advocacia(_,X,Y,_,_)).
exatamente_a_esquerda(X,Y,advocacia(_,_,X,Y,_)).
exatamente_a_esquerda(X,Y,advocacia(_,_,_,X,Y)).


exatamente_a_direita(X,Y,S) :- exatamente_a_esquerda(Y,X,S).

lado_a_lado(X,Y,S) :- exatamente_a_direita(X,Y,S).
lado_a_lado(X,Y,S) :- exatamente_a_esquerda(X,Y,S).
algum_lugar_a_esquerda(X,Y,advocacia(_,_,_,X,Y)).
algum_lugar_a_esquerda(X,Y,advocacia(X,Y,_,_,_)).
algum_lugar_a_esquerda(X,Y,advocacia(X,_,Y,_,_)).
algum_lugar_a_esquerda(X,Y,advocacia(X,_,_,Y,_)).
algum_lugar_a_esquerda(X,Y,advocacia(X,_,_,_,Y)).
algum_lugar_a_esquerda(X,Y,advocacia(_,X,Y,_,_)).
algum_lugar_a_esquerda(X,Y,advocacia(_,X,_,Y,_)).
algum_lugar_a_esquerda(X,Y,advocacia(_,X,_,_,Y)).
algum_lugar_a_esquerda(X,Y,advocacia(_,_,X,Y,_)).
algum_lugar_a_esquerda(X,Y,advocacia(_,_,X,_,Y)).

algum_lugar_a_direita(X,Y,S) :- algum_lugar_a_esquerda(Y,X,S).



primeiro(X,advocacia(X,_,_,_,_)).
segunda(X,advocacia(_,X,_,_,_)).
terceira(X,advocacia(_,_,X,_,_)).
quarta(X,advocacia(_,_,_,X,_)).
quinta(X,advocacia(_,_,_,_,X)).

algum_lugar_entre(X,Y,Z,advocacia(Y,X,Z,_,_)).
algum_lugar_entre(X,Y,Z,advocacia(Y,X,_,Z,_)).
algum_lugar_entre(X,Y,Z,advocacia(Y,X,_,_,Z)).
algum_lugar_entre(X,Y,Z,advocacia(Y,_,X,Z,_)).
algum_lugar_entre(X,Y,Z,advocacia(Y,_,X,_,Z)).
algum_lugar_entre(X,Y,Z,advocacia(Y,_,_,X,Z)).
algum_lugar_entre(X,Y,Z,advocacia(_,Y,X,Z,_)).
algum_lugar_entre(X,Y,Z,advocacia(_,Y,X,_,Z)).
algum_lugar_entre(X,Y,Z,advocacia(_,Y,_,X,Z)).
algum_lugar_entre(X,Y,Z,advocacia(_,_,Y,X,Z)).















                    
                       




    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
