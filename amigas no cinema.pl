/* A resposta será do tipo
S = cinema(amiga(_,_,_,_,_),
           amiga(_,_,_,_,_),
           amiga(_,_,_,_,_),
           amiga(_,_,_,_,_),
           amiga(_,_,_,_,_)),
*/

resolve(S) :-
    S = cinema(amiga(_,_,_,_,_),
               amiga(_,_,_,_,_),
               amiga(_,_,_,_,_),
               amiga(_,_,_,_,_),
               amiga(_,_,_,_,_)),

    %A mulher com 26 anos está sentada ao lado da que curte filmes de Ficção.
    sentada_ao_lado(A,B,S),
    idade(A,26),
    filme(B,ficcao),
    
    %A Lilian está sentada ao lado da quem gosta de filmes de Ação.
    sentada_ao_lado(C,D,S),
    nome(C,lilian),
    filme(D,acao),
    
    %A que namora o Adriano não está sentada ao lado da mulher que gosta de filmes de Ficção.
    nao_esta_sentada_ao_lado(E,F,S),
    namorado(E,adriano),
    filme(F,ficcao),
    
    %Quem gosta de Comédia está sentada exatamente à esquerda da que tem 26 anos.
    exatamente_a_esquerda(G,H,S),
    filme(G,comedia),
    idade(H,26),
    
    %Quem gosta de Drama está sentada em uma das pontas.
    uma_das_pontas(I,S),
    filme(I,drama),
    
    %A moça com 23 anos está sentada exatamente à direita da que curte o estilo Drama.
    exatamente_a_direita(J,K,S),
    idade(J,23),
    filme(K,drama),
    
    %A Lilian está sentada exatamente à esquerda da sua amiga que gosta da cor Branca.
    exatamente_a_esquerda(L,M,S),
    nome(L,lilian),
    cor(M,branca),
    
    %Quem gosta de verde está sentada em uma das pontas.
    uma_das_pontas(N,S),
    cor(N,verde),
    
    %A namorada do Willian está sentada imediatamente à esquerda da sua amiga com 27 anos.
    exatamente_a_esquerda(O,P,S),
    namorado(O,willian),
    idade(P,27),
    
    %A moça que tem 22 anos está sentada exatamente à direita da namorada do Marcelo.
    exatamente_a_direita(Q,R,S),
    idade(Q,22),
    namorado(R,marcelo),
    
    %Quem tem 22 anos está sentada em algum lugar à direita da namorada do Willian.
    algum_lugar_a_direita(T,U,S),
    idade(T,22),
    namorado(U,willian),
    
    %A Lilian está sentada à esquerda de quem namora o Flávio.
    algum_lugar_a_esquerda(V,W,S),
    nome(V,lilian),
    namorado(W,flavio),
    
    %A namorada do Adriano tem 25 anos de idade.
    amiga(X,S),
    idade(X,25),
    namorado(X,adriano),
    
    %A Fernanda adora a cor amarela.
    amiga(Y,S),
    nome(Y,fernanda),
    cor(Y,amarelo),
    
    %A Rosana está sentada na cadeira mais a direita.
    mais_a_direita(Z,S),
    nome(Z,rosana),
    
    %A Luciana está sentada ao lado da sua amiga de 27 anos.
    sentada_ao_lado(A1,B1,S),
    nome(A1,luciana),
    idade(B1,27),
    
    %As garotas que curtem amarelo e vermelho estão sentadas na quarta e quinta posições, respectivamente.
    quarta(C1,S),
    cor(C1,amarelo),
    
    quinta(D1,S),
    cor(D1,vermelho),
    
    %Quem gosta de ver filmes de Romance não está sentada ao lado de quem curte a cor Azul.
    nao_esta_sentada_ao_lado(E1,F1,S),
    filme(E1,romance),
    cor(F1,azul),
    
    %fechamento
    amiga(G1,S),
    nome(G1,carina),
    
    amiga(H1,S),
    namorado(H1,rodrigo).


amiga(X,cinema(X,_,_,_,_)).
amiga(X,cinema(_,X,_,_,_)).
amiga(X,cinema(_,_,X,_,_)).
amiga(X,cinema(_,_,_,X,_)).
amiga(X,cinema(_,_,_,_,X)).


nome(amiga(X,_,_,_,_),X).
namorado(amiga(_,X,_,_,_),X).
idade(amiga(_,_,X,_,_),X).
cor(amiga(_,_,_,X,_),X).
filme(amiga(_,_,_,_,X),X).

uma_das_pontas(X,cinema(X,_,_,_,_)).
uma_das_pontas(X,cinema(_,_,_,_,X)).

algum_lugar_a_esquerda(X,Y,cinema(X,Y,_,_,_)).
algum_lugar_a_esquerda(X,Y,cinema(X,_,Y,_,_)).
algum_lugar_a_esquerda(X,Y,cinema(X,_,_,Y,_)).
algum_lugar_a_esquerda(X,Y,cinema(X,_,_,_,Y)).
algum_lugar_a_esquerda(X,Y,cinema(_,X,Y,_,_)).
algum_lugar_a_esquerda(X,Y,cinema(_,X,_,Y,_)).
algum_lugar_a_esquerda(X,Y,cinema(_,X,_,_,Y)).
algum_lugar_a_esquerda(X,Y,cinema(_,_,X,Y,_)).
algum_lugar_a_esquerda(X,Y,cinema(_,_,X,_,Y)).
algum_lugar_a_esquerda(X,Y,cinema(_,_,_,X,Y)).

algum_lugar_a_direita(X,Y,S) :- algum_lugar_a_esquerda(Y,X,S).

exatamente_a_esquerda(X,Y,cinema(X,Y,_,_,_)).
exatamente_a_esquerda(X,Y,cinema(_,X,Y,_,_)).
exatamente_a_esquerda(X,Y,cinema(_,_,X,Y,_)).
exatamente_a_esquerda(X,Y,cinema(_,_,_,X,Y)).


exatamente_a_direita(X,Y,S) :- exatamente_a_esquerda(Y,X,S).


sentada_ao_lado(X,Y,S) :- exatamente_a_direita(X,Y,S).
sentada_ao_lado(X,Y,S) :- exatamente_a_esquerda(X,Y,S).

mais_a_direita(X,cinema(_,_,_,_,X)).

quarta(X,cinema(_,_,_,X,_)).
quinta(X,cinema(_,_,_,_,X)).

nao_esta_sentada_ao_lado(X,Y,cinema(X,_,Y,_,_)).
nao_esta_sentada_ao_lado(X,Y,cinema(X,_,_,Y,_)).
nao_esta_sentada_ao_lado(X,Y,cinema(X,_,_,_,Y)).
nao_esta_sentada_ao_lado(X,Y,cinema(_,X,_,Y,_)).
nao_esta_sentada_ao_lado(X,Y,cinema(_,X,_,_,Y)).
nao_esta_sentada_ao_lado(X,Y,cinema(_,_,X,_,Y)).
nao_esta_sentada_ao_lado(X,Y,cinema(Y,_,X,_,_)).
nao_esta_sentada_ao_lado(X,Y,cinema(Y,_,_,X,_)).
nao_esta_sentada_ao_lado(X,Y,cinema(_,Y,_,X,_)).
nao_esta_sentada_ao_lado(X,Y,cinema(Y,_,_,_,X)).
nao_esta_sentada_ao_lado(X,Y,cinema(_,Y,_,_,X)).
nao_esta_sentada_ao_lado(X,Y,cinema(_,_,Y,_,X)).




    


    
    
    
    
    
    



