SELECT 

distinct B.CODPROD,
SUM(B.QT),
C.DESCRICAO,
--A.VLTOTAL
SUM(B.QT*B.PVENDA)


FROM PCPEDC A, PCPEDI B, PCPRODUT C 

WHERE A.NUMPED = B.NUMPED
AND C.CODPROD = B.CODPROD

 
AND A.DATA between '01-oct-2022' and '31-jan-2023'
AND A.CODUSUR = 20
AND A.CONDVENDA IN (1,14)
AND A.POSICAO NOT IN 'C'


GROUP BY
B.CODPROD,
C.DESCRICAO
--A.VLTOTAL

ORDER BY SUM(B.QT) DESC
