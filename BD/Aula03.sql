--Exercícios:
--a) Fazer um algoritmo que leia 1 número e mostre se são múltiplos de 2,3,5 ou nenhum deles
DECLARE @num INT

SET @num = 3

IF (@num % 2 = 0) BEGIN
PRINT ('O número: ' + CAST(@num AS VARCHAR(100)) + ' é multiplo de 2')
END
ELSE BEGIN
PRINT ('O número: ' + CAST(@num AS VARCHAR(100)) + ' não é multiplo de 2')
END

IF (@num % 3 = 0) BEGIN
PRINT ('O número: ' + CAST(@num AS VARCHAR(100)) + ' é multiplo de 3')
END
ELSE BEGIN
PRINT ('O número: ' + CAST(@num AS VARCHAR(100)) + ' não é multiplo de 3')
END

IF (@num % 5 = 0) BEGIN
PRINT ('O número: ' + CAST(@num AS VARCHAR(100)) + ' é multiplo de 5')
END
ELSE BEGIN
PRINT ('O número: ' + CAST(@num AS VARCHAR(100)) + ' não é multiplo de 5')
END

--b)  Fazer um algoritmo que leia 3 números e mostre o maior e o menor
DECLARE @num1 INT,
				@num2 INT,
				@num3 INT,
				@maior INT,
				@menor INT

SET @num1 = 5
SET @num2 = 10
SET	@num3 = 2

IF (@num1 < @num2) BEGIN 
	IF (@num1 < @num3) BEGIN 
	SET @menor = @num1
	END
	ELSE BEGIN
	SET @menor = @num3
	END
END
ELSE BEGIN 
	IF (@num2 < @num3) BEGIN 
	SET @menor = @num2
	END
	ELSE BEGIN
	SET @menor = @num3
	END
END
IF (@num1 > @num2) BEGIN 
	IF (@num1 > @num3) BEGIN 
	SET @maior = @num1
	END
	ELSE BEGIN
	SET @maior = @num3
	END
END
ELSE BEGIN 
	IF (@num2 > @num3) BEGIN 
	SET @maior = @num2
	END
	ELSE BEGIN
	SET @maior = @num3
	END
END
PRINT ('Menor: ' + CAST(@menor AS VARCHAR(10))  + ' Maior: ' + CAST(@maior AS VARCHAR(10)))

--c) Fazer um algoritmo que calcule e exiba os 15 primeiros termos da série 1,1,2,3,5,8,13,21,... 
--E, posteriormente, calcule e exiba a soma dos 15 termos
DECLARE @soma INT,
				 @cont INT,
				 @cont2 INT,
				 @cont3 INT

SET @soma = 0
SET @cont = 0
SET @cont2 = 0
SET @cont3 = 1

WHILE (@cont < 15) BEGIN
	SET @cont2 = @cont2 + @cont3
	SET @cont3 = @cont2 - @cont3
	SET @cont = @cont + 1
	SET @soma = @soma + @cont2
	PRINT (@cont2)
END

PRINT ('Soma: ' + CAST(@soma AS VARCHAR(10)))

--d) Fazer um algoritmo que separa uma frase, colocando todas as letras em maiúsculo e em minúsculo 
--(Usar funções UPPER e LOWER). Deve exibir o resultado ao final.
DECLARE @frase VARCHAR(100) 
SET @frase = 'O filho feio não tem pai :)'
SELECT UPPER(@frase) AS Frase
SELECT LOWER(@frase) AS Frase

--e) Fazer um algoritmo que inverta uma palavra (Usar a função SUBSTRING). Deve exibir o resultado ao final.
DECLARE @palavra VARCHAR(100),
				  @palavraInver VARCHAR(100),
				  @cont INT 

SET @palavra = 'Paralelepipedo'
SET @palavraInver = ''
SET @cont = LEN(@palavra)

WHILE (@cont > 0 )BEGIN
    SET @palavraInver = @palavraInver + SUBSTRING(@palavra, @cont, 1);
    SET @cont = @cont - 1;
END;

PRINT ('A palavra: ' + @palavra + ' invertida fica: ' + @palavraInver )