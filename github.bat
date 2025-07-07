@echo off
cls
echo =====================================
echo CONFIGURAR CONTA GIT PARA O ALUNO
echo =====================================
echo.

:: 1. Apagar qualquer credencial do GitHub salva no Windows
echo Apagando credenciais salvas do GitHub...
cmdkey /delete:git:https://github.com >nul 2>&1
cmdkey /delete:github.com >nul 2>&1

:: 2. Coletar nome e email do aluno
set /p nome=Digite seu nome do GitHub: 
set /p email=Digite seu email do GitHub: 

:: 3. Caminho da chave SSH
echo.
echo A chave privada deve estar na pasta do aluno. Exemplo: C:\Users\Aluno\.ssh\id_rsa
set /p sshkey=Caminho COMPLETO da chave privada SSH: 

:: 4. Configurar Git LOCALMENTE no repositório (não global)
git config user.name "%nome%"
git config user.email "%email%"

:: 5. Configurar para usar a chave informada
set GIT_SSH_COMMAND=ssh -i "%sshkey%"

:: 6. Testar conexão com GitHub via SSH
echo.
echo Testando conexão SSH com GitHub...
ssh -T git@github.com

echo.
echo =====================================
echo Git configurado com sucesso!
echo Nome: %nome%
echo Email: %email%
echo Chave SSH usada: %sshkey%
echo =====================================
pause
