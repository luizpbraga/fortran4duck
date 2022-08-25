# Compiler

Existem algumas opções disponíveis, por e.x.:
  * gFortran (gcc)
  * iFort    (intel)
  * lFortran (LLVM!)

  Eu vou usar o gfortran ou o ifort para os exemplos desse livro. Motivo? são fáceis de serem instalados. 

  Antes de baixas o compilador, precisamos nos libras de alguns pré-requisitos. Você vai precisar ter instalado na sua máquina os seguintes programas:
  * gcc ( O Pai ) 
  * loading...

  - Como instalar o Gfortran?
    - Se você usa alguma distribuição Debian (bleh), basta fazer:
    ```bash
       $ sudo apt instal gcc-fortran
    ```  
    - Se usa alguma distro Arch:
    ```bash
      $ sudo pacman -S gcc-fortran
    ``` 
  - Como instalar o iFort? (Obs: Esse demora, mano...)

    1. Procure no google por [Intel oneAPI toolkits](https://www.intel.com/content/www/us/en/developer/tools/oneapi/toolkits.html#gs.9nd3gq) ou clique no link.

    2. Clique em Download na área ["Intel oneAPI Base Toolkit"](https://www.intel.com/content/www/us/en/developer/tools/oneapi/base-toolkit-download.html) 
      
    3. Selecione o seu OS => Na hora de selecionar a distribuição você seleciona "Online & Offiline" => No tipo de instalação, selecione "Offline". Vai abrir uma região de "Download", copie e cole no seu terminal o código disponível em "Command Line Download"
    ~~~bash
      $ wget https://registrationcenter-download.intel.com/akdlm/irc_nas/18673/l_BaseKit_p_2022.2.0.262_offline.sh 
      $ sudo sh ./l_BaseKit_p_2022.2.0.262_offline.sh 
    ~~~

    4. Clique em Download na área ["Intel® oneAPI HPC Toolkit High-Performance Computing"](https://www.intel.com/content/www/us/en/developer/tools/oneapi/hpc-toolkit-download.html) 
      
    5. Faça exatamente o que diz o passo "iii", mas agora aparecera outro código. Por e.x.:
    ~~~bash
      $ wget https://registrationcenter-download.intel.com/akdlm/irc_nas/18679/l_HPCKit_p_2022.2.0.191_offline.sh
      $ sudo sh ./l_HPCKit_p_2022.2.0.191_offline.sh 
    ~~~ 
      
    6. Apos a instalacao, você precisa dizer pro seu terminal onde tá o compilador. Como fazer isso? Você precisa adicionar a seguinte linha ao seu arquivo _~/.bashrc_ ou _~/.zshrc_:
    ~~~bash
      export PATH="/opt/intel/oneapi/compiler/2022.1.0/linux/bin/intel64:$PATH"
    ~~~
    
  Top! Agora já podemos pritar nosso "olá mundo!".
  

