###################################
# Script comparacao usuario e senha 
# Autor: Manassés 
# Data: 11/09/2019
# Versao: 1
###########################
import-module ActiveDirectory
cls
$arquivo = Get-Content C:\script\teste.csv  #carrega o arquivo que contem os logins para teste.

$password = "password@teste" #senha usada para comparacao
$linhas= 1002          # Quantidade de linhas/usuarios do arquivo

#Funcao para teste de login/senha
#Creditos da funcao https://itpro-tips.com/2019/test-ad-authentication-via-powershell/
Function Test-ADAuthentication {
    param(
        $username,
        $password)
    
    (New-Object DirectoryServices.DirectoryEntry "",$username,$password).psbase.name -ne $null
}


# Laço testar linha por linha do arquivo
for ($i=0;$i -le $linhas;$i++){ 
#Usando de fato a funcao, para comparar cada login com a senha para teste, caso a senha seja válida a saída sera True
        if (Test-ADAuthentication -username $arquivo[$i] -password $password -eq "True"){
        #imprime na tela se encontrar o usuario
        echo $arquivo[$i]
         }
      
    }
